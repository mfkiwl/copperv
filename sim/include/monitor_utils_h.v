// File generated by monitor_utils.py 2020-07-05 01:29:23.974515

function `STRING state;
input [`STATE_WIDTH-1:0] arg;
begin
    case (arg)
        `STATE_RESET:
            state = "RESET";
        `STATE_IDLE:
            state = "IDLE";
        `STATE_FETCH:
            state = "FETCH";
        `STATE_DECODE:
            state = "DECODE";
        `STATE_EXEC:
            state = "EXEC";
        `STATE_MEM:
            state = "MEM";
        default:
            state = "UNKNOWN";
    endcase
end
endfunction

function `STRING inst_type;
input [`INST_TYPE_WIDTH-1:0] arg;
begin
    case (arg)
        `INST_TYPE_IMM:
            inst_type = "IMM";
        `INST_TYPE_INT_IMM:
            inst_type = "INT_IMM";
        `INST_TYPE_INT_REG:
            inst_type = "INT_REG";
        `INST_TYPE_BRANCH:
            inst_type = "BRANCH";
        `INST_TYPE_STORE:
            inst_type = "STORE";
        `INST_TYPE_JAL:
            inst_type = "JAL";
        default:
            inst_type = "UNKNOWN";
    endcase
end
endfunction

function `STRING funct;
input [`FUNCT_WIDTH-1:0] arg;
begin
    case (arg)
        `FUNCT_ADD:
            funct = "ADD";
        `FUNCT_SUB:
            funct = "SUB";
        `FUNCT_AND:
            funct = "AND";
        `FUNCT_EQ:
            funct = "EQ";
        `FUNCT_NEQ:
            funct = "NEQ";
        `FUNCT_LT:
            funct = "LT";
        `FUNCT_GTE:
            funct = "GTE";
        `FUNCT_LTU:
            funct = "LTU";
        `FUNCT_GTEU:
            funct = "GTEU";
        `FUNCT_MEM_BYTE:
            funct = "MEM_BYTE";
        `FUNCT_MEM_HWORD:
            funct = "MEM_HWORD";
        `FUNCT_MEM_WORD:
            funct = "MEM_WORD";
        `FUNCT_JAL:
            funct = "JAL";
        default:
            funct = "UNKNOWN";
    endcase
end
endfunction

function `STRING pc_next_sel;
input [`PC_NEXT_SEL_WIDTH-1:0] arg;
begin
    case (arg)
        `PC_NEXT_SEL_STALL:
            pc_next_sel = "STALL";
        `PC_NEXT_SEL_INCR:
            pc_next_sel = "INCR";
        `PC_NEXT_SEL_ADD_IMM:
            pc_next_sel = "ADD_IMM";
        default:
            pc_next_sel = "UNKNOWN";
    endcase
end
endfunction

function `STRING alu_op;
input [`ALU_OP_WIDTH-1:0] arg;
begin
    case (arg)
        `ALU_OP_NOP:
            alu_op = "NOP";
        `ALU_OP_ADD:
            alu_op = "ADD";
        `ALU_OP_SUB:
            alu_op = "SUB";
        `ALU_OP_AND:
            alu_op = "AND";
        default:
            alu_op = "UNKNOWN";
    endcase
end
endfunction

function `STRING dissassembly;
input [`PC_WIDTH-1:0] arg;
begin
    case (arg)
        32'h0:
            dissassembly = "0:    ff0100b7  lui   ra,0xff010";
        32'h4:
            dissassembly = "4:    f0008093  addi  ra,ra,-256 # ff00ff00 <end+0xff00fa20>";
        32'h8:
            dissassembly = "8:    0f0f1137  lui   sp,0xf0f1";
        32'hc:
            dissassembly = "c:    f0f10113  addi  sp,sp,-241 # f0f0f0f <end+0xf0f0a2f>";
        32'h10:
            dissassembly = "10:   0020c733  xor   a4,ra,sp";
        32'h14:
            dissassembly = "14:   f00ff3b7  lui   t2,0xf00ff";
        32'h18:
            dissassembly = "18:   00f38393  addi  t2,t2,15 # f00ff00f <end+0xf00feb2f>";
        32'h1c:
            dissassembly = "1c:   00200e13  addi  t3,zero,2";
        32'h20:
            dissassembly = "20:   4a771063  bne   a4,t2,4c0 <fail>";
        32'h24:
            dissassembly = "24:   0ff010b7  lui   ra,0xff01";
        32'h28:
            dissassembly = "28:   ff008093  addi  ra,ra,-16 # ff00ff0 <end+0xff00b10>";
        32'h2c:
            dissassembly = "2c:   f0f0f137  lui   sp,0xf0f0f";
        32'h30:
            dissassembly = "30:   0f010113  addi  sp,sp,240 # f0f0f0f0 <end+0xf0f0ec10>";
        32'h34:
            dissassembly = "34:   0020c733  xor   a4,ra,sp";
        32'h38:
            dissassembly = "38:   ff0103b7  lui   t2,0xff010";
        32'h3c:
            dissassembly = "3c:   f0038393  addi  t2,t2,-256 # ff00ff00 <end+0xff00fa20>";
        32'h40:
            dissassembly = "40:   00300e13  addi  t3,zero,3";
        32'h44:
            dissassembly = "44:   46771e63  bne   a4,t2,4c0 <fail>";
        32'h48:
            dissassembly = "48:   00ff00b7  lui   ra,0xff0";
        32'h4c:
            dissassembly = "4c:   0ff08093  addi  ra,ra,255 # ff00ff <end+0xfefc1f>";
        32'h50:
            dissassembly = "50:   0f0f1137  lui   sp,0xf0f1";
        32'h54:
            dissassembly = "54:   f0f10113  addi  sp,sp,-241 # f0f0f0f <end+0xf0f0a2f>";
        32'h58:
            dissassembly = "58:   0020c733  xor   a4,ra,sp";
        32'h5c:
            dissassembly = "5c:   0ff013b7  lui   t2,0xff01";
        32'h60:
            dissassembly = "60:   ff038393  addi  t2,t2,-16 # ff00ff0 <end+0xff00b10>";
        32'h64:
            dissassembly = "64:   00400e13  addi  t3,zero,4";
        32'h68:
            dissassembly = "68:   44771c63  bne   a4,t2,4c0 <fail>";
        32'h6c:
            dissassembly = "6c:   f00ff0b7  lui   ra,0xf00ff";
        32'h70:
            dissassembly = "70:   00f08093  addi  ra,ra,15 # f00ff00f <end+0xf00feb2f>";
        32'h74:
            dissassembly = "74:   f0f0f137  lui   sp,0xf0f0f";
        32'h78:
            dissassembly = "78:   0f010113  addi  sp,sp,240 # f0f0f0f0 <end+0xf0f0ec10>";
        32'h7c:
            dissassembly = "7c:   0020c733  xor   a4,ra,sp";
        32'h80:
            dissassembly = "80:   00ff03b7  lui   t2,0xff0";
        32'h84:
            dissassembly = "84:   0ff38393  addi  t2,t2,255 # ff00ff <end+0xfefc1f>";
        32'h88:
            dissassembly = "88:   00500e13  addi  t3,zero,5";
        32'h8c:
            dissassembly = "8c:   42771a63  bne   a4,t2,4c0 <fail>";
        32'h90:
            dissassembly = "90:   ff0100b7  lui   ra,0xff010";
        32'h94:
            dissassembly = "94:   f0008093  addi  ra,ra,-256 # ff00ff00 <end+0xff00fa20>";
        32'h98:
            dissassembly = "98:   0f0f1137  lui   sp,0xf0f1";
        32'h9c:
            dissassembly = "9c:   f0f10113  addi  sp,sp,-241 # f0f0f0f <end+0xf0f0a2f>";
        32'ha0:
            dissassembly = "a0:   0020c0b3  xor   ra,ra,sp";
        32'ha4:
            dissassembly = "a4:   f00ff3b7  lui   t2,0xf00ff";
        32'ha8:
            dissassembly = "a8:   00f38393  addi  t2,t2,15 # f00ff00f <end+0xf00feb2f>";
        32'hac:
            dissassembly = "ac:   00600e13  addi  t3,zero,6";
        32'hb0:
            dissassembly = "b0:   40709863  bne   ra,t2,4c0 <fail>";
        32'hb4:
            dissassembly = "b4:   ff0100b7  lui   ra,0xff010";
        32'hb8:
            dissassembly = "b8:   f0008093  addi  ra,ra,-256 # ff00ff00 <end+0xff00fa20>";
        32'hbc:
            dissassembly = "bc:   0f0f1137  lui   sp,0xf0f1";
        32'hc0:
            dissassembly = "c0:   f0f10113  addi  sp,sp,-241 # f0f0f0f <end+0xf0f0a2f>";
        32'hc4:
            dissassembly = "c4:   0020c133  xor   sp,ra,sp";
        32'hc8:
            dissassembly = "c8:   f00ff3b7  lui   t2,0xf00ff";
        32'hcc:
            dissassembly = "cc:   00f38393  addi  t2,t2,15 # f00ff00f <end+0xf00feb2f>";
        32'hd0:
            dissassembly = "d0:   00700e13  addi  t3,zero,7";
        32'hd4:
            dissassembly = "d4:   3e711663  bne   sp,t2,4c0 <fail>";
        32'hd8:
            dissassembly = "d8:   ff0100b7  lui   ra,0xff010";
        32'hdc:
            dissassembly = "dc:   f0008093  addi  ra,ra,-256 # ff00ff00 <end+0xff00fa20>";
        32'he0:
            dissassembly = "e0:   0010c0b3  xor   ra,ra,ra";
        32'he4:
            dissassembly = "e4:   00000393  addi  t2,zero,0";
        32'he8:
            dissassembly = "e8:   00800e13  addi  t3,zero,8";
        32'hec:
            dissassembly = "ec:   3c709a63  bne   ra,t2,4c0 <fail>";
        32'hf0:
            dissassembly = "f0:   00000213  addi  tp,zero,0";
        32'hf4:
            dissassembly = "f4:   ff0100b7  lui   ra,0xff010";
        32'hf8:
            dissassembly = "f8:   f0008093  addi  ra,ra,-256 # ff00ff00 <end+0xff00fa20>";
        32'hfc:
            dissassembly = "fc:   0f0f1137  lui   sp,0xf0f1";
        32'h100:
            dissassembly = "100:  f0f10113  addi  sp,sp,-241 # f0f0f0f <end+0xf0f0a2f>";
        32'h104:
            dissassembly = "104:  0020c733  xor   a4,ra,sp";
        32'h108:
            dissassembly = "108:  00070313  addi  t1,a4,0";
        32'h10c:
            dissassembly = "10c:  00120213  addi  tp,tp,1 # 1 <test_2+0x1>";
        32'h110:
            dissassembly = "110:  00200293  addi  t0,zero,2";
        32'h114:
            dissassembly = "114:  fe5210e3  bne   tp,t0,f4 <test_9+0x4>";
        32'h118:
            dissassembly = "118:  f00ff3b7  lui   t2,0xf00ff";
        32'h11c:
            dissassembly = "11c:  00f38393  addi  t2,t2,15 # f00ff00f <end+0xf00feb2f>";
        32'h120:
            dissassembly = "120:  00900e13  addi  t3,zero,9";
        32'h124:
            dissassembly = "124:  38731e63  bne   t1,t2,4c0 <fail>";
        32'h128:
            dissassembly = "128:  00000213  addi  tp,zero,0";
        32'h12c:
            dissassembly = "12c:  0ff010b7  lui   ra,0xff01";
        32'h130:
            dissassembly = "130:  ff008093  addi  ra,ra,-16 # ff00ff0 <end+0xff00b10>";
        32'h134:
            dissassembly = "134:  f0f0f137  lui   sp,0xf0f0f";
        32'h138:
            dissassembly = "138:  0f010113  addi  sp,sp,240 # f0f0f0f0 <end+0xf0f0ec10>";
        32'h13c:
            dissassembly = "13c:  0020c733  xor   a4,ra,sp";
        32'h140:
            dissassembly = "140:  00000013  addi  zero,zero,0";
        32'h144:
            dissassembly = "144:  00070313  addi  t1,a4,0";
        32'h148:
            dissassembly = "148:  00120213  addi  tp,tp,1 # 1 <test_2+0x1>";
        32'h14c:
            dissassembly = "14c:  00200293  addi  t0,zero,2";
        32'h150:
            dissassembly = "150:  fc521ee3  bne   tp,t0,12c <test_10+0x4>";
        32'h154:
            dissassembly = "154:  ff0103b7  lui   t2,0xff010";
        32'h158:
            dissassembly = "158:  f0038393  addi  t2,t2,-256 # ff00ff00 <end+0xff00fa20>";
        32'h15c:
            dissassembly = "15c:  00a00e13  addi  t3,zero,10";
        32'h160:
            dissassembly = "160:  36731063  bne   t1,t2,4c0 <fail>";
        32'h164:
            dissassembly = "164:  00000213  addi  tp,zero,0";
        32'h168:
            dissassembly = "168:  00ff00b7  lui   ra,0xff0";
        32'h16c:
            dissassembly = "16c:  0ff08093  addi  ra,ra,255 # ff00ff <end+0xfefc1f>";
        32'h170:
            dissassembly = "170:  0f0f1137  lui   sp,0xf0f1";
        32'h174:
            dissassembly = "174:  f0f10113  addi  sp,sp,-241 # f0f0f0f <end+0xf0f0a2f>";
        32'h178:
            dissassembly = "178:  0020c733  xor   a4,ra,sp";
        32'h17c:
            dissassembly = "17c:  00000013  addi  zero,zero,0";
        32'h180:
            dissassembly = "180:  00000013  addi  zero,zero,0";
        32'h184:
            dissassembly = "184:  00070313  addi  t1,a4,0";
        32'h188:
            dissassembly = "188:  00120213  addi  tp,tp,1 # 1 <test_2+0x1>";
        32'h18c:
            dissassembly = "18c:  00200293  addi  t0,zero,2";
        32'h190:
            dissassembly = "190:  fc521ce3  bne   tp,t0,168 <test_11+0x4>";
        32'h194:
            dissassembly = "194:  0ff013b7  lui   t2,0xff01";
        32'h198:
            dissassembly = "198:  ff038393  addi  t2,t2,-16 # ff00ff0 <end+0xff00b10>";
        32'h19c:
            dissassembly = "19c:  00b00e13  addi  t3,zero,11";
        32'h1a0:
            dissassembly = "1a0:  32731063  bne   t1,t2,4c0 <fail>";
        32'h1a4:
            dissassembly = "1a4:  00000213  addi  tp,zero,0";
        32'h1a8:
            dissassembly = "1a8:  ff0100b7  lui   ra,0xff010";
        32'h1ac:
            dissassembly = "1ac:  f0008093  addi  ra,ra,-256 # ff00ff00 <end+0xff00fa20>";
        32'h1b0:
            dissassembly = "1b0:  0f0f1137  lui   sp,0xf0f1";
        32'h1b4:
            dissassembly = "1b4:  f0f10113  addi  sp,sp,-241 # f0f0f0f <end+0xf0f0a2f>";
        32'h1b8:
            dissassembly = "1b8:  0020c733  xor   a4,ra,sp";
        32'h1bc:
            dissassembly = "1bc:  00120213  addi  tp,tp,1 # 1 <test_2+0x1>";
        32'h1c0:
            dissassembly = "1c0:  00200293  addi  t0,zero,2";
        32'h1c4:
            dissassembly = "1c4:  fe5212e3  bne   tp,t0,1a8 <test_12+0x4>";
        32'h1c8:
            dissassembly = "1c8:  f00ff3b7  lui   t2,0xf00ff";
        32'h1cc:
            dissassembly = "1cc:  00f38393  addi  t2,t2,15 # f00ff00f <end+0xf00feb2f>";
        32'h1d0:
            dissassembly = "1d0:  00c00e13  addi  t3,zero,12";
        32'h1d4:
            dissassembly = "1d4:  2e771663  bne   a4,t2,4c0 <fail>";
        32'h1d8:
            dissassembly = "1d8:  00000213  addi  tp,zero,0";
        32'h1dc:
            dissassembly = "1dc:  0ff010b7  lui   ra,0xff01";
        32'h1e0:
            dissassembly = "1e0:  ff008093  addi  ra,ra,-16 # ff00ff0 <end+0xff00b10>";
        32'h1e4:
            dissassembly = "1e4:  f0f0f137  lui   sp,0xf0f0f";
        32'h1e8:
            dissassembly = "1e8:  0f010113  addi  sp,sp,240 # f0f0f0f0 <end+0xf0f0ec10>";
        32'h1ec:
            dissassembly = "1ec:  00000013  addi  zero,zero,0";
        32'h1f0:
            dissassembly = "1f0:  0020c733  xor   a4,ra,sp";
        32'h1f4:
            dissassembly = "1f4:  00120213  addi  tp,tp,1 # 1 <test_2+0x1>";
        32'h1f8:
            dissassembly = "1f8:  00200293  addi  t0,zero,2";
        32'h1fc:
            dissassembly = "1fc:  fe5210e3  bne   tp,t0,1dc <test_13+0x4>";
        32'h200:
            dissassembly = "200:  ff0103b7  lui   t2,0xff010";
        32'h204:
            dissassembly = "204:  f0038393  addi  t2,t2,-256 # ff00ff00 <end+0xff00fa20>";
        32'h208:
            dissassembly = "208:  00d00e13  addi  t3,zero,13";
        32'h20c:
            dissassembly = "20c:  2a771a63  bne   a4,t2,4c0 <fail>";
        32'h210:
            dissassembly = "210:  00000213  addi  tp,zero,0";
        32'h214:
            dissassembly = "214:  00ff00b7  lui   ra,0xff0";
        32'h218:
            dissassembly = "218:  0ff08093  addi  ra,ra,255 # ff00ff <end+0xfefc1f>";
        32'h21c:
            dissassembly = "21c:  0f0f1137  lui   sp,0xf0f1";
        32'h220:
            dissassembly = "220:  f0f10113  addi  sp,sp,-241 # f0f0f0f <end+0xf0f0a2f>";
        32'h224:
            dissassembly = "224:  00000013  addi  zero,zero,0";
        32'h228:
            dissassembly = "228:  00000013  addi  zero,zero,0";
        32'h22c:
            dissassembly = "22c:  0020c733  xor   a4,ra,sp";
        32'h230:
            dissassembly = "230:  00120213  addi  tp,tp,1 # 1 <test_2+0x1>";
        32'h234:
            dissassembly = "234:  00200293  addi  t0,zero,2";
        32'h238:
            dissassembly = "238:  fc521ee3  bne   tp,t0,214 <test_14+0x4>";
        32'h23c:
            dissassembly = "23c:  0ff013b7  lui   t2,0xff01";
        32'h240:
            dissassembly = "240:  ff038393  addi  t2,t2,-16 # ff00ff0 <end+0xff00b10>";
        32'h244:
            dissassembly = "244:  00e00e13  addi  t3,zero,14";
        32'h248:
            dissassembly = "248:  26771c63  bne   a4,t2,4c0 <fail>";
        32'h24c:
            dissassembly = "24c:  00000213  addi  tp,zero,0";
        32'h250:
            dissassembly = "250:  ff0100b7  lui   ra,0xff010";
        32'h254:
            dissassembly = "254:  f0008093  addi  ra,ra,-256 # ff00ff00 <end+0xff00fa20>";
        32'h258:
            dissassembly = "258:  00000013  addi  zero,zero,0";
        32'h25c:
            dissassembly = "25c:  0f0f1137  lui   sp,0xf0f1";
        32'h260:
            dissassembly = "260:  f0f10113  addi  sp,sp,-241 # f0f0f0f <end+0xf0f0a2f>";
        32'h264:
            dissassembly = "264:  0020c733  xor   a4,ra,sp";
        32'h268:
            dissassembly = "268:  00120213  addi  tp,tp,1 # 1 <test_2+0x1>";
        32'h26c:
            dissassembly = "26c:  00200293  addi  t0,zero,2";
        32'h270:
            dissassembly = "270:  fe5210e3  bne   tp,t0,250 <test_15+0x4>";
        32'h274:
            dissassembly = "274:  f00ff3b7  lui   t2,0xf00ff";
        32'h278:
            dissassembly = "278:  00f38393  addi  t2,t2,15 # f00ff00f <end+0xf00feb2f>";
        32'h27c:
            dissassembly = "27c:  00f00e13  addi  t3,zero,15";
        32'h280:
            dissassembly = "280:  24771063  bne   a4,t2,4c0 <fail>";
        32'h284:
            dissassembly = "284:  00000213  addi  tp,zero,0";
        32'h288:
            dissassembly = "288:  0ff010b7  lui   ra,0xff01";
        32'h28c:
            dissassembly = "28c:  ff008093  addi  ra,ra,-16 # ff00ff0 <end+0xff00b10>";
        32'h290:
            dissassembly = "290:  00000013  addi  zero,zero,0";
        32'h294:
            dissassembly = "294:  f0f0f137  lui   sp,0xf0f0f";
        32'h298:
            dissassembly = "298:  0f010113  addi  sp,sp,240 # f0f0f0f0 <end+0xf0f0ec10>";
        32'h29c:
            dissassembly = "29c:  00000013  addi  zero,zero,0";
        32'h2a0:
            dissassembly = "2a0:  0020c733  xor   a4,ra,sp";
        32'h2a4:
            dissassembly = "2a4:  00120213  addi  tp,tp,1 # 1 <test_2+0x1>";
        32'h2a8:
            dissassembly = "2a8:  00200293  addi  t0,zero,2";
        32'h2ac:
            dissassembly = "2ac:  fc521ee3  bne   tp,t0,288 <test_16+0x4>";
        32'h2b0:
            dissassembly = "2b0:  ff0103b7  lui   t2,0xff010";
        32'h2b4:
            dissassembly = "2b4:  f0038393  addi  t2,t2,-256 # ff00ff00 <end+0xff00fa20>";
        32'h2b8:
            dissassembly = "2b8:  01000e13  addi  t3,zero,16";
        32'h2bc:
            dissassembly = "2bc:  20771263  bne   a4,t2,4c0 <fail>";
        32'h2c0:
            dissassembly = "2c0:  00000213  addi  tp,zero,0";
        32'h2c4:
            dissassembly = "2c4:  00ff00b7  lui   ra,0xff0";
        32'h2c8:
            dissassembly = "2c8:  0ff08093  addi  ra,ra,255 # ff00ff <end+0xfefc1f>";
        32'h2cc:
            dissassembly = "2cc:  00000013  addi  zero,zero,0";
        32'h2d0:
            dissassembly = "2d0:  00000013  addi  zero,zero,0";
        32'h2d4:
            dissassembly = "2d4:  0f0f1137  lui   sp,0xf0f1";
        32'h2d8:
            dissassembly = "2d8:  f0f10113  addi  sp,sp,-241 # f0f0f0f <end+0xf0f0a2f>";
        32'h2dc:
            dissassembly = "2dc:  0020c733  xor   a4,ra,sp";
        32'h2e0:
            dissassembly = "2e0:  00120213  addi  tp,tp,1 # 1 <test_2+0x1>";
        32'h2e4:
            dissassembly = "2e4:  00200293  addi  t0,zero,2";
        32'h2e8:
            dissassembly = "2e8:  fc521ee3  bne   tp,t0,2c4 <test_17+0x4>";
        32'h2ec:
            dissassembly = "2ec:  0ff013b7  lui   t2,0xff01";
        32'h2f0:
            dissassembly = "2f0:  ff038393  addi  t2,t2,-16 # ff00ff0 <end+0xff00b10>";
        32'h2f4:
            dissassembly = "2f4:  01100e13  addi  t3,zero,17";
        32'h2f8:
            dissassembly = "2f8:  1c771463  bne   a4,t2,4c0 <fail>";
        32'h2fc:
            dissassembly = "2fc:  00000213  addi  tp,zero,0";
        32'h300:
            dissassembly = "300:  0f0f1137  lui   sp,0xf0f1";
        32'h304:
            dissassembly = "304:  f0f10113  addi  sp,sp,-241 # f0f0f0f <end+0xf0f0a2f>";
        32'h308:
            dissassembly = "308:  ff0100b7  lui   ra,0xff010";
        32'h30c:
            dissassembly = "30c:  f0008093  addi  ra,ra,-256 # ff00ff00 <end+0xff00fa20>";
        32'h310:
            dissassembly = "310:  0020c733  xor   a4,ra,sp";
        32'h314:
            dissassembly = "314:  00120213  addi  tp,tp,1 # 1 <test_2+0x1>";
        32'h318:
            dissassembly = "318:  00200293  addi  t0,zero,2";
        32'h31c:
            dissassembly = "31c:  fe5212e3  bne   tp,t0,300 <test_18+0x4>";
        32'h320:
            dissassembly = "320:  f00ff3b7  lui   t2,0xf00ff";
        32'h324:
            dissassembly = "324:  00f38393  addi  t2,t2,15 # f00ff00f <end+0xf00feb2f>";
        32'h328:
            dissassembly = "328:  01200e13  addi  t3,zero,18";
        32'h32c:
            dissassembly = "32c:  18771a63  bne   a4,t2,4c0 <fail>";
        32'h330:
            dissassembly = "330:  00000213  addi  tp,zero,0";
        32'h334:
            dissassembly = "334:  f0f0f137  lui   sp,0xf0f0f";
        32'h338:
            dissassembly = "338:  0f010113  addi  sp,sp,240 # f0f0f0f0 <end+0xf0f0ec10>";
        32'h33c:
            dissassembly = "33c:  0ff010b7  lui   ra,0xff01";
        32'h340:
            dissassembly = "340:  ff008093  addi  ra,ra,-16 # ff00ff0 <end+0xff00b10>";
        32'h344:
            dissassembly = "344:  00000013  addi  zero,zero,0";
        32'h348:
            dissassembly = "348:  0020c733  xor   a4,ra,sp";
        32'h34c:
            dissassembly = "34c:  00120213  addi  tp,tp,1 # 1 <test_2+0x1>";
        32'h350:
            dissassembly = "350:  00200293  addi  t0,zero,2";
        32'h354:
            dissassembly = "354:  fe5210e3  bne   tp,t0,334 <test_19+0x4>";
        32'h358:
            dissassembly = "358:  ff0103b7  lui   t2,0xff010";
        32'h35c:
            dissassembly = "35c:  f0038393  addi  t2,t2,-256 # ff00ff00 <end+0xff00fa20>";
        32'h360:
            dissassembly = "360:  01300e13  addi  t3,zero,19";
        32'h364:
            dissassembly = "364:  14771e63  bne   a4,t2,4c0 <fail>";
        32'h368:
            dissassembly = "368:  00000213  addi  tp,zero,0";
        32'h36c:
            dissassembly = "36c:  0f0f1137  lui   sp,0xf0f1";
        32'h370:
            dissassembly = "370:  f0f10113  addi  sp,sp,-241 # f0f0f0f <end+0xf0f0a2f>";
        32'h374:
            dissassembly = "374:  00ff00b7  lui   ra,0xff0";
        32'h378:
            dissassembly = "378:  0ff08093  addi  ra,ra,255 # ff00ff <end+0xfefc1f>";
        32'h37c:
            dissassembly = "37c:  00000013  addi  zero,zero,0";
        32'h380:
            dissassembly = "380:  00000013  addi  zero,zero,0";
        32'h384:
            dissassembly = "384:  0020c733  xor   a4,ra,sp";
        32'h388:
            dissassembly = "388:  00120213  addi  tp,tp,1 # 1 <test_2+0x1>";
        32'h38c:
            dissassembly = "38c:  00200293  addi  t0,zero,2";
        32'h390:
            dissassembly = "390:  fc521ee3  bne   tp,t0,36c <test_20+0x4>";
        32'h394:
            dissassembly = "394:  0ff013b7  lui   t2,0xff01";
        32'h398:
            dissassembly = "398:  ff038393  addi  t2,t2,-16 # ff00ff0 <end+0xff00b10>";
        32'h39c:
            dissassembly = "39c:  01400e13  addi  t3,zero,20";
        32'h3a0:
            dissassembly = "3a0:  12771063  bne   a4,t2,4c0 <fail>";
        32'h3a4:
            dissassembly = "3a4:  00000213  addi  tp,zero,0";
        32'h3a8:
            dissassembly = "3a8:  0f0f1137  lui   sp,0xf0f1";
        32'h3ac:
            dissassembly = "3ac:  f0f10113  addi  sp,sp,-241 # f0f0f0f <end+0xf0f0a2f>";
        32'h3b0:
            dissassembly = "3b0:  00000013  addi  zero,zero,0";
        32'h3b4:
            dissassembly = "3b4:  ff0100b7  lui   ra,0xff010";
        32'h3b8:
            dissassembly = "3b8:  f0008093  addi  ra,ra,-256 # ff00ff00 <end+0xff00fa20>";
        32'h3bc:
            dissassembly = "3bc:  0020c733  xor   a4,ra,sp";
        32'h3c0:
            dissassembly = "3c0:  00120213  addi  tp,tp,1 # 1 <test_2+0x1>";
        32'h3c4:
            dissassembly = "3c4:  00200293  addi  t0,zero,2";
        32'h3c8:
            dissassembly = "3c8:  fe5210e3  bne   tp,t0,3a8 <test_21+0x4>";
        32'h3cc:
            dissassembly = "3cc:  f00ff3b7  lui   t2,0xf00ff";
        32'h3d0:
            dissassembly = "3d0:  00f38393  addi  t2,t2,15 # f00ff00f <end+0xf00feb2f>";
        32'h3d4:
            dissassembly = "3d4:  01500e13  addi  t3,zero,21";
        32'h3d8:
            dissassembly = "3d8:  0e771463  bne   a4,t2,4c0 <fail>";
        32'h3dc:
            dissassembly = "3dc:  00000213  addi  tp,zero,0";
        32'h3e0:
            dissassembly = "3e0:  f0f0f137  lui   sp,0xf0f0f";
        32'h3e4:
            dissassembly = "3e4:  0f010113  addi  sp,sp,240 # f0f0f0f0 <end+0xf0f0ec10>";
        32'h3e8:
            dissassembly = "3e8:  00000013  addi  zero,zero,0";
        32'h3ec:
            dissassembly = "3ec:  0ff010b7  lui   ra,0xff01";
        32'h3f0:
            dissassembly = "3f0:  ff008093  addi  ra,ra,-16 # ff00ff0 <end+0xff00b10>";
        32'h3f4:
            dissassembly = "3f4:  00000013  addi  zero,zero,0";
        32'h3f8:
            dissassembly = "3f8:  0020c733  xor   a4,ra,sp";
        32'h3fc:
            dissassembly = "3fc:  00120213  addi  tp,tp,1 # 1 <test_2+0x1>";
        32'h400:
            dissassembly = "400:  00200293  addi  t0,zero,2";
        32'h404:
            dissassembly = "404:  fc521ee3  bne   tp,t0,3e0 <test_22+0x4>";
        32'h408:
            dissassembly = "408:  ff0103b7  lui   t2,0xff010";
        32'h40c:
            dissassembly = "40c:  f0038393  addi  t2,t2,-256 # ff00ff00 <end+0xff00fa20>";
        32'h410:
            dissassembly = "410:  01600e13  addi  t3,zero,22";
        32'h414:
            dissassembly = "414:  0a771663  bne   a4,t2,4c0 <fail>";
        32'h418:
            dissassembly = "418:  00000213  addi  tp,zero,0";
        32'h41c:
            dissassembly = "41c:  0f0f1137  lui   sp,0xf0f1";
        32'h420:
            dissassembly = "420:  f0f10113  addi  sp,sp,-241 # f0f0f0f <end+0xf0f0a2f>";
        32'h424:
            dissassembly = "424:  00000013  addi  zero,zero,0";
        32'h428:
            dissassembly = "428:  00000013  addi  zero,zero,0";
        32'h42c:
            dissassembly = "42c:  00ff00b7  lui   ra,0xff0";
        32'h430:
            dissassembly = "430:  0ff08093  addi  ra,ra,255 # ff00ff <end+0xfefc1f>";
        32'h434:
            dissassembly = "434:  0020c733  xor   a4,ra,sp";
        32'h438:
            dissassembly = "438:  00120213  addi  tp,tp,1 # 1 <test_2+0x1>";
        32'h43c:
            dissassembly = "43c:  00200293  addi  t0,zero,2";
        32'h440:
            dissassembly = "440:  fc521ee3  bne   tp,t0,41c <test_23+0x4>";
        32'h444:
            dissassembly = "444:  0ff013b7  lui   t2,0xff01";
        32'h448:
            dissassembly = "448:  ff038393  addi  t2,t2,-16 # ff00ff0 <end+0xff00b10>";
        32'h44c:
            dissassembly = "44c:  01700e13  addi  t3,zero,23";
        32'h450:
            dissassembly = "450:  06771863  bne   a4,t2,4c0 <fail>";
        32'h454:
            dissassembly = "454:  ff0100b7  lui   ra,0xff010";
        32'h458:
            dissassembly = "458:  f0008093  addi  ra,ra,-256 # ff00ff00 <end+0xff00fa20>";
        32'h45c:
            dissassembly = "45c:  00104133  xor   sp,zero,ra";
        32'h460:
            dissassembly = "460:  ff0103b7  lui   t2,0xff010";
        32'h464:
            dissassembly = "464:  f0038393  addi  t2,t2,-256 # ff00ff00 <end+0xff00fa20>";
        32'h468:
            dissassembly = "468:  01800e13  addi  t3,zero,24";
        32'h46c:
            dissassembly = "46c:  04711a63  bne   sp,t2,4c0 <fail>";
        32'h470:
            dissassembly = "470:  00ff00b7  lui   ra,0xff0";
        32'h474:
            dissassembly = "474:  0ff08093  addi  ra,ra,255 # ff00ff <end+0xfefc1f>";
        32'h478:
            dissassembly = "478:  0000c133  xor   sp,ra,zero";
        32'h47c:
            dissassembly = "47c:  00ff03b7  lui   t2,0xff0";
        32'h480:
            dissassembly = "480:  0ff38393  addi  t2,t2,255 # ff00ff <end+0xfefc1f>";
        32'h484:
            dissassembly = "484:  01900e13  addi  t3,zero,25";
        32'h488:
            dissassembly = "488:  02711c63  bne   sp,t2,4c0 <fail>";
        32'h48c:
            dissassembly = "48c:  000040b3  xor   ra,zero,zero";
        32'h490:
            dissassembly = "490:  00000393  addi  t2,zero,0";
        32'h494:
            dissassembly = "494:  01a00e13  addi  t3,zero,26";
        32'h498:
            dissassembly = "498:  02709463  bne   ra,t2,4c0 <fail>";
        32'h49c:
            dissassembly = "49c:  111110b7  lui   ra,0x11111";
        32'h4a0:
            dissassembly = "4a0:  11108093  addi  ra,ra,273 # 11111111 <end+0x11110c31>";
        32'h4a4:
            dissassembly = "4a4:  22222137  lui   sp,0x22222";
        32'h4a8:
            dissassembly = "4a8:  22210113  addi  sp,sp,546 # 22222222 <end+0x22221d42>";
        32'h4ac:
            dissassembly = "4ac:  0020c033  xor   zero,ra,sp";
        32'h4b0:
            dissassembly = "4b0:  00000393  addi  t2,zero,0";
        32'h4b4:
            dissassembly = "4b4:  01b00e13  addi  t3,zero,27";
        32'h4b8:
            dissassembly = "4b8:  00701463  bne   zero,t2,4c0 <fail>";
        32'h4bc:
            dissassembly = "4bc:  01c01a63  bne   zero,t3,4d0 <pass>";
        32'h4c0:
            dissassembly = "4c0:  069f7337  lui   t1,0x69f7";
        32'h4c4:
            dissassembly = "4c4:  bc730313  addi  t1,t1,-1081 # 69f6bc7 <end+0x69f66e7>";
        32'h4c8:
            dissassembly = "4c8:  02100393  addi  t2,zero,33";
        32'h4cc:
            dissassembly = "4cc:  0063a023  sw    t1,0(t2)";
        32'h4d0:
            dissassembly = "4d0:  075bd337  lui   t1,0x75bd";
        32'h4d4:
            dissassembly = "4d4:  d1530313  addi  t1,t1,-747 # 75bcd15 <end+0x75bc835>";
        32'h4d8:
            dissassembly = "4d8:  02100393  addi  t2,zero,33";
        32'h4dc:
            dissassembly = "4dc:  0063a023  sw    t1,0(t2)";
        default:
            dissassembly = "UNKNOWN";
    endcase
end
endfunction
