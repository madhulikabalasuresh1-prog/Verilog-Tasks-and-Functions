`timescale 1ns/1ps

module task_increment_example;
    reg  [7:0] data_in;
    reg  [7:0] data_out;

    task increment_task;
        input  [7:0] input_data;
        output [7:0] output_data;
        begin
            output_data = input_data + 1'b1;
        end
    endtask
    initial begin 
        $dumpfile("dump.vcd");
        $dumpvars();
       end

    initial begin
        data_in = 8'd25;
        increment_task(data_in, data_out);
        $display("TASK INCREMENT: input=%0d output=%0d", data_in, data_out);
        $finish;
    end
endmodule
