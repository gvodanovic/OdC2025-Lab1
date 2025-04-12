`timescale 1ns / 1ps

module alu(
    input a_in_0,
    input a_in_1,
    input a_in_2,
    input a_in_3,
    input b_in_0,
    input b_in_1,
    input b_in_2,
    input b_in_3,
    input alu_op_0,
    input alu_op_1,
    input alu_op_2,
    output alu_result_0,
    output alu_result_1,
    output alu_result_2,
    output alu_result_3,
    output zero_flag,
    output carry_flag
    );
    
    assign a_in_0 = alu_result_0;
    assign a_in_1 = alu_result_1;
    assign a_in_2 = alu_result_2;
    assign a_in_3 = alu_result_3;
       
    //------------------------- AND (000) -------------------------
    
    //------------------------- OR  (001) -------------------------
    
    //------------------------- ADD (010) -------------------------
    
    //------------------------- SUB (110) -------------------------
    
    //------------------------- PIB (111) -------------------------
    
    //---------------------------- MUX ----------------------------
    
    //--------------------------- FLAGS ---------------------------
    
    
endmodule
