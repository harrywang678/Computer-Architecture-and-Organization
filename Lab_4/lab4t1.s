// Harry Wang
// I pledge my honor that I have abided by the Stevens Honor System.

.text
.global _start

_start: 

    ADR X0, side_a // load the address of side a to X0
    ADR X1, side_b // load the address of side b to X1
    ADR X2, side_c // load the address of side c to X2
    LDR X0, [X0] // load the data of side a to X0
    LDR X1, [X1] // load the data of side b to X1
    LDR X2, [X2] // load the data of side c to X2
    MUL X0, X0, X0 // Square root side a data
    MUL X1, X1, X1 // Square root side b data
    MUL X2, X2, X2 // Square root side c data
    ADD X3, X0, X1 // add a^2 and b^2
    CMP X3, X2 // compare if c^2 and a^2 and b^2 
    B.EQ _yes // if equal, yes its a right triangle
    B.NE _no // if not equal, not a right triangle

_yes: 
    ADR X1, yes // load the address of yes to X1
    ADR X2, len_yes // load the address of length of string yes to X2
    LDR X2, [X2] // load the data of the length to X2
    MOV X0, 1 // Make X0 value as 1
    MOV X8, 64 // make X8 value as 64 to print
    SVC 0 /* invoke the system call */
    MOV X0, 0 // System call number 0 to register X0 (status <- 0)
    MOV X8, 93 // exit() is system call #93
    SVC 0 /* invoke the system call */

_no:
    ADR X1, no // load the address of no to X1
    ADR X2, len_no // load the address of length of string no to X2
    LDR X2, [X2] // load the data of the length to X2
    MOV X0, 1 // Make X0 value as 1
    MOV X8, 64 // make X8 value as 64 to print
    SVC 0 /* invoke the system call */
    MOV X0, 0 // System call number 0 to register X0 (status <- 0)
    MOV X8, 93 // exit() is system call #93
    SVC 0 /* invoke the system call */

    

.data
side_a: .quad 3
side_b: .quad 4
side_c: .quad 5
yes: .string "It is a right triangle.\n"
len_yes: .quad . - yes // Calculate the length of string yes
no: .string "It is not a right triangle.\n"
len_no: .quad . - no // Calculate the length of string no
