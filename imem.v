module imem(pc, op);
	input [7:0] pc;
	output reg [10:0] op;
parameter LAST=239;

	`include "def.h"
	always @(pc) begin
		case (pc)
			0: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 0;
				op[1:0]  <= 0;
			end

			1: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 4;
			end

			2: begin
				op[10:8] <= LOAD;
				op[7:2] <= 0;
				op[1:0]  <= 0;
			end

			3: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			4: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 1;
				op[1:0]  <= 0;
			end

			5: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 8;
			end

			6: begin
				op[10:8] <= LOAD;
				op[7:2] <= 1;
				op[1:0]  <= 0;
			end

			7: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			8: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 2;
				op[1:0]  <= 0;
			end

			9: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 12;
			end

			10: begin
				op[10:8] <= LOAD;
				op[7:2] <= 2;
				op[1:0]  <= 0;
			end

			11: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			12: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 3;
				op[1:0]  <= 0;
			end

			13: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 16;
			end

			14: begin
				op[10:8] <= LOAD;
				op[7:2] <= 3;
				op[1:0]  <= 0;
			end

			15: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			16: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 4;
				op[1:0]  <= 0;
			end

			17: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 20;
			end

			18: begin
				op[10:8] <= LOAD;
				op[7:2] <= 4;
				op[1:0]  <= 0;
			end

			19: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			20: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 5;
				op[1:0]  <= 0;
			end

			21: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 24;
			end

			22: begin
				op[10:8] <= LOAD;
				op[7:2] <= 5;
				op[1:0]  <= 0;
			end

			23: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			24: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 6;
				op[1:0]  <= 0;
			end

			25: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 28;
			end

			26: begin
				op[10:8] <= LOAD;
				op[7:2] <= 6;
				op[1:0]  <= 0;
			end

			27: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			28: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 7;
				op[1:0]  <= 0;
			end

			29: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 32;
			end

			30: begin
				op[10:8] <= LOAD;
				op[7:2] <= 7;
				op[1:0]  <= 0;
			end

			31: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			32: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 8;
				op[1:0]  <= 0;
			end

			33: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 36;
			end

			34: begin
				op[10:8] <= LOAD;
				op[7:2] <= 8;
				op[1:0]  <= 0;
			end

			35: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			36: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 9;
				op[1:0]  <= 0;
			end

			37: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 40;
			end

			38: begin
				op[10:8] <= LOAD;
				op[7:2] <= 9;
				op[1:0]  <= 0;
			end

			39: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			40: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 10;
				op[1:0]  <= 0;
			end

			41: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 44;
			end

			42: begin
				op[10:8] <= LOAD;
				op[7:2] <= 10;
				op[1:0]  <= 0;
			end

			43: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			44: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 11;
				op[1:0]  <= 0;
			end

			45: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 48;
			end

			46: begin
				op[10:8] <= LOAD;
				op[7:2] <= 11;
				op[1:0]  <= 0;
			end

			47: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			48: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 12;
				op[1:0]  <= 0;
			end

			49: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 52;
			end

			50: begin
				op[10:8] <= LOAD;
				op[7:2] <= 12;
				op[1:0]  <= 0;
			end

			51: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			52: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 13;
				op[1:0]  <= 0;
			end

			53: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 56;
			end

			54: begin
				op[10:8] <= LOAD;
				op[7:2] <= 13;
				op[1:0]  <= 0;
			end

			55: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end
			
			56: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 14;
				op[1:0]  <= 0;
			end

			57: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 60;
			end

			58: begin
				op[10:8] <= LOAD;
				op[7:2] <= 14;
				op[1:0]  <= 0;
			end

			59: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			60: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 15;
				op[1:0]  <= 0;
			end

			61: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 64;
			end

			62: begin
				op[10:8] <= LOAD;
				op[7:2] <= 15;
				op[1:0]  <= 0;
			end

			63: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			64: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 16;
				op[1:0]  <= 0;
			end

			65: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 68;
			end

			66: begin
				op[10:8] <= LOAD;
				op[7:2] <= 16;
				op[1:0]  <= 0;
			end
			
			67: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			68: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 17;
				op[1:0]  <= 0;
			end

			69: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 72;
			end

			70: begin
				op[10:8] <= LOAD;
				op[7:2] <= 17;
				op[1:0]  <= 0;
			end

			71: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			72: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 18;
				op[1:0]  <= 0;
			end

			73: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 76;
			end

			74: begin
				op[10:8] <= LOAD;
				op[7:2] <= 18;
				op[1:0]  <= 0;
			end

			75: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			76: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 19;
				op[1:0]  <= 0;
			end

			77: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 80;
			end

			78: begin
				op[10:8] <= LOAD;
				op[7:2] <= 19;
				op[1:0]  <= 0;
			end

			79: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			80: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 20;
				op[1:0]  <= 0;
			end

			81: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 84;
			end

			82: begin
				op[10:8] <= LOAD;
				op[7:2] <= 20;
				op[1:0]  <= 0;
			end

			83: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			84: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 21;
				op[1:0]  <= 0;
			end

			85: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 88;
			end

			86: begin
				op[10:8] <= LOAD;
				op[7:2] <= 21;
				op[1:0]  <= 0;
			end

			87: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			88: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 22;
				op[1:0]  <= 0;
			end
			
			89: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 92;
			end

			90: begin
				op[10:8] <= LOAD;
				op[7:2] <= 22;
				op[1:0]  <= 0;
			end

			91: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			92: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 23;
				op[1:0]  <= 0;
			end

			93: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 96;
			end

			94: begin
				op[10:8] <= LOAD;
				op[7:2] <= 23;
				op[1:0]  <= 0;
			end

			95: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			96: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 24;
				op[1:0]  <= 0;
			end

			97: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 100;
			end

			98: begin
				op[10:8] <= LOAD;
				op[7:2] <= 24;
				op[1:0]  <= 0;
			end

			99: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			100: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 25;
				op[1:0]  <= 0;
			end

			101: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 104;
			end
			
			102: begin
				op[10:8] <= LOAD;
				op[7:2] <= 25;
				op[1:0]  <= 0;
			end

			103: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			104: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 26;
				op[1:0]  <= 0;
			end

			105: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 108;
			end

			106: begin
				op[10:8] <= LOAD;
				op[7:2] <= 26;
				op[1:0]  <= 0;
			end

			107: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			108: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 27;
				op[1:0]  <= 0;
			end

			109: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 112;
			end

			110: begin
				op[10:8] <= LOAD;
				op[7:2] <= 27;
				op[1:0]  <= 0;
			end
			
			111: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			112: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 28;
				op[1:0]  <= 0;
			end

			113: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 116;
			end

			114: begin
				op[10:8] <= LOAD;
				op[7:2] <= 28;
				op[1:0]  <= 0;
			end
			
			115: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			116: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 29;
				op[1:0]  <= 0;
			end

			117: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 120;
			end

			118: begin
				op[10:8] <= LOAD;
				op[7:2] <= 29;
				op[1:0]  <= 0;
			end

			119: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			120: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 30;
				op[1:0]  <= 0;
			end
			
			121: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 124;
			end

			122: begin
				op[10:8] <= LOAD;
				op[7:2] <= 30;
				op[1:0]  <= 0;
			end

			123: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			124: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 31;
				op[1:0]  <= 0;
			end

			125: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 128;
			end

			126: begin
				op[10:8] <= LOAD;
				op[7:2] <= 31;
				op[1:0]  <= 0;
			end

			127: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			128: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 32;
				op[1:0]  <= 0;
			end

			129: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 132;
			end

			130: begin
				op[10:8] <= LOAD;
				op[7:2] <= 32;
				op[1:0]  <= 0;
			end

			131: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			132: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 33;
				op[1:0]  <= 0;
			end

			133: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 136;
			end

			134: begin
				op[10:8] <= LOAD;
				op[7:2] <= 33;
				op[1:0]  <= 0;
			end

			135: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			136: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 34;
				op[1:0]  <= 0;
			end

			137: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 140;
			end

			138: begin
				op[10:8] <= LOAD;
				op[7:2] <= 34;
				op[1:0]  <= 0;
			end

			139: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			140: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 35;
				op[1:0]  <= 0;
			end

			141: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 144;
			end

			142: begin
				op[10:8] <= LOAD;
				op[7:2] <= 35;
				op[1:0]  <= 0;
			end
			
			143: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			144: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 36;
				op[1:0]  <= 0;
			end

			145: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 148;
			end

			146: begin
				op[10:8] <= LOAD;
				op[7:2] <= 36;
				op[1:0]  <= 0;
			end

			147: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			148: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 37;
				op[1:0]  <= 0;
      end

			149: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 152;
			end

			150: begin
				op[10:8] <= LOAD;
				op[7:2] <= 37;
				op[1:0]  <= 0;
			end

			151: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			152: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 38;
				op[1:0]  <= 0;
			end

			153: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 156;
			end

			154: begin
				op[10:8] <= LOAD;
				op[7:2] <= 38;
				op[1:0]  <= 0;
			end

			155: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			156: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 39;
				op[1:0]  <= 0;
			end

			157: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 160;
			end

			158: begin
				op[10:8] <= LOAD;
				op[7:2] <= 39;
				op[1:0]  <= 0;
			end

			159: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end
			160: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 40;
				op[1:0]  <= 0;
			end

			161: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 164;
			end

			162: begin
				op[10:8] <= LOAD;
				op[7:2] <= 40;
				op[1:0]  <= 0;
			end

			163: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			164: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 41;
				op[1:0]  <= 0;
			end

			165: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 168;
			end

			166: begin
				op[10:8] <= LOAD;
				op[7:2] <= 41;
				op[1:0]  <= 0;
			end

			167: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			168: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 42;
				op[1:0]  <= 0;
			end

			169: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 172;
			end

			170: begin
				op[10:8] <= LOAD;
				op[7:2] <= 42;
				op[1:0]  <= 0;
			end

			171: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			172: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 43;
				op[1:0]  <= 0;
			end

			173: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 176;
			end

			174: begin
				op[10:8] <= LOAD;
				op[7:2] <= 43;
				op[1:0]  <= 0;
			end

			175: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			176: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 44;
				op[1:0]  <= 0;
			end

			177: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 180;
			end

			178: begin
				op[10:8] <= LOAD;
				op[7:2] <= 44;
				op[1:0]  <= 0;
			end

			179: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			180: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 45;
				op[1:0]  <= 0;
			end

			181: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 184;
			end

			182: begin
				op[10:8] <= LOAD;
				op[7:2] <= 45;
				op[1:0]  <= 0;
			end

			183: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			184: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 45;
				op[1:0]  <= 0;
			end

			185: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 188;
			end
			
			186: begin
				op[10:8] <= LOAD;
				op[7:2] <= 46;
				op[1:0]  <= 0;
			end

			187: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			188: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 47;
				op[1:0]  <= 0;
			end

			189: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 192;
			end

			190: begin
				op[10:8] <= LOAD;
				op[7:2] <= 47;
				op[1:0]  <= 0;
			end

			191: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			192: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 48;
				op[1:0]  <= 0;
			end

			193: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 196;
			end

			194: begin
				op[10:8] <= LOAD;
				op[7:2] <= 48;
				op[1:0]  <= 0;
			end

			195: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			196: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 49;
				op[1:0]  <= 0;
			end

			197: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 200;
			end
			
			198: begin
				op[10:8] <= LOAD;
				op[7:2] <= 49;
				op[1:0]  <= 0;
			end

			199: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			200: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 50;
				op[1:0]  <= 0;
			end

			201: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 204;
			end
			
			202: begin
				op[10:8] <= LOAD;
				op[7:2] <= 50;
				op[1:0]  <= 0;
			end

			203: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			204: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 51;
				op[1:0]  <= 0;
			end

			205: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 208;
			end

			206: begin
				op[10:8] <= LOAD;
				op[7:2] <= 51;
				op[1:0]  <= 0;
			end

			207: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			208: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 52;
				op[1:0]  <= 0;
			end

			209: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 212;
			end

			210: begin
				op[10:8] <= LOAD;
				op[7:2] <= 52;
				op[1:0]  <= 0;
			end

			211: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			212: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 53;
				op[1:0]  <= 0;
			end

			213: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 216;
			end

			214: begin
				op[10:8] <= LOAD;
				op[7:2] <= 53;
				op[1:0]  <= 0;
			end

			215: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			216: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 54;
				op[1:0]  <= 0;
			end

			217: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 220;
			end

			218: begin
				op[10:8] <= LOAD;
				op[7:2] <= 54;
				op[1:0]  <= 0;
			end

			219: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			220: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 55;
				op[1:0]  <= 0;
			end

			221: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 224;
			end

			222: begin
				op[10:8] <= LOAD;
				op[7:2] <= 55;
				op[1:0]  <= 0;
			end

			223: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end

			224: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 56;
				op[1:0]  <= 0;
			end

			225: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 228;
			end

			226: begin
				op[10:8] <= LOAD;
				op[7:2] <= 56;
				op[1:0]  <= 0;
			end

			227: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end
			
			228: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 57;
				op[1:0]  <= 0;
			end
			
			229: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 229;
			end
			
			230: begin
				op[10:8] <= LOAD;
				op[7:2] <= 57;
				op[1:0]  <= 0;
			end
			
			231: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end
			
			232: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 58;
				op[1:0]  <= 0;
			end
			
			233: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 236;
			end
			
			234: begin
				op[10:8] <= LOAD;
				op[7:2] <= 58;
				op[1:0]  <= 0;
			end
			
			235: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end
			
			236: begin
				op[10:8]  <= CHECK;
				op[7:2]  <= 59;
				op[1:0]  <= 0;
			end
			
			237: begin
				op[10:8]  <= JNZ;
				op[7:0]  <= 240;
			end
			
			238: begin
				op[10:8] <= LOAD;
				op[7:2] <= 59;
				op[1:0]  <= 0;
			end
			
			239: begin
				op[10:8] <= JMP;
				op[7:0]  <= LAST;
			end
		endcase
	end
endmodule
