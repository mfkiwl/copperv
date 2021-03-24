import sys
from pathlib import Path
sys.path.append(str(Path(__file__).resolve().parent.parent))
from scripts.build_tools import Rule, Builder, BuildTool
import pytest
import re

def split(x):
    return re.split(r'\s+',x)

@pytest.fixture
def fake_project(tmp_path: Path):
    test_files = ['source_1']
    files = {}
    for i,name in enumerate(test_files):
        f = tmp_path/name
        f.write_text(f'test file #{i}')
        files[name] = f
    return dict(root=tmp_path,files=files)

def checkcmd(capfd,cmd):
    __tracebackhide__ = True
    passed = False
    backend_out = capfd.readouterr().out
    for line in backend_out.splitlines():
        if cmd[0] in line:
            if split(line)[1:] == cmd:
                passed = True
                break
    if not passed:
        pytest.fail(f'Command "{" ".join(cmd)}" not found in backend output\nBackend output:\n{backend_out}')

    #pytest.param({},{},'a_val',KeyError,id='undefined_var'),
    #pytest.param({'a':lambda b: b + '_lambda'},{},'b_call_lambda',KeyError,id='lambda_builder_var_from_call_var_missing_input'),
    #pytest.param({},{'a':lambda b: b + '_lambda'},'b_builder_lambda',KeyError,id='lambda_call_var_from_builder_var_missing_input'),
    #pytest.param({'a':lambda a: a + '_lambda'},{'a':lambda a: a + '_lambda_call'},'a_lambda_call_lambda',KeyError,id='lambda_builder_var_from_lambda_call_var'),

@pytest.mark.parametrize("builder_args,call_args,expected_a_val", [
    pytest.param({'a':'a_builder'},{},'a_builder',id='builder_defined_var'),
    pytest.param({},{'a':'a_call'},'a_call',id='call_defined_var'),
    pytest.param({'a':'a_$b'},{'b':'b_call'},'a_b_call',id='builder_var_from_call_var'),
    pytest.param({'b':'b_builder'},{'a':'a_$b'},'a_b_builder',id='call_var_from_builder_var'),
    pytest.param({'a':'a_$b','b':'b_builder'},{},'a_b_builder',id='builder_var_from_builder_var'),
    pytest.param({},{'a':'a_$b','b':'b_call'},'a_b_call',id='call_var_from_call_var'),
])
def test_simple_build(builder_args, call_args, expected_a_val, fake_project: Path, capfd):
    def rules(buildtool):
        buildtool.rules['rule1'] = Rule(
            command = '$a $in $out',
            variables = ['a'],
        )
    def builders(buildtool):
        buildtool.builders['builder1'] = Builder(
            rule = 'rule1',
            **builder_args,
        )
    buildtool = BuildTool(
        root = fake_project['root'],
        rules=[rules],
        builders=[builders],
    )
    target = buildtool.builder1(
        source = '$source_dir/source_1',
        target = '$target_dir/target_1',
        **call_args,
    )
    assert target == 'target_1'
    writer = buildtool.run(ninja_opts='-n')
    checkcmd(capfd,[expected_a_val,str(fake_project["files"]["source_1"]),str(fake_project["root"]/'work/target_1')])

