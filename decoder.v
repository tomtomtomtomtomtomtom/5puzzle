module decoder(op, zf, pc_in, pc_we, src0, src1, dst, reg_we, sel1, sel2, data, alu_op, mem_we);
	input [43:0] op;
	input zf;
	output reg [11:0] pc_in;
	output reg pc_we;
	output reg [3:0] src0, src1, dst;
	output reg reg_we;
	output reg sel1, sel2;
	output reg [27:0] data;
	output reg [7:0] alu_op;
	output reg mem_we;

	`include "def.h"

	always @(*) begin
			case(op[43:36])
			//synopsys parallel_case full_case
			AND : begin
				alu_op <= op[43:36];
				dst    <= op[35:32];
				src1   <= op[31:28];
				src0   <= op[27:24];
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 1;
				sel1   <= 0;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			OR : begin
				alu_op <= op[43:36];
				dst    <= op[35:32];
				src1   <= op[31:28];
				src0   <= op[27:24];
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 1;
				sel1   <= 0;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			FIND  : begin
				alu_op <= op[43:36];
				dst    <= 3;
				src1   <= op[31:28];
				src0   <= 0;
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 1;
				sel1   <= 0;
				sel2   <= 0;
				data   <= op[27:21];
				mem_we <= 0;
			end

			// can delete 4 bits
			CHECK : begin
				alu_op <= op[43:36];
				dst    <= 0;
				src1   <= op[31:28];
				src0   <= 0;
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 0;
				sel1   <= 0;
				sel2   <= 0;
				data   <= op[27:0];
				mem_we <= 0;
			end

			//if src1 and data is not true, zf = 1 
			NOT_CHECK : begin
				alu_op <= op[43:36];
				dst    <= 0;
				src1   <= op[31:28];
				src0   <= 0;
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 0;
				sel1   <= 0;
				sel2   <= 0;
				data   <= op[27:0];
				mem_we <= 0;
			end

			COMP0_FOR_2_AND_3 : begin
				alu_op <= op[43:36];
				dst    <= 4;
				src1   <= 0;
				src0   <= 0;
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 1;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			COMP0_FOR_4_AND_7 : begin
				alu_op <= op[43:36];
				dst    <= 4;
				src1   <= 0;
				src0   <= 0;
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 1;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			COMP1 : begin
				alu_op <= op[43:36];
				dst    <= 4;
				src1   <= 0;
				src0   <= 0;
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 1;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			COMP2 : begin
				alu_op <= op[43:36];
				dst    <= 4;
				src1   <= 0;
				src0   <= 0;
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 1;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			COMP3 : begin
				alu_op <= op[43:36];
				dst    <= 4;
				src1   <= 0;
				src0   <= 0;
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 1;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			COMP4 : begin
				alu_op <= op[43:36];
				dst    <= 4;
				src1   <= 0;
				src0   <= 0;
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 1;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			COMP7 : begin
				alu_op <= op[43:36];
				dst    <= 4;
				src1   <= 0;
				src0   <= 0;
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 1;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			MOVE_COMPLETE : begin
				alu_op <= op[43:36];
				dst    <= 4;
				src1   <= 0;
				src0   <= 0;
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 1;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			RIGHT : begin
				alu_op <= op[43:36];
				dst    <= op[35:32];
				src1   <= op[31:28];
				src0   <= 0;
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 1;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			LEFT  : begin
				alu_op <= op[43:36];
				dst    <= op[35:32];
				src1   <= op[31:28];
				src0   <= 0;
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 1;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			UP    : begin
				alu_op <= op[43:36];
				dst    <= op[35:32];
				src1   <= op[31:28];
				src0   <= 0;
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 1;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end


			DOWN  : begin
				alu_op <= op[43:36];
				dst    <= op[35:32];
				src1   <= op[31:28];
				src0   <= 0;
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 1;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			JMP   : begin
				alu_op <= op[43:36];
				dst    <= 0;
				src1   <= 0;
				src0   <= 0;
				pc_in  <= op[11:0];
				pc_we  <= 1;
				reg_we <= 0;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			JNZ : begin
				alu_op <= op[43:36];
				dst    <= 0;
				src1   <= 0;
				src0   <= 0;
				pc_in  <= op[11:0];
				pc_we  <= zf;
				reg_we <= 0;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			INC: begin
				alu_op <= op[43:36];
				dst    <= op[35:32];
				src1   <= op[35:32];
				src0   <= 0;
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 1;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			LI : begin
				alu_op <= op[43:36];
				dst    <= op[35:32];
				src1   <= 0;
				src0   <= 0;
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 1;
				sel1   <= 1;
				sel2   <= 0;
				data   <= op[27:0];
				mem_we <= 0;
			end

			default : begin
				pc_we  <= 0;
			end

		endcase
	end
endmodule
