module imem(pc, op);
	input [11:0] pc;
	output reg [43:0] op;

	parameter [27:0] CHECK1 = 28'b0000_0000_0000_0000_0000_0000_0101,
	CHECK2 = 28'b0000_0000_0000_0000_0000_0000_0111,
	CHECK3 = 28'b0000_0000_0000_0000_0000_0000_1011,
	CHECK4 = 28'b0000_0000_0000_0000_0000_0000_1101,
	CHECK5 = 28'b0000_0000_0000_0000_0000_0000_1010,
	CHECK7 = 28'b0000_0000_0000_0000_0000_0000_1110,
	CHECK0 = 28'b0000_0000_0000_0000_0000_0000_1111,
	CHECK_NEXT_RIGHT = 28'b0000_0000_0000_0000_0000_0000_0001,
	CHECK_NEXT_LEFT = 28'b0000_0000_0000_0000_0000_0000_0010,
	CHECK_NEXT_UP = 28'b0000_0000_0000_0000_0000_0000_0011,
	CHECK_NEXT_DOWN = 28'b0000_0000_0000_0000_0000_0000_0000;
	
	parameter [11:0] TO_FIND_1 = 0,
	TO_FIND_2 = 28,
	TO_FIND_3 = 67,
	TO_FIND_4 = 121,
	TO_FIND_7 = 164,
	TO_FIND_0 = 202,
	TO_FIND_BLANK_TO_MOVE_2_AND_3 = 89,
	TO_FIND_BLANK_TO_MOVE_4_AND_7 = 186,
	TO_MOVE_2_AND_3 = 111,
	TO_MOVE_4_AND_7 = 198,
	TO_MOVE_COMPLETE = 208,
	TO_FINISH = 227;

	`include "def.h"
	always @(pc) begin
		case (pc)
			//synopsys parallel_case full_case
			// find and check if 1 is in the right top corner
			//first, find 1 and put it into COMPARE_wITH_ANSWER_BITS
			0: begin
				op[43:36]  <= FIND;
				op[35:32]  <= 0;
				op[31:28]  <= 0;
				op[27:21]  <= 1;
				op[20:0]   <= 0;
			end

			// then, check if it is in the answer position
			1: begin
				op[43:36]  <= CHECK;
				op[35:32]  <= 0;
				op[31:28]  <= 3;
				op[27:0]   <= CHECK1;
			end

			// if 1 is same as answer position go on to find 2
			2: begin
				op[43:36] <= JNZ;
				op[35:12] <= 0;
				op[11:0]  <= 22;
			end

			// if 1 is not the same as answer position, put next move into register NEXT_MOVEMENT
			3: begin
				op[43:36] <= COMP1;
				op[35:0]  <= 0;
			end

			// check if next movement is right
			4: begin
				op[43:36] <= NOT_CHECK;
				op[35:32] <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_RIGHT;
			end

			//if next is not right, jump to check if it is left. if it is right, go on.
			5: begin
				op[43:36] <= JNZ;
				op[35:12] <= 0;
				op[11:0]  <= 9;//NOT CHECK LEFT のとこ
			end

			// swap with right cell
			6: begin
				op[43:36] <= RIGHT;
				op[35:0]  <= 0;
			end

			7: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			8: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_1;
			end

			// check if next movement is left
			9: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_LEFT;
			end

			//if next is not left, jump to check if it is up. if it is left, go on.
			10: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 14;//NOT CHECK UP のとこ
			end

			// swap with left cell
			11: begin
				op[43:36] <= LEFT;
				op[35:0]  <= 0;
			end

			12: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			13: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_1;
			end

			// check if next movement is up
			14: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_UP;
			end

			//if next is not up, check if next is down. if it is up, go on.
			15: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 19;//NOT CHECK DOWN のとこ
			end

			// swap with right cell
			16: begin
				op[43:36] <= UP;
				op[35:0]  <= 0;
			end

			17: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			18: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_1;
			end

			// swap with down cell
			19: begin
				op[43:36] <= DOWN;
				op[35:0]  <= 0;
			end

			20: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			21: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_1;
			end

///////////////
///////////////
///////////////
///////////////
/////////////// 1 is done. go to 2!!!!!!!!!!!!!!!
///////////////
///////////////
///////////////
///////////////
////////////////////////////////////////////////////////
// first see if 1, 2, and 3 are on the right position //
////////////////////////////////////////////////////////
			// 1 is already in the right place
			22: begin
				op[43:36] <= FIND;
				op[35:32]  <= 0;
				op[31:28] <= 0;
				op[27:21] <= 2;
				op[20:0]  <= 0;
			end

			23: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28]  <= 3;
				op[27:0]   <= 28'b0000_0000_0000_0000_0000_0000_0110;
			end

			24: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_2;
			end

			25: begin
				op[43:36] <= FIND;
				op[35:32]  <= 0;
				op[31:28] <= 0;
				op[27:21] <= 3;
				op[20:0]  <= 0;
			end

			26: begin
				op[43:36] <= CHECK;
				op[35:32]  <= 0;
				op[31:28]  <= 3;
				op[27:0]   <= 28'b0000_0000_0000_0000_0000_0000_0111;
			end

			27: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]  <= 115;
			end

			// find and check if 2 is in the right position
			//first, find 2 and put it into COMPARE_wITH_ANSWER_BITS
			28: begin
				op[43:36]  <= FIND;
				op[35:32]  <= 0;
				op[31:28]  <= 0;
				op[27:21]  <= 2;
				op[20:0]  <= 0;
			end

			// then, check if it is in the answer position
			29: begin
				op[43:36]  <= CHECK;
				op[35:32]  <= 0;
				op[31:28]  <= 3;
				op[27:0]   <= CHECK2;
			end

			// if 2 is same as answer position go on to find 3
			30: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 50;
			end

			// if 2 is not the same as answer position, put next move into register NEXT_MOVEMENT
			31: begin
				op[43:36] <= COMP2;
				op[35:0]  <= 0;
			end

			// check if next movement is right
			32: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_RIGHT;
			end

			//if next is not right, jump to check if it is left. if it is right, go on.
			33: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 37;//NOT CHECK LEFT のとこ
			end

			// swap with right cell
			34: begin
				op[43:36] <= RIGHT;
				op[35:0]  <= 0;
			end

			35: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			36: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_2;
			end

			// check if next movement is left
			37: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_LEFT;
			end

			//if next is not left, jump to check if it is up. if it is left, go on.
			38: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 42;//NOT CHECK UP のとこ
			end

			// swap with left cell
			39: begin
				op[43:36] <= LEFT;
				op[35:0]  <= 0;
			end

			40: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			41: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_2;
			end

			// check if next movement is up
			42: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_UP;
			end

			//if next is not up, check if next is down. if it is up, go on.
			43: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 47;//NOT CHECK DOWN のとこ
			end

			// swap with right cell
			44: begin
				op[43:36] <= UP;
				op[35:0]  <= 0;
			end

			45: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			46: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_2;
			end

			// swap with down cell
			47: begin
				op[43:36] <= DOWN;
				op[35:0]  <= 0;
			end

			48: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			49: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_2;
			end

///////////////
///////////////
///////////////
///////////////
/////////////// 2 is done. go to 3!!!!!!!!!!!!!!!
///////////////
///////////////
///////////////
///////////////


			// first check out if 3 is in the worst position
///////////////////////////
// worst position check  //
///////////////////////////
			50: begin
				op[43:36] <= FIND;
				op[35:32]  <= 0;
				op[31:28] <= 0;
				op[27:21] <= 3;
				op[20:0]  <= 0;
			end

			51: begin
				op[43:36] <= CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 3;
				op[27:0]  <= 28'b0000_0000_0000_0000_0000_0000_0110;
			end

			52: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]  <= 62;//to left down 
			end

			53: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 3;
				op[27:0]  <= 28'b0000_0000_0000_0000_0000_0000_1010;
			end

			54: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_3;// to move 3
			end

			55: begin
				op[43:36] <= FIND;
				op[35:32]  <= 0;
				op[31:28] <= 0;
				op[27:21]  <= 0;
				op[20:0]  <= 0;
			end

			56: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 3;
				op[27:0]  <= 28'b0000_0000_0000_0000_0000_0000_0110;
			end

			57: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_3;// to move 3
			end

			// swap with down cell
			58: begin
				op[43:36] <= RIGHT;
				op[35:0]  <= 0;
			end

			59: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			60: begin
				op[43:36] <= DOWN;
				op[35:0]  <= 0;
			end

			61: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			62: begin
				op[43:36] <= LEFT;
				op[35:0]  <= 0;
			end

			63: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			64: begin
				op[43:36] <= DOWN;
				op[35:0]  <= 0;
			end

			65: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			66: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_2;
			end
//////////////////////////////
// move 3 to right position //
//////////////////////////////

			// find and check 3 is in the right position
			// first, find 3 and put it into COMPARE_wITH_ANSWER_BITS
			67: begin
				op[43:36]  <= FIND;
				op[35:32]  <= 0;
				op[31:28]  <= 0;
				op[27:21]   <= 3;
				op[20:0]  <= 0;
			end

			// then, check if it is in the answer position
			68: begin
				op[43:36]  <= CHECK;
				op[35:32]  <= 0;
				op[31:28]  <= 3;
				op[27:0]   <= CHECK3;
			end

			// if 3 is same as answer position go on to move 2 and 3 to right position
			69: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= TO_FIND_BLANK_TO_MOVE_2_AND_3;
			end

			// if 2 is not the same as answer position, put next move into register NEXT_MOVEMENT
			70: begin
				op[43:36] <= COMP3;
				op[35:0]  <= 0;
			end

			// check if next movement is right
			71: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_RIGHT;
			end

			//if next is not right, jump to check if it is left. if it is right, go on.
			72: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 76;//NOT CHECK LEFT のとこ
			end

			// swap with right cell
			73: begin
				op[43:36] <= RIGHT;
				op[35:0]  <= 0;
			end

			74: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			75: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_3;
			end

			// check if next movement is left
			76: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_LEFT;
			end

			//if next is not left, jump to check if it is up. if it is left, go on.
			77: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 81;//NOT CHECK UP のとこ
			end

			// swap with left cell
			78: begin
				op[43:36] <= LEFT;
				op[35:0]  <= 0;
			end

			79: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			80: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_3;
			end

			// check if next movement is up
			81: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_UP;
			end

			//if next is not up, check if next is down. if it is up, go on.
			82: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 86;//NOT CHECK DOWN のとこ
			end

			// swap with right cell
			83: begin
				op[43:36] <= UP;
				op[35:0]  <= 0;
			end

			84: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			85: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_3;
			end

			// swap with down cell
			86: begin
				op[43:36] <= DOWN;
				op[35:0]  <= 0;
			end

			87: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			88: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_3;
			end
////////////////////////////////////
// move 2 and 3 to right position //
////////////////////////////////////
///////// first move blank /////////
////////////////////////////////////
			// first find blank
			89: begin
				op[43:36]  <= FIND;
				op[35:32]  <= 0;
				op[31:28]  <= 0;
				op[27:21]   <= 0;
				op[20:0]  <= 0;
			end

			// then, check if it is in the answer position
			90: begin
				op[43:36]  <= CHECK;
				op[35:32]  <= 0;
				op[31:28]  <= 3;
				op[27:0]   <= 28'b0000_0000_0000_0000_0000_0000_0110;
			end

			// if 3 is same as answer position go on to move 2 and 3 to right position
			91: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= TO_MOVE_2_AND_3;
			end

			// if 2 is not the same as answer position, put next move into register NEXT_MOVEMENT
			92: begin
				op[43:36] <= COMP0_FOR_2_AND_3;
				op[35:0]  <= 0;
			end

			// check if next movement is right
			93: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_RIGHT;
			end

			//if next is not right, jump to check if it is left. if it is right, go on.
			94: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 98;//NOT CHECK LEFT のとこ
			end

			// swap with right cell
			95: begin
				op[43:36] <= RIGHT;
				op[35:0]  <= 0;
			end

			96: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			97: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_BLANK_TO_MOVE_2_AND_3;
			end

			// check if next movement is left
			98: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_LEFT;
			end

			//if next is not left, jump to check if it is up. if it is left, go on.
			99: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 103;//NOT CHECK UP のとこ
			end

			// swap with left cell
			100: begin
				op[43:36] <= LEFT;
				op[35:0]  <= 0;
			end

			101: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			102: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_BLANK_TO_MOVE_2_AND_3;
			end

			// check if next movement is up
			103: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_UP;
			end

			//if next is not up, check if next is down. if it is up, go on.
			104: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 108;//NOT CHECK DOWN のとこ
			end

			// swap with right cell
			105: begin
				op[43:36] <= UP;
				op[35:0]  <= 0;
			end

			106: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			107: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_BLANK_TO_MOVE_2_AND_3;
			end

			// swap with down cell
			108: begin
				op[43:36] <= DOWN;
				op[35:0]  <= 0;
			end

			109: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			110: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_BLANK_TO_MOVE_2_AND_3;
			end
/////////////////////////////////////
// move 2 and 3 from position 0110 //
/////////////////////////////////////
			111: begin
				op[43:36] <= RIGHT;
				op[35:0]  <= 0;
			end

			112: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			113: begin
				op[43:36] <= DOWN;
				op[35:0]  <= 0;
			end

			114: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end
////////////////////////
////////////////////////Done moving 1,2, and 3 to the right position!!!
////////////////////////Go on!!!!!!!!!!
////////////////////////
///////////////////////////////////////////////
// check if 4 and 7 are in the true position //
///////////////////////////////////////////////
			// check if 4 is in the true position
			115: begin
				op[43:36] <= FIND;
				op[35:32]  <= 0;
				op[31:28] <= 0;
				op[27:21] <= 4;
				op[20:0]  <= 0;
			end

			116: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 3;
				op[27:0]  <= 28'b0000_0000_0000_0000_0000_0000_1001;
			end

			117: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_4;
			end

			118: begin
				op[43:36] <= FIND;
				op[35:32]  <= 0;
				op[31:28] <= 0;
				op[27:21] <= 7;
				op[20:0]  <= 0;
			end

			119: begin
				op[43:36] <= CHECK;
				op[35:32]  <= 0;
				op[31:28]  <= 3;
				op[27:0]   <= 28'b0000_0000_0000_0000_0000_0000_1101;
			end

			120: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_0;
			end
/////////////////////////////////////////////////////////////
// check if 4 is in the right place and move it if it isnt //
/////////////////////////////////////////////////////////////
			// find 4
			121: begin
				op[43:36] <= FIND;
				op[35:32]  <= 0;
				op[31:28] <= 0;
				op[27:21] <= 4;
				op[20:0]  <= 0;
			end

			// check if 4 is in the right place.
			122: begin
				op[43:36]  <= CHECK;
				op[35:32]  <= 0;
				op[31:28]  <= 3;
				op[27:0]   <= CHECK4;
			end

			// if 4 is same as answer position go on to find 7
			123: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 143;
			end

			// if 2 is not the same as answer position, put next move into register NEXT_MOVEMENT
			124: begin
				op[43:36] <= COMP4;
				op[35:0]  <= 0;
			end

			// check if next movement is right
			125: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_RIGHT;
			end

			//if next is not right, jump to check if it is left. if it is right, go on.
			126: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 130;//NOT CHECK LEFT のとこ
			end

			// swap with right cell
			127: begin
				op[43:36] <= RIGHT;
				op[35:0]  <= 0;
			end

			128: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			129: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_4;
			end

			// check if next movement is left
			130: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_LEFT;
			end

			//if next is not left, jump to check if it is up. if it is left, go on.
			131: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 135;//NOT CHECK UP のとこ
			end

			// swap with left cell
			132: begin
				op[43:36] <= LEFT;
				op[35:0]  <= 0;
			end

			133: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			134: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_4;
			end

			// check if next movement is up
			135: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_UP;
			end

			//if next is not up, check if next is down. if it is up, go on.
			136: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 140;//NOT CHECK DOWN のとこ
			end

			// swap with right cell
			137: begin
				op[43:36] <= UP;
				op[35:0]  <= 0;
			end

			138: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			139: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_4;
			end

			// swap with down cell
			140: begin
				op[43:36] <= DOWN;
				op[35:0]  <= 0;
			end

			141: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			142: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_4;
			end
/////////////////
/////////////////done moving 4, move 7!!!!!!
/////////////////
//////////////////////////
// worst position check //
//////////////////////////
			143: begin
				op[43:36] <= FIND;
				op[35:32]  <= 0;
				op[31:28] <= 0;
				op[27:21] <= 7;
				op[20:0]  <= 0;
			end

			144: begin
				op[43:36] <= CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 3;
				op[27:0]  <= 28'b0000_0000_0000_0000_0000_0000_1001;
			end

			145: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]  <= 155;//to down right up right
			end

			146: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 3;
				op[27:0]  <= 28'b0000_0000_0000_0000_0000_0000_1010;
			end

			147: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_7;// to move 3
			end

			148: begin
				op[43:36] <= FIND;
				op[35:32]  <= 0;
				op[31:28] <= 0;
				op[27:21]  <= 0;
				op[20:0]  <= 0;
			end

			149: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 3;
				op[27:0]  <= 28'b0000_0000_0000_0000_0000_0000_1001;
			end

			150: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_7;// to move 3
			end

			// swap with down cell
			151: begin
				op[43:36] <= UP;
				op[35:0]  <= 0;
			end

			152: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			153: begin
				op[43:36] <= LEFT;
				op[35:0]  <= 0;
			end

			154: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			155: begin
				op[43:36] <= DOWN;
				op[35:0]  <= 0;
			end

			156: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			157: begin
				op[43:36] <= RIGHT;
				op[35:0]  <= 0;
			end

			158: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			159: begin
				op[43:36] <= UP;
				op[35:0]  <= 0;
			end

			160: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			161: begin
				op[43:36] <= RIGHT;
				op[35:0]  <= 0;
			end

			162: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			163: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_4;
			end

			// find 7
			164: begin
				op[43:36] <= FIND;
				op[35:32]  <= 0;
				op[31:28] <= 0;
				op[27:21] <= 7;
				op[20:0]  <= 0;
			end

			// check if 4 is in the right place.
			165: begin
				op[43:36]  <= CHECK;
				op[35:32]  <= 0;
				op[31:28]  <= 3;
				op[27:0]   <= CHECK7;
			end

			// if 4 is same as answer position go on to find 7
			166: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= TO_FIND_BLANK_TO_MOVE_4_AND_7;
			end

			// if 2 is not the same as answer position, put next move into register NEXT_MOVEMENT
			167: begin
				op[43:36] <= COMP7;
				op[35:0]  <= 0;
			end

			// check if next movement is right
			168: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_RIGHT;
			end

			//if next is not right, jump to check if it is left. if it is right, go on.
			169: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 151;//NOT CHECK LEFT のとこ
			end

			// swap with right cell
			170: begin
				op[43:36] <= RIGHT;
				op[35:0]  <= 0;
			end

			171: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			172: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_7;
			end

			// check if next movement is left
			173: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_LEFT;
			end

			//if next is not left, jump to check if it is up. if it is left, go on.
			174: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 156;//NOT CHECK UP のとこ
			end

			// swap with left cell
			175: begin
				op[43:36] <= LEFT;
				op[35:0]  <= 0;
			end

			176: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			177: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_7;
			end

			// check if next movement is up
			178: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_UP;
			end

			//if next is not up, check if next is down. if it is up, go on.
			179: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 161;//NOT CHECK DOWN のとこ
			end

			// swap with right cell
			180: begin
				op[43:36] <= UP;
				op[35:0]  <= 0;
			end

			181: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			182: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_7;
			end

			// swap with down cell
			183: begin
				op[43:36] <= DOWN;
				op[35:0]  <= 0;
			end

			184: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			185: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_7;
			end
////////////////////////////////////
// move 4 and 7 to right position //
////////////////////////////////////
///////// first move blank /////////
////////////////////////////////////
			// first find blank
			186: begin
				op[43:36]  <= FIND;
				op[35:32]  <= 0;
				op[31:28]  <= 0;
				op[27:21]   <= 0;
				op[20:0]  <= 0;
			end

			// then, check if it is in the answer position
			187: begin
				op[43:36]  <= CHECK;
				op[35:32]  <= 0;
				op[31:28]  <= 3;
				op[27:0]   <= 28'b0000_0000_0000_0000_0000_0000_1001;
			end

			// if 3 is same as answer position go on to move 2 and 3 to right position
			188: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= TO_MOVE_4_AND_7;
			end

			// if 2 is not the same as answer position, put next move into register NEXT_MOVEMENT
			189: begin
				op[43:36] <= COMP0_FOR_4_AND_7;
				op[35:0]  <= 0;
			end

			// check if next movement is left
			190: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_LEFT;
			end

			//if next is not left, jump to check if it is up. if it is left, go on.
			191: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 195;//NOT CHECK UP のとこ
			end

			// swap with left cell
			192: begin
				op[43:36] <= LEFT;
				op[35:0]  <= 0;
			end

			193: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			194: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_BLANK_TO_MOVE_4_AND_7;
			end

			// swap with right cell
			195: begin
				op[43:36] <= UP;
				op[35:0]  <= 0;
			end

			196: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			197: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_BLANK_TO_MOVE_4_AND_7;
			end
/////////////////////////////////////
// move 2 and 3 from position 0110 //
/////////////////////////////////////
			198: begin
				op[43:36] <= DOWN;
				op[35:0]  <= 0;
			end

			199: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			200: begin
				op[43:36] <= RIGHT;
				op[35:0]  <= 0;
			end

			201: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end
/////////////////////////////////////////////////////
// done moving 1,2,3,4,7 move on to last procedure //
/////////////////////////////////////////////////////
			// find blank
			202: begin
				op[43:36] <= FIND;
				op[35:32]  <= 0;
				op[31:28] <= 0;
				op[27:21] <= 0;
				op[20:0]  <= 0;
			end

			// check if 4 is in the right place.
			203: begin
				op[43:36]  <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28]  <= 3;
				op[27:0]   <= CHECK0;
			end

			// if 4 is same as answer position go on to find 7
			204: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= TO_MOVE_COMPLETE;
			end

			205: begin
				op[43:36] <= FIND;
				op[35:32]  <= 0;
				op[31:28] <= 0;
				op[27:21] <= 5;
				op[20:0]  <= 0;
			end

			// check if 4 is in the right place.
			206: begin
				op[43:36]  <= CHECK;
				op[35:32]  <= 0;
				op[31:28]  <= 3;
				op[27:0]   <= CHECK5;
			end

			// if 4 is same as answer position go on to find 7
			207: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FINISH;
			end

			// if 2 is not the same as answer position, put next move into register NEXT_MOVEMENT
			208: begin
				op[43:36] <= MOVE_COMPLETE;
				op[35:0]  <= 0;
			end

			// check if next movement is right
			209: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_RIGHT;
			end

			//if next is not right, jump to check if it is left. if it is right, go on.
			210: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 214;//NOT CHECK LEFT のとこ
			end

			// swap with right cell
			211: begin
				op[43:36] <= RIGHT;
				op[35:0]  <= 0;
			end

			212: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			213: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_0;
			end

			// check if next movement is left
			214: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_LEFT;
			end

			//if next is not left, jump to check if it is up. if it is left, go on.
			215: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 219;//NOT CHECK UP のとこ
			end

			// swap with left cell
			216: begin
				op[43:36] <= LEFT;
				op[35:0]  <= 0;
			end

			217: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			218: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_0;
			end

			// check if next movement is up
			219: begin
				op[43:36] <= NOT_CHECK;
				op[35:32]  <= 0;
				op[31:28] <= 4;
				op[27:0]  <= CHECK_NEXT_UP;
			end

			//if next is not up, check if next is down. if it is up, go on.
			220: begin
				op[43:36] <= JNZ;
				op[35:12]  <= 0;
				op[11:0]   <= 224;//NOT CHECK DOWN のとこ
			end

			// swap with right cell
			221: begin
				op[43:36] <= UP;
				op[35:0]  <= 0;
			end

			222: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			223: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_0;
			end

			// swap with down cell
			224: begin
				op[43:36] <= DOWN;
				op[35:0]  <= 0;
			end

			225: begin
				op[43:36] <= INC;
				op[35:32] <= 2;
				op[31:0]  <= 0;
			end

			//jump beck to find 1 and check
			226: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= TO_FIND_0;
			end

			227: begin
				op[43:36] <= JMP;
				op[35:12]  <= 0;
				op[11:0]  <= 227;
			end
		endcase
	end
endmodule
