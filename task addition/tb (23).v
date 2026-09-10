`timescale 1ns/1ps

module task_addition_example;
    reg  [7:0] a;
    reg  [7:0] b;
    reg  [8:0] result;

    task add_numbers;
        input  [7:0] x;
        input  [7:0] y;
        output [8:0] sum;
        begin
            sum = x + y;
        end
    endtask
    initial begin 
        $dumpfile("dump.vcd");
        $dumpvars();
       end

    initial begin
        a = 8'd25;
        b = 8'd15;
        add_numbers(a, b, result);
        $display("TASK ADDITION: %0d + %0d = %0d", a, b, result);
        $finish;
    end
endmodule
