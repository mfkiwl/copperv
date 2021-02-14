import dataclasses

from scripts.build_tools import Rule, Builder, BuildTool

def c_rules(buildtool):
    buildtool.rules['object'] = Rule(
        command = '$cc $cflags -MD -MF $out.d -c $in -o $out',
        depfile = '$out.d',
        variables = ['cc','cflags'],
    )
    buildtool.rules['preprocess'] = Rule(
        command = '$cc $cflags -c $in -o $out',
        variables = ['cc','cflags'],
    )
    buildtool.rules['link'] = Rule(
        command = '$cc $linkflags $in -o $out',
        variables = ['cc','linkflags'],
    )
    buildtool.rules['verilog_hex'] = Rule(
        command = '$dev_utils hex -objcopy $objcopy -readelf $readelf -elf_file $in -o $out',
        variables = ['dev_utils','objcopy','readelf'],
    )
    buildtool.rules['dissassemble'] = Rule(
        command = '$dev_utils dissassemble $in -o $out -objdump $objdump',
        variables = ['dev_utils','objdump'],
    )

def test_builders(buildtool):
    toolchain = '/home/diegob/cad/riscv/toolchain_multilib/bin/riscv64-unknown-elf-'
    cflags = ['-march=rv32i','-mabi=ilp32']
    buildtool.builders['test_object'] = Builder(
        rule = 'object',
        cc = toolchain + 'gcc',
        cflags = lambda inc_dir: cflags + [f' -I{i}' for i in inc_dir],
        kwargs = ['inc_dir'],
    )
    buildtool.builders['test_preprocess'] = Builder(
        rule = 'preprocess',
        cc = toolchain + 'gcc',
        cflags = lambda **kwargs: (buildtool.test_object.variables['cflags'](**kwargs) + ['-E']),
        kwargs = ['inc_dir'],
    )
    linker_script = buildtool.root/'sim/tests/common/linker.ld'
    buildtool.builders['test_link'] = Builder(
        rule = 'link',
        cc = toolchain + 'gcc',
        linkflags = cflags + [f'-Wl,-T,{linker_script},--strip-debug,-Bstatic','-nostartfiles','-ffreestanding'],
    )
    dev_utils = buildtool.root/'scripts/dev_utils.py'
    buildtool.builders['test_verilog_hex'] = Builder(
        rule = 'verilog_hex',
        objcopy = toolchain + 'objcopy',
        readelf = toolchain + 'readelf',
        dev_utils = dev_utils,
    )
    buildtool.builders['test_dissassemble'] = Builder(
        rule = 'dissassemble',
        dev_utils = dev_utils,
        objdump = toolchain + 'objdump',
    )

def sim_rules(buildtool):
    buildtool.rules['vvp'] = Rule(
        command = 'cd $cwd && vvp $vvpflags $in $plusargs',
        variables = ['cwd','vvpflags','plusargs'],
        pool = 'console',
    )
    buildtool.rules['iverilog'] = Rule(
        command = "cd $cwd && iverilog $iverilogflags $in -o $out",
        variables = ['cwd','iverilogflags'],
    )
    buildtool.rules['vpi'] = Rule(
        command = 'cd $cwd; iverilog-vpi $in',
        variables = ['cwd'],
    )
    buildtool.rules['show_stdout'] = Rule(
        command = 'cat $in | sed "s/^/sim_stdout> /"',
        no_output = True,
    )
    buildtool.rules['gtkwave'] = Rule(
        command = "gtkwave --rcvar 'splash_disable on' -A -a $cwd/sim.gtkw $in",
        variables = ['cwd'],
        pool = 'console',
    )

def sim_builders(buildtool):
    buildtool.builders['sim_run'] = Builder(
        rule = 'vvp',
        cwd = lambda **kwargs: kwargs['cwd'],
        vvpflags = '-M. -mcopperv_tools',
        plusargs = lambda **kwargs: f'+HEX_FILE={kwargs["hex_file"]} +DISS_FILE={kwargs["diss_file"]}',
        kwargs = ['cwd','hex_file','diss_file'],
        implicit = [
            lambda **kwargs: kwargs['hex_file'], # -> list
            lambda **kwargs: kwargs['diss_file'],
        ],
        check_log = 'grep -q "TEST PASSED" $log',
    )
    buildtool.builders['sim_compile'] = Builder(
        rule = 'iverilog',
        cwd = lambda **kwargs: kwargs['cwd'],
        iverilogflags = lambda **kwargs: ['-Wall','-Wno-timescale','-g2012',] + [f' -I{i}' for i in kwargs['inc_dir']],
        kwargs = ['cwd','header_files','tools_vpi','inc_dir'],
        implicit = [
            lambda **kwargs: kwargs['header_files'],
            lambda **kwargs: kwargs['tools_vpi'],
        ],
        check_log = '! grep -q error $log',
    )
    buildtool.builders['vpi'] = Builder(
        rule = 'vpi',
        cwd = lambda **kwargs: kwargs['cwd'],
    )
    buildtool.builders['show_stdout'] = Builder(
        rule = 'show_stdout',
    )
    buildtool.builders['gtkwave'] = Builder(
        rule = 'gtkwave',
        cwd = lambda **kwargs: kwargs['cwd'],
    )

buildtool = BuildTool(
    rules=[c_rules,sim_rules],
    builders=[test_builders,sim_builders]
)

test_root = buildtool.root/'sim/tests'

@dataclasses.dataclass
class Test:
    name: str
    source: list
    inc_dir: list = dataclasses.field(default_factory=list)
    show_stdout: bool = False

tests = dict(
    simple = Test(
        name = 'simple',
        source = [test_root/'common/asm/crt0.S',test_root/'simple/test_0.S'],
        inc_dir = [test_root/'common'],
    ),
    rv32ui = Test(
        name = 'rv32ui',
        source = [test_root/'common/asm/crt0.S']
            + list((test_root/'isa/rv32ui').glob('*.S')),
        inc_dir = [
            test_root/'common',
            test_root/'isa'
        ],
    ),
    hello_world = Test(
        name = 'hello_world',
        source = [test_root/'common/c/crt0.S']
            + list((test_root/'hello_world').glob('*.c')),
        inc_dir = [
            test_root/'common',
            test_root/'common/c',
        ],
        show_stdout = True,
    ),
    dhrystone = Test(
        name = 'dhrystone',
        source = [test_root/'common/c/crt0.S']
            + list((test_root/'dhrystone').glob('*.c')),
        inc_dir = [
            test_root/'common',
            test_root/'common/c',
            test_root/'dhrystone',
        ],
        show_stdout = True,
    ),
)
