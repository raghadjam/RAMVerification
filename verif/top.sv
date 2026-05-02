`timescale 1ns/1ps

module top;
    logic clk;
    initial  clk = 0;
    always #50 clk = ~clk;


    initial begin

    $fsdbDumpfile("waves.fsdb");

    $fsdbDumpvars(0, top);

  end
    mem_if mif (.clk(clk));

    my_mem dut (.mif(mif.dut_mp));

    test test (.mif(mif.tb_mp));

endmodule
