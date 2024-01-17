//Name: Harry Wang
//Pledge: I pledge my honor that I have abided by the Stevens Honor System.


.text
.global _start
.extern printf


/* char _uppercase(char lower) */
_uppercase:
    /* Your code here 
        You must follow calling convention,
        and make this a procedure.
    */
    SUB SP, SP, 16 // Adding Frame Size
    STR X30,[SP] // Stack
   
    SUB X0,X0, 32 // Subtract ASCII value to make lowercase capital
    
    LDR X30,[SP] // Load Stacker Pointer back to X30
    ADD SP, SP , 16 // Deallocating Stacker Pointer
    RET // Return

/* int _toupper(char* string) */
_toupper:
    /* Your code here 

        You must call _uppercase() for every character in string.
        Both loop and recursion are good.

        You must follow calling convention,
        and make this a procedure.
    */
    SUB SP, SP , 16 // Allocating Frame Size
    STR X30,[SP] // Store X30 to Stacker Pointer
    
    MOV X8, 0 // counter
    MOV X9, 0 // index
    MOV X10,1 // X10 = 1
    MOV X20, X0 // Move parameter to X20

_loop:  
    LDRB W0, [X20,X9] // W0 holds one character from str
    CBZ W0, _done // null terminator = exit

    CMP W0, 'a' // Compare ASCII value of current character and "a"
    BLT _already // If its less than meaning its already uppercase
    CMP W0, 'z' // Compare ASCII value of current character and "z"
    BGT _already // If its greater than meaning its already uppsercase

    BL _uppercase // if its not uppsercase, call uppser case procedure

    STRB W0,[X20,X9] // store the single char back into str

    ADD X8,X8,X10 // increase counter
    ADD X9,X9,X10 // increase index
    B _loop // loop

_already:

    STRB W0,[X20,X9] 
    ADD X9,X9,X10
    B _loop

_done:
    LDR X30,[SP]
    ADD SP, SP , 16 
    MOV X0,X8
    RET 
    

_start:

    /* You code here:

        1. Call _toupper() to convert str;
        2. Call printf() to print outstr to show the result.
    
    */
    ADR X0 , str //load str into parameter register X0
    BL _toupper // call procedure toupper
    
    MOV X1,X0 // move the counter into X1
    ADR X0, outstr // move the format outstr into X0
    MOV X2, X20 // X2 requires the updated str
    BL printf // printf will print the format
    

    MOV  X0, 0 // end
    MOV  X8, 93
    SVC  0


.data
str:    .string   "helloworld"
outstr: .string   "Converted %ld characters: %s\n"
