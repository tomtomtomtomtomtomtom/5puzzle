module register(src0, src1, dst, we, data, clk, rst_n, outa, outb);
	input clk, rst_n;
	input [3:0] src0, src1;
	input [3:0] dst;
	input we;
	input [27:0] data;
	output [27:0] outa, outb;

	wire [27:0] NOW, COUNT, FINDING, NEXT;

	reg [27:0] regis [15:0];

	parameter [27:0] CURRENT = 28'b1111_0110_0101_1001_1110_1011_1011,
	ANSWER = 28'b1111_0101_0110_0111_1001_1010_1101,
	COUNTER = 28'b0000_0000_0000_0000_0000_0000_0000,
	COMPARE_WITH_ANSWER_BITS = 28'b0000_0000_0000_0000_0000_0000_0000,
	NEXT_MOVEMENT = 28'b0000_0000_0000_0000_0000_0000_0000;
	
	always @(posedge clk) begin
		if (!rst_n) begin
			// 初期・現在の盤面
			// ####_1111_2222_3333_4444_5555_7777
			regis[0] <= CURRENT;
			regis[1] <= ANSWER;
			regis[2] <= COUNTER;
			regis[3] <= COMPARE_WITH_ANSWER_BITS;
			regis[4] <= NEXT_MOVEMENT;
			regis[5] <= 0;
			regis[6] <= 0;
			regis[7] <= 0;
			regis[8] <= 0;
			regis[9] <= 0;
			regis[10] <= 0;
			regis[11] <= 0;
			regis[12] <= 0;
			regis[13] <= 0;
			regis[14] <= 0;
			regis[15] <= 0;
		end else begin
			if (we) begin
				regis[dst] <= data;
			end else begin
				regis[dst] <= regis[dst];
			end
		end
	end

	assign outa = regis[src0];
	assign outb = regis[src1];
	assign NOW = regis[0];
	assign COUNT = regis[2];
	assign FINDING = regis[3];
	assign NEXT = regis[4];
endmodule
