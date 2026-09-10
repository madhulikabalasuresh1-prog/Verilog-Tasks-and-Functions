`timescale 1ns/1ps

module function_parity_example;
    reg  [7:0] data;
    wire       parity;

    function calculate_parity;
        input [7:0] value;
        begin
            calculate_parity = ^value;
        end
    endfunction
    initial begin 
        $dumpfile("dump.vcd");
        $dumpvars();
       end

    assign parity = calculate_parity(data);

    initial begin
        data = 8'b10110101;
        #1;
        $display("PARITY FUNCTION: data=%b parity=%b", data, parity);
        $finish;
    end
endmodule
