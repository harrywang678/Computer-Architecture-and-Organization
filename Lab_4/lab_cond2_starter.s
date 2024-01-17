// Harry Wang
// I pledge my honor that I have abided by the Stevens Honor System.

.text
.global _start
.extern scanf

_start:
    
    ADR   X0, fmt_str   // Load address of formated string
    ADR   X1, left      // Load &left
    ADR   X2, right     // Load &right
    ADR   X3, target    // Load &target
    BL    scanf         // scanf("%ld %ld %ld", &left, &right, &target);

    ADR   X1, left      // Load &left
    LDR   X1, [X1]      // Store left in X1
    ADR   X2, right     // Load &right
    LDR   X2, [X2]      // Store right in X2
    ADR   X3, target    // Load &target
    LDR   X3, [X3]      // Store target in X3

    /* Your code here */

    CMP X1 X3
    B.LT secondcheck
    B norange

secondcheck:

    CMP X2 X3
    B.GT yesrange 
    B norange

yesrange:
    ADR X1, yes
    ADR X2, len_yes
    LDR X2, [X2]
    MOV X0, 1
    MOV X8, 64
    SVC 0
    B exit

norange:

    ADR X1, no
    ADR X2, len_no
    LDR X2, [X2]
    MOV X0, 1
    MOV X8, 64
    SVC 0
    B exit

exit:

    MOV   X0, 0        // Pass 0 to exit()
    MOV   X8, 93       // Move syscall number 93 (exit) to X8
    SVC   0            // Invoke syscall

.data
    left:    .quad     0
    right:   .quad     0
    target:  .quad     0
    fmt_str: .string   "%ld %ld %ld"
    yes:     .string   "Target is in range\n"
    no:      .string   "Target is not in range\n"
    len_yes: .quad     19
    len_no:  .quad     23
