`timescale 1ns/1ps
program automatic test(mem_if.tb_mp mif);

    import transaction_pkg::*;

    Transaction drive_q [$];    
    Transaction check_q [$];    

    localparam int NUM_TRANS = 10;

    task automatic generate_transactions();
        for (int i = 0; i < NUM_TRANS; i++) begin
            Transaction t = new(); 
            drive_q.push_back(t);
            $display("[%0t] GEN  [%0d]: addr=0x%0h  data_in=0x%0h  expected=0x%0h",
                     $time, i, t.address, t.data_in, t.expected_data);
        end
    endtask 

    task automatic drive_transactions();
        Transaction t;
        while (drive_q.size() > 0) begin
            t = drive_q.pop_front();

            @(mif.cb);
            mif.cb.write   <= 1;
            mif.cb.read    <= 0;
            mif.cb.address <= t.address;
            mif.cb.data_in <= t.data_in;

            @(mif.cb);          
            mif.cb.write   <= 0;
            mif.cb.read    <= 0;
	    
	    @(mif.cb);  

            @(mif.cb);
            mif.cb.read    <= 1;
            mif.cb.address <= t.address;

            @(mif.cb);          
            mif.cb.read    <= 0;

	    @(mif.cb);              

            t.data_out = mif.cb.data_out;
            check_q.push_back(t.deep_copy());

            $display("[%0t] DRV: addr=0x%0h  data_out captured=0x%0h",
                     $time, t.address, t.data_out);
        end
    endtask

    task automatic collect_output();
        foreach (check_q[i]) begin
            $display("[%0t] MON  [%0d]: addr=0x%0h  data_out=0x%0h",
                     $time, i, check_q[i].address, check_q[i].data_out);
            check_q[i].print_data_out();
        end
    endtask

    task automatic check_transactions();
        Transaction t;
        while (check_q.size() > 0) begin
            t = check_q.pop_front();
            t.check();
        end
        Transaction::print_error();
    endtask

    initial begin    
        mif.cb.write   <= 0;
        mif.cb.read    <= 0;
        mif.cb.data_in <= 0;
        mif.cb.address <= 0;

        repeat(2) @(mif.cb);  
        generate_transactions();  
        drive_transactions();      
        collect_output();          
        check_transactions();      
        $finish;
    end

endprogram 
