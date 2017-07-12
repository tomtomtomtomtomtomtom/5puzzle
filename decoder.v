module decoder(op, zf, pc_in, pc_we, src0, src1, dst, reg_we, sel1, sel2, data, alu_op, mem_we);
	input [10:0] op;
	input zf;
	output reg [7:0] pc_in;
	output reg pc_we;
	output reg [5:0] src0, src1, dst;
	output reg reg_we;
	output reg sel1, sel2;
	output reg [44:0] data;
	output reg [2:0] alu_op;
	output reg mem_we;

	`include "def.h"

	always @(*) begin
			case(op[10:8])
			//synopsys parallel_case full_case
			CHECK : begin
				alu_op <= op[10:8];
				dst    <= 0;
				src1   <= 60;
				src0   <= op[7:2];
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 0;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			JMP   : begin
				alu_op <= op[10:8];
				dst    <= 0;
				src1   <= 0;
				src0   <= 0;
				pc_in  <= op[7:0];
				pc_we  <= 1;
				reg_we <= 0;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			JNZ : begin
				alu_op <= op[10:8];
				dst    <= 0;
				src1   <= 0;
				src0   <= 0;
				pc_in  <= op[7:0];
				pc_we  <= zf;
				reg_we <= 0;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			LOAD : begin
				alu_op <= op[10:8];
				dst    <= 61;
				src1   <= 0;
				src0   <= 0;
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 1;
				sel1   <= 0;
				sel2   <= 1;
				data   <= {39'b00000_00000_00000_00000_00000_00000_00000_0000, op[7:2]};
				mem_we <= 0;
			end

			default : begin
				pc_we  <= 0;
			end

		endcase
	end
endmodule
