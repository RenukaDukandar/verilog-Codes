module sync_fifo_16_8 (
input clk,
input rst,
input we,
input re,
input [7:0] data_in,
output empty,
output full,
output reg [7:0] data_out
);

reg [7:0] memory [0:15];
reg [3:0] wr_pt, rd_pt;
reg [4:0] fifo_counter;
integer i;

assign empty = (fifo_counter == 0);
assign full  = (fifo_counter == 16);

// FIFO occupancy counter
always @(posedge clk) begin
    if (rst)
        fifo_counter <= 0;
    else begin
        case ({we && !full, re && !empty})
            2'b10: fifo_counter <= fifo_counter + 1'b1;
            2'b01: fifo_counter <= fifo_counter - 1'b1;
            default: fifo_counter <= fifo_counter;
        endcase
    end
end

// Write operation
always @(posedge clk) begin
    if (rst) begin
        wr_pt <= 0;
        for (i = 0; i < 16; i = i + 1)
            memory[i] <= 0;
    end
    else if (we && !full) begin
        memory[wr_pt] <= data_in;
        wr_pt <= wr_pt + 1'b1;
    end
end

// Read operation
always @(posedge clk) begin
    if (rst) begin
        rd_pt <= 0;
        data_out <= 0;
    end
    else if (re && !empty) begin
        data_out <= memory[rd_pt];
        rd_pt <= rd_pt + 1'b1;
    end
end


endmodule
