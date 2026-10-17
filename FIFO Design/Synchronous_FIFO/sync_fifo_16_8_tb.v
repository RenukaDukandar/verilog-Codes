module sync_fifo_16_8_tb;

```
reg clk, rst, we, re;
reg [7:0] data_in;
wire empty, full;
wire [7:0] data_out;

sync_fifo_16_8 DUT (
    .clk(clk),
    .rst(rst),
    .we(we),
    .re(re),
    .data_in(data_in),
    .empty(empty),
    .full(full),
    .data_out(data_out)
);

// Clock generation
always #5 clk = ~clk;

// Initialization
initial begin
    clk = 0;
    rst = 1;
    we = 0;
    re = 0;
    data_in = 0;

    // Reset
    repeat (2) @(negedge clk);
    rst = 0;

    // Write 16 entries
    repeat (16) begin
        @(negedge clk);
        we = 1;
        data_in = $random;
    end

    @(negedge clk);
    we = 0;
    $display("After writes: full=%b, empty=%b", full, empty);

    // Read 16 entries
    repeat (16) begin
        @(negedge clk);
        re = 1;
    end

    @(negedge clk);
    re = 0;
    $display("After reads: full=%b, empty=%b", full, empty);

    // Write and read again
    @(negedge clk);
    we = 1;
    data_in = 8'hA5;

    @(negedge clk);
    we = 0;
    re = 1;

    @(negedge clk);
    re = 0;

    #10;
    $finish;
end

// Observe signals
initial begin
    $monitor("time=%0t rst=%b we=%b re=%b data_in=%h data_out=%h full=%b empty=%b",
             $time, rst, we, re, data_in, data_out, full, empty);
end

```
endmodule
