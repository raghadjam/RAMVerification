`timescale 1ns/1ps
interface mem_if (input logic clk);

    logic write;
    logic read;
    logic [7:0] data_in;
    logic [15:0] address;
    logic [8:0] data_out;

    always @(posedge clk) begin
        if (read && write)
            $error("[%0t] ERROR: read and write at the same time", $time);
    end

    clocking cb @(posedge clk);
        output write, read, data_in, address;
        input  data_out;
    endclocking

    modport dut_mp (input clk, input write, input read, input data_in, input address, output data_out);

    modport tb_mp (clocking cb);

endinterface
