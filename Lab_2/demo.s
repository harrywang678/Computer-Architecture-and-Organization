/*******************************************************************************
 * Filename: demo.s
 * Author  : Harry Wang
 * Version : 1.0
 * Date    : September 19, 2023
 * Description: Printing a string in Assembly.
 * Pledge  : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/


.text
.global _start
_start:
    
    ADR X1, msg // Address of msg will be in register X1
    ADR X0, label // Address of label will be in register X0
    LDR X2, [X0] // Load the data of X0 (msg) into register X2
    MOV X0, 1 // Set register X0 as integer 1
    MOV X8, 64 // Set register X8 as integer 64 to print (System call number 64 )
    SVC 0 // invoke the system call
    MOV X0, 0 // System call number 0 to register X0 (status <- 0)
    MOV X8, 93 // exit() is system call #93
    SVC 0 /* invoke the system call */
.data 
msg: .string "Hello World!\n" // "variable" msg = Hello World!
label: .quad 13 // "variable label = 13"
