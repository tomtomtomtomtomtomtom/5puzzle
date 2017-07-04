module alu(in0, in1, op, zf, out);
	input [27:0] in0, in1;
	input [7:0] op;
	output reg zf;
	output reg [27:0] out;
	parameter MUP = 28'b0000_0000_0000_0000_0000_0000_0011,
	MDOWN = 28'b0000_0000_0000_0000_0000_0000_0000,
	MRIGHT = 28'b0000_0000_0000_0000_0000_0000_0001,
	MLEFT = 28'b0000_0000_0000_0000_0000_0000_0010;

	`include "def.h"

	always @(*) begin
		case(op)
			//synopsys parallel_case full_case
			AND  : begin
				out <= in0 & in1;
				zf  <= 0;
			end

			OR   : begin
				out <= in0 | in1;
				zf  <= 0;
			end

			ADD   : begin
				out <= in0 + in1;
				zf  <= 0;
			end

			SUB   : begin
				out <= (in0 > in1) ? in0 - in1 : in1 - in0;
				zf  <= 0;
			end

			INC   : begin
				out <= in1 + 1;
				zf  <= 0;
			end

			DEC   : begin
				out <= in0 - 1;
				zf  <= 0;
			end

			COMP0_FOR_2_AND_3  : begin
				if (in0[27:24] == 4'b1010 || in0[27:24] == 4'b1110) begin
					out <= MUP;
				end else if (in0[27:24] == 4'b1111) begin
					out <= MLEFT;
				end else if (in0[27:24] == 4'b1101 || in0[27:24] == 4'b1010) begin
					out <= MRIGHT;
				end
				zf <= 0;
			end

			COMP0_FOR_4_AND_7  : begin
				if (in0[27:24] == 4'b1111) begin
					out <= MUP;
				end else if (in0[27:24] == 4'b1011 || in0[27:24] == 4'b1010) begin
					out <= MLEFT;
				end
				zf <= 0;
			end

			MOVE_COMPLETE  : begin
				if (in1[27:24] == 4'b1111) begin
					out <= MLEFT;
				end else if (in1[27:24] == 4'b1110) begin
					out <= MUP;
				end else if (in1[27:24] == 4'b1010) begin
					out <= MRIGHT;
				end else if (in1[27:24] == 4'b1011) begin
					out <= MDOWN;
				end
				zf <= 0;
			end

			// make COMPARE 1,2,3,4,5,7
			// put position relationship in out
			COMP1  : begin
				if (in0[27:26] == in0[23:22] && in0[25:24] < in0[21:20]) begin //blank is left
					out <= MRIGHT;
				end else if (in0[27:26] == in0[23:22] && in0[25:24] > in0[21:20]) begin // blank is right
					if (in0[27:24] == 4'b0111 && in0[23:20] == 4'b0110)begin
						out <= MDOWN;
					end else begin
						out <= MUP;
					end
				end else if (in0[27:26] > in0[23:22] && in0[25:24] == in0[21:20]) begin //blank is down
					if (in0[27:24] == 4'b1101 && in0[23:20] == 4'b1001)begin
						out <= MRIGHT;
					end else begin
						out <= MLEFT;
					end
				end else if (in0[27:26] > in0[23:22] && in0[25:24] < in0[21:20]) begin //blank is down left
					out <= MUP;
				end else if (in0[27:26] > in0[23:22] && in0[25:24] > in0[21:20]) begin //blank is down right
					if (in0[27:24] == 4'b1110 && in0[23:20] == 4'b1001)begin
						out <= MUP;
					end else begin
						out <= MLEFT;
					end
				end else if (in0[27:26] < in0[23:22] && in0[25:24] == in0[21:20]) begin //blank is up
					out <= MDOWN;
				end else if (in0[27:26] < in0[23:22] && in0[25:24] < in0[21:20]) begin // blank is up left
					out <= MRIGHT;
				end else if (in0[27:26] < in0[23:22] && in0[25:24] > in0[21:20]) begin // blank is up right
					out <= MLEFT;
				end
				zf <= 0;
			end

			COMP2  : begin
				if (in0[27:26] == in0[19:18] && in0[25:24] < in0[17:16]) begin //blank is left
					if (in0[27:24] == 4'b0101 && in0[19:16] == 4'b0110)begin
						out <= MDOWN;
					end else begin
						out <= MUP;
					end
				end else if (in0[27:26] == in0[19:18] && in0[25:24] > in0[17:16]) begin // blank is right
					out <= MLEFT;
				end else if (in0[27:26] > in0[19:18] && in0[25:24] == in0[17:16]) begin //blank is down
					if (in0[27:24] == 4'b1111 && in0[19:16] == 4'b1011)begin
						out <= MRIGHT;
					end else begin
						out <= MLEFT;
					end
				end else if (in0[27:26] > in0[19:18] && in0[25:24] < in0[17:16]) begin //blank is down left
					out <= MUP;
				end else if (in0[27:26] > in0[19:18] && in0[25:24] > in0[17:16]) begin //blank is down right
					out <= MUP;
				end else if (in0[27:26] < in0[19:18] && in0[25:24] == in0[17:16]) begin //blank is up
					out <= MDOWN;
				end else if (in0[27:26] < in0[19:18] && in0[25:24] < in0[17:16]) begin // blank is up left
					out <= MRIGHT;
				end else if (in0[27:26] < in0[19:18] && in0[25:24] > in0[17:16]) begin // blank is up right
					out <= MDOWN;
				end
				zf <= 0;
			end

			COMP3  : begin
				if (in0[27:26] == in0[15:14] && in0[25:24] < in0[13:12]) begin //blank is left
					if (in0[27:24] == 4'b1001 && in0[15:12] == 4'b1010)begin
						out <= MDOWN;
					end else begin
						out <= MUP;
					end
				end else if (in0[27:26] == in0[15:14] && in0[25:24] > in0[13:12]) begin // blank is right
					out <= MLEFT;
				end else if (in0[27:26] > in0[15:14] && in0[25:24] == in0[13:12]) begin //blank is down
					out <= MRIGHT;
				end else if (in0[27:26] > in0[15:14] && in0[25:24] < in0[13:12]) begin //blank is down left
					out <= MRIGHT;
				end else if (in0[27:26] > in0[15:14] && in0[25:24] > in0[13:12]) begin //blank is down right
					out <= MUP;
				end else if (in0[27:26] < in0[15:14] && in0[25:24] == in0[13:12]) begin //blank is up
					out <= MDOWN;
				end else if (in0[27:26] < in0[15:14] && in0[25:24] < in0[13:12]) begin // blank is up left
					if (in0[27:24] == 4'b0110 && in0[19:16] == 4'b1111)begin
						out <= MDOWN;
					end else begin
						out <= MRIGHT;
					end
				end else if (in0[27:26] < in0[15:14] && in0[25:24] > in0[13:12]) begin // blank is up right
					out <= MDOWN;
				end
				zf <= 0;
			end

			COMP4  : begin
				if (in0[27:26] == in0[11:10] && in0[25:24] < in0[9:8]) begin //blank is left
					out <= MRIGHT;
				end else if (in0[27:26] == in0[11:10] && in0[25:24] > in0[9:8]) begin // blank is right
					if (in0[27:24] == 4'b1111 && in0[11:8] == 4'b1110)begin
						out <= MUP;
					end else begin
						out <= MDOWN;
					end
				end else if (in0[27:26] > in0[11:10] && in0[25:24] == in0[9:8]) begin //blank is down
					out <= MUP;
				end else if (in0[27:26] > in0[11:10] && in0[25:24] < in0[9:8]) begin //blank is down left
					out <= MUP;
				end else if (in0[27:26] > in0[11:10] && in0[25:24] > in0[9:8]) begin //blank is down right
					out <= MLEFT;
				end else if (in0[27:26] < in0[11:10] && in0[25:24] == in0[9:8]) begin //blank is up
					out <= MLEFT;
				end else if (in0[27:26] < in0[11:10] && in0[25:24] < in0[9:8]) begin // blank is up left
					out <= MDOWN;
				end else if (in0[27:26] < in0[11:10] && in0[25:24] > in0[9:8]) begin // blank is up right
					out <= MLEFT;
				end
				zf <= 0;
			end

			COMP7  : begin
				if (in0[27:26] == in0[3:2] && in0[25:24] < in0[1:0]) begin //blank is left
					out <= MRIGHT;
				end else if (in0[27:26] == in0[3:2] && in0[25:24] > in0[1:0]) begin // blank is right
					out <= MDOWN;
				end else if (in0[27:26] > in0[3:2] && in0[25:24] == in0[1:0]) begin //blank is down
					out <= MUP;
				end else if (in0[27:26] > in0[3:2] && in0[25:24] < in0[1:0]) begin //blank is down left
					out <= MRIGHT;
				end else if (in0[27:26] > in0[3:2] && in0[25:24] > in0[1:0]) begin //blank is down right
					out <= MLEFT;
				end else if (in0[27:26] < in0[3:2] && in0[25:24] == in0[1:0]) begin //blank is up
					out <= MLEFT;
				end else if (in0[27:26] < in0[3:2] && in0[25:24] < in0[1:0]) begin // blank is up left
					if (in0[27:24] == 4'b1010 && in0[3:0] == 4'b1111)begin
						out <= MDOWN;
					end else begin
						out <= MRIGHT;
					end
				end
				zf <= 0;
			end

			FIND  : begin
				case(in0)
				//synopsys parallel_case full_case
					0: out <= in1[27:24];
					1: out <= in1[23:20];
					2: out <= in1[19:16];
					3: out <= in1[15:12];
					4: out <= in1[11:8];
					5: out <= in1[7:4];
					7: out <= in1[3:0];
				endcase
				zf <= 0;
			end

			CHECK : begin
				zf  <= (in0 == in1) ? 1 : 0;
			end

			NOT_CHECK : begin
				zf  <= (in0 == in1) ? 0 : 1;
			end

			RIGHT     : begin
				if (in1[27:24] + 4'b0001 == in1[23:20]) begin //if right cell is 1
					out <= {in1[23:20], in1[27:24], in1[19:0]};
				end else if (in1[27:24] + 4'b0001 == in1[19:16]) begin //if right cell is 2
					out <= {in1[19:16], in1[23:20], in1[27:24], in1[15:0]};
				end else if (in1[27:24] + 4'b0001 == in1[15:12]) begin //if right cell is 3
					out <= {in1[15:12], in1[23:16], in1[27:24], in1[11:0]};
				end else if (in1[27:24] + 4'b0001 == in1[11:8]) begin //if right cell is 4
					out <= {in1[11:8], in1[23:12], in1[27:24], in1[7:0]};
				end else if (in1[27:24] + 4'b0001 == in1[7:4]) begin //if right cell is 5
					out <= {in1[7:4], in1[23:8], in1[27:24], in1[3:0]};
				end else if (in1[27:24] + 4'b0001 == in1[3:0]) begin //if right cell is 7
					out <= {in1[3:0], in1[23:4], in1[27:24]};
				end else begin // if right cell is 6 or 8
					out <= {in1 + 28'b0001_0000_0000_0000_0000_0000_0000};
				end
				zf <= 0;
			end

			LEFT      : begin
				if (in1[27:24] - 4'b0001 == in1[23:20]) begin //if right cell is 1
					out <= {in1[23:20], in1[27:24], in1[19:0]};
				end else if (in1[27:24] - 4'b0001 == in1[19:16]) begin //if right cell is 2
					out <= {in1[19:16], in1[23:20], in1[27:24], in1[15:0]};
				end else if (in1[27:24] - 4'b0001 == in1[15:12]) begin //if right cell is 3
					out <= {in1[15:12], in1[23:16], in1[27:24], in1[11:0]};
				end else if (in1[27:24] - 4'b0001 == in1[11:8]) begin //if right cell is 4
					out <= {in1[11:8], in1[23:12], in1[27:24], in1[7:0]};
				end else if (in1[27:24] - 4'b0001 == in1[7:4]) begin //if right cell is 5
					out <= {in1[7:4], in1[23:8], in1[27:24], in1[3:0]};
				end else if (in1[27:24] - 4'b0001 == in1[3:0]) begin //if right cell is 7
					out <= {in1[3:0], in1[23:4], in1[27:24]};
				end else begin // if right cell is 6 or 8
					out <= {in1 - 28'b0001_0000_0000_0000_0000_0000_0000};
				end
				zf <= 0;
			end

			UP        : begin
				if (in1[27:24] - 4'b0100 == in1[23:20]) begin //if right cell is 1
					out <= {in1[23:20], in1[27:24], in1[19:0]};
				end else if (in1[27:24] - 4'b0100 == in1[19:16]) begin //if right cell is 2
					out <= {in1[19:16], in1[23:20], in1[27:24], in1[15:0]};
				end else if (in1[27:24] - 4'b0100 == in1[15:12]) begin //if right cell is 3
					out <= {in1[15:12], in1[23:16], in1[27:24], in1[11:0]};
				end else if (in1[27:24] - 4'b0100 == in1[11:8]) begin //if right cell is 4
					out <= {in1[11:8], in1[23:12], in1[27:24], in1[7:0]};
				end else if (in1[27:24] - 4'b0100 == in1[7:4]) begin //if right cell is 5
					out <= {in1[7:4], in1[23:8], in1[27:24], in1[3:0]};
				end else if (in1[27:24] - 4'b0100 == in1[3:0]) begin //if right cell is 7
					out <= {in1[3:0], in1[23:4], in1[27:24]};
				end else begin // if right cell is 6 or 8
					out <= {in1 - 28'b0100_0000_0000_0000_0000_0000_0000};
				end
				zf <= 0;
			end

			DOWN      : begin
				if (in1[27:24] + 4'b0100 == in1[23:20]) begin //if right cell is 1
					out <= {in1[23:20], in1[27:24], in1[19:0]};
				end else if (in1[27:24] + 4'b0100 == in1[19:16]) begin //if right cell is 2
					out <= {in1[19:16], in1[23:20], in1[27:24], in1[15:0]};
				end else if (in1[27:24] + 4'b0100 == in1[15:12]) begin //if right cell is 3
					out <= {in1[15:12], in1[23:16], in1[27:24], in1[11:0]};
				end else if (in1[27:24] + 4'b0100 == in1[11:8]) begin //if right cell is 4
					out <= {in1[11:8], in1[23:12], in1[27:24], in1[7:0]};
				end else if (in1[27:24] + 4'b0100 == in1[7:4]) begin //if right cell is 5
					out <= {in1[7:4], in1[23:8], in1[27:24], in1[3:0]};
				end else if (in1[27:24] + 4'b0100 == in1[3:0]) begin //if right cell is 7
					out <= {in1[3:0], in1[23:4], in1[27:24]};
				end else begin // if right cell is 6 or 8
					out <= {in1 + 28'b0100_0000_0000_0000_0000_0000_0000};
				end
				zf <= 0;
			end

			LOAD  : begin
				out <= in0;
				zf  <= 0;
			end

			STORE : begin
				out <= in0;
				zf  <= 0;
			end

			LI    : begin
				out <= in0;
				zf  <= 0;
			end

			default: begin
				out <= out;
			end
		endcase
	end
endmodule
