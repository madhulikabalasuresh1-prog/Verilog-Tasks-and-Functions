`timescale 1ns/1ps

module synthesizable_task_function (
    input      [7:0] a,
    input      [7:0] b,
    input            subtract,
    output reg [7:0] arithmetic_result,
    output     [7:0] maximum
);
    task arithmetic_task;
        input        operation;
        input  [7:0] x;
        input  [7:0] y;
        output [7:0] result;
        begin
            if (operation)
                result = x - y;
            else
                result = x + y;
        end
    endtask
    initial begin 
        $dumpfile("dump.vcd");
        $dumpvars();
       end

    function [7:0] max8;
        input [7:0] x;
        input [7:0] y;
        begin
            if (x > y)
                max8 = x;
            else
                max8 = y;
        end
    endfunction

    always @(*) begin
        arithmetic_task(subtract, a, b, arithmetic_result);
    end

    assign maximum = max8(a, b);
endmodule

module synthesizable_task_function_tb;
    reg  [7:0] a;
    reg  [7:0] b;
    reg        subtract;
    wire [7:0] arithmetic_result;
    wire [7:0] maximum;

    synthesizable_task_function dut (
        .a(a),
        .b(b),
        .subtract(subtract),
        .arithmetic_result(arithmetic_result),
        .maximum(maximum)
    );
    

    initial begin
        a = 8'd25; b = 8'd15; subtract = 1'b0;
        #1;
        $display("SYNTH ADD: %0d + %0d = %0d, max=%0d", a, b, arithmetic_result, maximum);

        subtract = 1'b1;
        #1;
        $display("SYNTH SUB: %0d - %0d = %0d, max=%0d", a, b, arithmetic_result, maximum);
        $finish;
    end
endmodule
