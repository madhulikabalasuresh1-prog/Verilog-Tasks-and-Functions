`timescale 1ns/1ps

module task_vs_function_example;
    reg [7:0] a;
    reg [7:0] b;
    reg [8:0] task_result;
    reg [8:0] function_result;

    task add_task;
        input  [7:0] x;
        input  [7:0] y;
        output [8:0] sum;
        begin
            sum = x + y;
        end
    endtask

    function [8:0] add_function;
        input [7:0] x;
        input [7:0] y;
        begin
            add_function = x + y;
        end
    endfunction
    initial begin 
        $dumpfile("dump.vcd");
        $dumpvars();
       end

    initial begin
        a = 8'd12;
        b = 8'd8;
        add_task(a, b, task_result);
        function_result = add_function(a, b);
        $display("TASK RESULT:     %0d", task_result);
        $display("FUNCTION RESULT: %0d", function_result);
        $finish;
    end
endmodule
