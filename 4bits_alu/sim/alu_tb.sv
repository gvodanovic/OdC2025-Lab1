`timescale 1ns / 1ps

module alu_tb;

    // Testbench signals to drive DUT inputs
    logic       tb_a_in_0;
    logic       tb_a_in_1;
    logic       tb_a_in_2;
    logic       tb_a_in_3;
    logic       tb_b_in_0;
    logic       tb_b_in_1;
    logic       tb_b_in_2;
    logic       tb_b_in_3;
    logic       tb_alu_op_0;
    logic       tb_alu_op_1;
    logic       tb_alu_op_2;

    // Testbench signals (wires) to observe DUT outputs
    wire        tb_alu_result_0;
    wire        tb_alu_result_1;
    wire        tb_alu_result_2;
    wire        tb_alu_result_3;
    wire        tb_zero_flag;
    wire        tb_carry_flag;

    // Group signals for easier assignment and display in TB
    logic [3:0] tb_a_in;
    logic [3:0] tb_b_in;
    logic [2:0] tb_alu_op;
    wire  [3:0] tb_alu_result;

    // Assign individual bits from grouped TB signals to DUT ports
    assign {tb_a_in_3, tb_a_in_2, tb_a_in_1, tb_a_in_0} = tb_a_in;
    assign {tb_b_in_3, tb_b_in_2, tb_b_in_1, tb_b_in_0} = tb_b_in;
    assign {tb_alu_op_2, tb_alu_op_1, tb_alu_op_0} = tb_alu_op;

    // Group DUT outputs for easier display
    assign tb_alu_result = {tb_alu_result_3, tb_alu_result_2, tb_alu_result_1, tb_alu_result_0};

    // Instantiate the Device Under Test (DUT)
    top dut (
        // Inputs
        .a_in_0     (tb_a_in_0),
        .a_in_1     (tb_a_in_1),
        .a_in_2     (tb_a_in_2),
        .a_in_3     (tb_a_in_3),

        .b_in_0     (tb_b_in_0),
        .b_in_1     (tb_b_in_1),
        .b_in_2     (tb_b_in_2),
        .b_in_3     (tb_b_in_3),

        .alu_op_0   (tb_alu_op_0),
        .alu_op_1   (tb_alu_op_1),
        .alu_op_2   (tb_alu_op_2),

        // Outputs
        .alu_result_0 (tb_alu_result_0),
        .alu_result_1 (tb_alu_result_1),
        .alu_result_2 (tb_alu_result_2),
        .alu_result_3 (tb_alu_result_3),
        .zero_flag    (tb_zero_flag),
        .carry_flag   (tb_carry_flag)
    );

    // Stimulus and Checking Process
    initial begin
        $display("               Starting ALU Testbench...");
        $display("               Time   A      B      Op   | Result Z C");
        $display("-------------------------------------------------------");

        // Initialize
        tb_a_in   = 4'b0000;
        tb_b_in   = 4'b0000;
        tb_alu_op = 3'b000; 
        #10; 

        tb_a_in   = 4'b0101;
        tb_b_in   = 4'b0011;
        tb_alu_op = 3'b000;
        #10; $display("%3t: %4b & %4b (000)  | %4b   %b %b", $time, tb_a_in, tb_b_in, tb_alu_result, tb_zero_flag, tb_carry_flag);

        tb_a_in   = 4'b0101;
        tb_b_in   = 4'b0011;
        tb_alu_op = 3'b001;
        #10; $display("%3t: %4b | %4b (001)  | %4b   %b %b", $time, tb_a_in, tb_b_in, tb_alu_result, tb_zero_flag, tb_carry_flag);

        tb_a_in   = 4'b0101;
        tb_b_in   = 4'b0011;
        tb_alu_op = 3'b010;
        #10; $display("%3t: %4b + %4b (010)  | %4b   %b %b", $time, tb_a_in, tb_b_in, tb_alu_result, tb_zero_flag, tb_carry_flag);

        tb_a_in   = 4'b1001;
        tb_b_in   = 4'b1001;
        tb_alu_op = 3'b010;
        #10; $display("%3t: %4b + %4b (010)  | %4b   %b %b", $time, tb_a_in, tb_b_in, tb_alu_result, tb_zero_flag, tb_carry_flag);

        tb_a_in   = 4'b1010;
        tb_b_in   = 4'b0101;
        tb_alu_op = 3'b000;
        #10; $display("%3t: %4b & %4b (000)  | %4b   %b %b", $time, tb_a_in, tb_b_in, tb_alu_result, tb_zero_flag, tb_carry_flag);

        tb_a_in   = 4'b1010;
        tb_b_in   = 4'b0101;
        tb_alu_op = 3'b110;
        #10; $display("%3t: %4b - %4b (110)  | %4b   %b %b", $time, tb_a_in, tb_b_in, tb_alu_result, tb_zero_flag, tb_carry_flag);


        tb_a_in   = 4'b0101; 
        tb_b_in   = 4'b1011;
        tb_alu_op = 3'b111;
        #10; $display("%3t: Pass B=%4b (111)  | %4b   %b %b", $time, tb_b_in, tb_alu_result, tb_zero_flag, tb_carry_flag);

        tb_a_in   = 4'b1111;
        tb_b_in   = 4'b1111;
        tb_alu_op = 3'b011;
        #10; $display("%3t: Undef Op=%4b (011)| %4b   %b %b", $time, tb_a_in, tb_b_in, tb_alu_result, tb_zero_flag, tb_carry_flag);

        $display("-------------------------------------------------------");
        $display("Testbench Finished.");
        $finish; // End the simulation
    end
endmodule