module memory(in, out, addr, rst_n, clk, we);
	input clk, rst_n, we;
	input [44:0] in;
	input [44:0] addr;
	output [44:0] out;

	reg [44:0] mem [59:0];
	wire [44:0] mem0, mem1, mem2, mem3, mem4, mem5, mem6, mem7;
	integer i;

	always @(posedge clk) begin
		if (!rst_n) begin 
      mem[0]=45'b00000_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00;
      mem[1]=45'b01100_10_10_11_01_01_00_10_11_10_00_01_01_00_00_00_00_00_00_00_00;
      mem[2]=45'b01100_10_10_11_01_00_01_11_10_10_00_01_01_00_00_00_00_00_00_00_00;
      mem[3]=45'b10000_10_11_01_00_10_10_11_01_01_00_10_11_10_00_01_01_00_00_00_00;
      mem[4]=45'b10000_11_10_00_10_11_01_00_01_11_10_10_00_01_11_01_00_00_00_00_00;
      mem[5]=45'b00100_11_10_00_01_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00;
      mem[6]=45'b10000_11_10_00_10_11_01_01_00_10_11_10_00_01_11_01_00_00_00_00_00;
      mem[7]=45'b01110_11_10_00_10_11_01_01_00_10_11_10_00_01_01_00_00_00_00_00_00;
      mem[8]=45'b10010_11_10_00_10_11_01_01_00_10_11_10_00_01_01_11_10_00_01_00_00;
      mem[9]=45'b00100_10_11_01_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00;
      mem[10]=45'b01110_10_10_11_01_00_01_11_10_10_00_01_11_01_00_00_00_00_00_00_00;
      mem[11]=45'b01110_11_10_00_10_11_01_00_01_11_10_10_00_01_01_00_00_00_00_00_00;
      mem[12]=45'b01110_11_10_00_10_11_01_01_00_10_10_11_01_00_01_00_00_00_00_00_00;
      mem[13]=45'b10010_10_11_01_00_10_10_11_01_00_01_11_10_00_10_11_01_00_01_00_00;
      mem[14]=45'b10010_11_10_00_01_11_10_10_00_01_01_11_10_00_10_11_01_01_00_00_00;
      mem[15]=45'b01110_11_10_10_00_01_01_11_10_00_10_11_01_01_00_00_00_00_00_00_00;
      mem[16]=45'b01110_11_10_10_00_01_01_11_10_10_00_01_11_01_00_00_00_00_00_00_00;
      mem[17]=45'b00110_11_10_10_00_01_01_00_00_00_00_00_00_00_00_00_00_00_00_00_00;
      mem[18]=45'b01100_10_10_11_01_01_00_10_10_11_01_00_01_00_00_00_00_00_00_00_00;
      mem[19]=45'b00110_10_11_10_00_01_01_00_00_00_00_00_00_00_00_00_00_00_00_00_00;
      mem[20]=45'b01110_10_10_11_01_00_01_11_10_00_10_11_01_00_01_00_00_00_00_00_00;
      mem[21]=45'b10000_11_10_00_10_11_01_00_01_11_10_00_10_11_01_00_01_00_00_00_00;
      mem[22]=45'b01110_10_11_10_00_01_01_11_10_00_10_11_01_01_00_00_00_00_00_00_00;
      mem[23]=45'b01010_11_10_00_01_11_10_10_00_01_01_00_00_00_00_00_00_00_00_00_00;
      mem[24]=45'b01110_11_10_10_00_01_11_01_00_10_10_11_01_01_00_00_00_00_00_00_00;
      mem[25]=45'b10000_10_11_10_00_01_11_01_00_10_11_10_00_01_11_01_00_00_00_00_00;
      mem[26]=45'b01100_10_11_10_00_01_01_11_10_10_00_01_01_00_00_00_00_00_00_00_00;
      mem[27]=45'b10100_11_10_00_01_11_10_10_00_01_11_01_00_10_11_10_00_01_11_01_00;
      mem[28]=45'b01110_11_10_00_01_11_10_10_00_01_01_11_10_00_01_00_00_00_00_00_00;
      mem[29]=45'b01110_10_11_10_00_01_01_11_10_00_10_11_01_00_01_00_00_00_00_00_00;
      mem[30]=45'b10000_11_10_00_01_11_10_10_00_01_01_11_10_10_00_01_01_00_00_00_00;
      mem[31]=45'b10000_11_10_10_00_01_11_01_00_10_11_10_00_01_11_01_00_00_00_00_00;
      mem[32]=45'b01010_10_11_10_00_01_01_11_10_00_01_00_00_00_00_00_00_00_00_00_00;
      mem[33]=45'b01110_11_10_10_00_01_01_11_10_00_10_11_01_00_01_00_00_00_00_00_00;
      mem[34]=45'b01010_11_10_10_00_01_01_11_10_00_01_00_00_00_00_00_00_00_00_00_00;
      mem[35]=45'b01100_11_10_10_00_01_01_11_10_10_00_01_01_00_00_00_00_00_00_00_00;
      mem[36]=45'b00110_10_10_11_01_01_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00;
      mem[37]=45'b00110_10_10_11_01_00_01_00_00_00_00_00_00_00_00_00_00_00_00_00_00;
      mem[38]=45'b01010_10_10_11_01_00_01_11_10_00_01_00_00_00_00_00_00_00_00_00_00;
      mem[39]=45'b01110_10_11_01_00_10_10_11_01_00_01_11_10_00_01_00_00_00_00_00_00;
      mem[40]=45'b01000_11_10_00_10_11_01_01_00_00_00_00_00_00_00_00_00_00_00_00_00;
      mem[41]=45'b10100_11_10_10_00_01_11_01_00_10_10_11_01_00_01_11_10_10_00_01_01;
      mem[42]=45'b01010_10_11_01_00_10_10_11_01_01_00_00_00_00_00_00_00_00_00_00_00;
      mem[43]=45'b10100_11_10_10_00_01_01_11_10_00_10_11_01_01_00_10_11_10_00_01_01;
      mem[44]=45'b00100_11_10_00_10_11_01_00_01_00_00_00_00_00_00_00_00_00_00_00_00;
      mem[45]=45'b01010_10_11_01_00_10_10_11_01_00_01_00_00_00_00_00_00_00_00_00_00;
      mem[46]=45'b01100_11_10_00_10_11_01_00_01_11_10_00_01_00_00_00_00_00_00_00_00;
      mem[47]=45'b10100_10_11_10_00_01_01_11_10_00_10_11_01_01_00_10_11_10_00_01_01;
      mem[48]=45'b01110_11_10_00_10_11_01_01_00_10_10_11_01_01_00_00_00_00_00_00_00;
      mem[49]=45'b01110_11_10_10_00_01_11_01_00_10_10_11_01_00_01_00_00_00_00_00_00;
      mem[50]=45'b01110_10_11_10_00_01_11_01_00_10_11_10_00_01_01_00_00_00_00_00_00;
      mem[51]=45'b01110_10_11_10_00_01_11_01_00_10_10_11_01_00_01_00_00_00_00_00_00;
      mem[52]=45'b00100_11_10_10_00_01_11_01_00_00_00_00_00_00_00_00_00_00_00_00_00;
      mem[53]=45'b10000_11_10_10_00_01_01_11_10_10_00_01_01_11_10_00_01_00_00_00_00;
      mem[54]=45'b10000_11_10_00_10_11_01_00_01_11_10_00_10_11_01_01_00_00_00_00_00;
      mem[55]=45'b10010_11_10_00_01_11_10_10_00_01_11_01_00_10_10_11_01_00_01_00_00;
      mem[56]=45'b01100_11_10_00_01_11_10_10_00_01_11_01_00_00_00_00_00_00_00_00_00;
      mem[57]=45'b01100_10_10_11_01_01_00_10_10_11_01_01_00_00_00_00_00_00_00_00_00;
      mem[58]=45'b00100_10_11_10_00_01_11_01_00_00_00_00_00_00_00_00_00_00_00_00_00;
      mem[59]=45'b01110_11_10_10_00_01_11_01_00_10_11_10_00_01_01_00_00_00_00_00_00;
		end else begin
			if (we) begin
				mem[addr] <= in;
			end else begin
				mem[addr] <= mem[addr];
			end
		end
	end

	assign out = mem[addr];
	assign mem0 = mem[0];
	assign mem1 = mem[1];
	assign mem2 = mem[2];
	assign mem3 = mem[3];
	assign mem4 = mem[4];
	assign mem5 = mem[5];
	assign mem6 = mem[6];
	assign mem7 = mem[7];

endmodule
