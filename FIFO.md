hii im in FIFO
# FIFO
```
module FIFO_16_8(
    input clk,
    input rst,
    input we,
    input re,
    input [7:0] data_in,
    output empty,
    output full,
    output reg [7:0] data_out
);

  reg [3:0] wr_pt;
  reg [3:0] rd_pt;
  reg [4:0] fifo_counter;
  reg [7:0] memory [15:0];

  integer i;

  assign empty = (fifo_counter == 5'd0);
  assign full  = (fifo_counter == 5'd16);

  // FIFO counter
  always @(posedge clk)
  begin
    if (rst)
      fifo_counter <= 5'd0;
    else if (we && !full && re && !empty)
      fifo_counter <= fifo_counter;
    else if (we && !full)
      fifo_counter <= fifo_counter + 1'b1;
    else if (re && !empty)
      fifo_counter <= fifo_counter - 1'b1;
  end

  // Write operation
  always @(posedge clk)
  begin
    if (rst)
    begin
      wr_pt <= 4'd0;
      for (i = 0; i < 16; i = i + 1)
        memory[i] <= 8'd0;
    end
    else if (we && !full)
    begin
      memory[wr_pt] <= data_in;
      wr_pt <= wr_pt + 1'b1;
    end
  end

  // Read operation
  always @(posedge clk)
  begin
    if (rst)
    begin
      rd_pt <= 4'd0;
      data_out <= 8'd0;
    end
    else if (re && !empty)
    begin
      data_out <= memory[rd_pt];
      rd_pt <= rd_pt + 1'b1;
    end
  end

endmodule
