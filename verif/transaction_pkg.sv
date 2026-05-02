`timescale 1ns/1ps
package transaction_pkg;

    class Transaction;
        logic [15:0] address;
        logic [7:0]  data_in;
        logic [8:0]  data_out;
        logic [8:0]  expected_data;
        static int error = 0;

        function new();
            address       = $urandom();
            data_in       = $urandom();
            expected_data = {^data_in, data_in}; 
        endfunction

        function void print_data_out();
            $display("[%0t] data_out = 0x%0h  (parity=%0b  data=0x%0h)",
                     $time, data_out, data_out[8], data_out[7:0]);
        endfunction

        static function void print_error();
            $display("[%0t] Total errors: %0d", $time, error);
        endfunction 

        function void check();
            if (data_out !== expected_data) begin
                $display("[%0t] MISMATCH addr=0x%0h | expected=0x%0h | got=0x%0h",
                         $time, address, expected_data, data_out);
                error++;
            end else begin
                $display("[%0t] PASS     addr=0x%0h | data_out=0x%0h",
                         $time, address, data_out);
            end
        endfunction 

        function Transaction deep_copy();
            Transaction t   = new();
            t.address       = this.address;
            t.data_in       = this.data_in;
            t.data_out      = this.data_out;
            t.expected_data = this.expected_data;
            return t;
        endfunction 
    endclass 
endpackage 
