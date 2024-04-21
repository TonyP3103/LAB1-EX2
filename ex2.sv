module ex2 ( input logic clk,rst,c_in,
				input logic [7:0] a,
				output logic carry_out,ovr,
				output logic [7:0] out);
				
 logic [7:0] a_ff;
 logic [7:0] f_ff;
 logic c_out,overflow;
 always_ff @(posedge clk) begin
 if (!rst)
	out <= 8'b00000000;
else 
	out <= f_ff;
	end 
 always_ff @(posedge clk) begin 
  a_ff <= a;
  carry_out <= c_out;
  ovr <= overflow;
  end
overflow2 ovrfl (.a(a_ff),.b(out),.c_in(c_in),.sum(f_ff),.v(overflow), .c_out(c_out));
endmodule



module overflow2 (
		input logic [7:0] a,b,c_in,
		output logic [7:0] c_out, sum,
		output logic v,c);
adder add0 (.a(a[0]),.b(b[0]^ c_in),.c_in(c_in),.c_out(c_out[0]),.sum(sum[0]));
adder add1 (.a(a[1]),.b(b[1]^ c_in),.c_in(c_out[0]),.c_out(c_out[1]),.sum(sum[1]));
adder add2 (.a(a[2]),.b(b[2]^ c_in),.c_in(c_out[1]),.c_out(c_out[2]),.sum(sum[2]));
adder add3 (.a(a[3]),.b(b[3]^ c_in),.c_in(c_out[2]),.c_out(c_out[3]),.sum(sum[3]));
adder add4 (.a(a[4]),.b(b[4]^ c_in),.c_in(c_out[3]),.c_out(c_out[4]),.sum(sum[4]));
adder add5 (.a(a[5]),.b(b[5]^ c_in),.c_in(c_out[4]),.c_out(c_out[5]),.sum(sum[5]));
adder add6 (.a(a[6]),.b(b[6]^ c_in),.c_in(c_out[5]),.c_out(c_out[6]),.sum(sum[6]));
adder add7 (.a(a[7]),.b(b[7]^ c_in),.c_in(c_out[6]),.c_out(c_out[7]),.sum(sum[7]));
		assign v = c_out[6] ^ c_out[7];
		assign c = c_out[7];
		endmodule
		
module adder (	
	input logic a,b,c_in,
	output logic c_out, sum);
		assign c_out = (a & b)  | (a ^ b ) & c_in;
		assign sum = a ^ b ^ c_in;
			
	endmodule 
	
