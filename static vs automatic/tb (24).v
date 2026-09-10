`timescale 1ns/1ps

module static_vs_automatic_example;
    task static_task;
        input [7:0] value;
        begin
            $display("[%0t] Static start:    value=%0d", $time, value);
            #10;
            $display("[%0t] Static end:      value=%0d", $time, value);
        end
    endtask

    task automatic automatic_task;
        input [7:0] value;
        begin
            $display("[%0t] Automatic start: value=%0d", $time, value);
            #10;
            $display("[%0t] Automatic end:   value=%0d", $time, value);
        end
    endtask

    initial begin
        $display("--- STATIC TASK: shared storage ---");
        fork
            static_task(8'd10);
            begin
                #2;
                static_task(8'd20);
            end
        join

        #5;
        $display("--- AUTOMATIC TASK: separate storage ---");
        fork
            automatic_task(8'd10);
            begin
                #2;
                automatic_task(8'd20);
            end
        join

        #1;
        $finish;
    end
endmodule
