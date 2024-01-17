// Name: Harry Wang
// Pledge: I pledge my honor that I have abided by the Stevens Honor System
// lab3.s
.text
.global _start


_start: // label _start

    ADR X10, vec1 // got the address of vec1 and put it in register X10
    LDR X0, [X10] // load the first element of vec1 and loaded it in X0
    ADR X11, vec2 // got the address of vec2 and put it in register X11
    LDR X1, [X11] // got the first element of vec2 and loaded it in X1
    MUL X3, X1, X0 // Multiplied the first element of each vector
    LDR X0, [X10,8] // then got the second element of vector 1 and loaded it into X0
    LDR X1, [X11,8] // got the second element of vector 2 and loaded it into X1
    MUL X4, X1, X0 // multipled the two elements and the value is in X4
    LDR X0 ,[X10,16] // got the third element of vector 1 and loaded into X0
    LDR X1, [X11,16] // got the third element of vector 2 and loaded into X1
    MUL X5, X1, X0 // multipled the corresponding elements and is kept in X5
    ADD X6, X3, X4 // Added the values in X3 and X4 and kept in X6
    ADD X6, X6, X5 // Added the values in X6 and X5 and stored it in X6
    ADR X7, dot // Got the address of label dot and put it in X7
    STR X6, [X7] // Put the dot product "140" and stored it in X7 where dot address is.
    
    
    
    MOV X0, 0 // System call number 0 to register X0 (status <- 0)
    MOV X8, 93 // exit() is system call #93
    SVC 0 /* invoke the system call */

.data
vec1: .quad 10,20,30
vec2: .quad 1, 2 , 3
dot: .quad 0




