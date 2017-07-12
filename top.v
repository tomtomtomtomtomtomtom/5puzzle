module top(clk, rst_n);
	input clk, rst_n;
	wire  pc_we, reg_we, mem_we;

	wire [7:0] pc_in, pc_out;
	wire [10:0] op;

	wire [5:0] dst;
	wire [5:0] src0, src1;
	wire [44:0] dec_data;

	wire [2:0] alu_op;
	wire [44:0] alu_out;

	wire zf, zf_out;

	wire sel1, sel2;
	wire [44:0] sel1_out, sel2_out;

	wire [44:0] reg_data0, reg_data1;

	wire [44:0] mem_data;

	sel sl(.in0(dec_data), .in1(reg_data0), .sel(sel1), .out(sel1_out));
	sel s2(.in0(alu_out), .in1(mem_data), .sel(sel2), .out(sel2_out));

	register r0(.src0(src0), .src1(src1), .dst(dst), .we(reg_we), .data(sel2_out), .clk(clk), .rst_n(rst_n), .outa(reg_data0), .outb(reg_data1));

	alu a0(.in0(sel1_out), .in1(reg_data1), .op(alu_op), .zf(zf), .out(alu_out));
	memory mem0(.in(alu_out), .out(mem_data), .addr(sel1_out), .rst_n(rst_n), .clk(clk), .we(mem_we));
	pc pc0(.pc_in(pc_in), .pc_out(pc_out), .rst_n(rst_n), .clk(clk), .we(pc_we));
	imem imem0(.pc(pc_out), .op(op));
	zf zf0(.clk(clk), .rst_n(rst_n), .zf_in(zf), .zf_out(zf_out));
	decoder dec1(.op(op), .zf(zf_out), .pc_in(pc_in), .pc_we(pc_we), .src0(src0), .src1(src1),  .dst(dst), .reg_we(reg_we), .sel1(sel1), .sel2(sel2), .data(dec_data), .alu_op(alu_op), .mem_we(mem_we));
endmodule 
