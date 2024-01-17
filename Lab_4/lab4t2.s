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

    CMP X1, X3 // compare the values of X1 and X3 (left and target)
    B.LT secondcheck // if X1 is less than X3, check if X3 is smaller than X2
    B norange // if X1 is not less than X3, its not in range

secondcheck:

    CMP X2, X3 // compare the values of X2 and X3
    B.GT yesrange // if X2 is greater than X3, its in range
    B norange // if its not, then its not in range

yesrange:
    ADR X1, yes // get the address of yes to X1
    ADR X2, len_yes // get the address of the length of len_yes into X2
    LDR X2, [X2] // get the len_yes data into X2
    MOV X0, 1 // X0 has value of 1
    MOV X8, 64 // X8 has value of 64 to print
    SVC 0 // invoke system call
    B exit // go to label exit

norange:

    ADR X1, no // get the address of no to X1
    ADR X2, len_no // get the address of len_no to X2
    LDR X2, [X2] // get the len_no data into X2
    MOV X0, 1 // X0 has value of 1
    MOV X8, 64 // X8 has value of 64 to print
    SVC 0 // invoke system call
    B exit // exit

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
