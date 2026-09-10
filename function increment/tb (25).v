`timescale 1ns/1ps

module function_increment_example;
    reg  [7:0] data_in;
    reg  [7:0] result;

    function [7:0] increment;
        input [7:0] input_data;
        begin
            increment = input_data + 1'b1;
        end
    endfunction
    initial begin 
        $dumpfile("dump.vcd");
        $dumpvars();
       end

    initial begin
        data_in = 8'd25;
        result = increment(data_in);
        $display("FUNCTION INCREMENT: input=%0d output=%0d", data_in, result);
        $finish;
    end
endmodule
