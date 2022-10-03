// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

/// Notes
// dest = comp ; jump (dest and jump are optional)
// @10
// D=A sets the d register to ten. @/A is the address or data register

// @17
// M = 0  sets RAM[17] to 0
// 16,384 is the screen mmap can be accesed by SCREEN 32 words is 512 px which is one row
// 24,756 is the keyboard can be accesed by KBD the register contains the scan code of the currently pressed key
// R0 - R15 are virtual registers that only refer to memory and not as a data variable

// @temp
// M=D // temp = R1

// @temp
// D=M
// @R0
// M=D // R0 = temp

// // Pointers can be got like this
// @arr
// D=M
// @i
// A = D + M // <- Here, any future changes that work on the A variable will be on D+M rather than the loaded value
// M = -1

// (END)
//     @END
//     0;JMP
// Put your code here:

@R2
M=0     // Eagerly evaluate the mult result to 0 in case
        // we have one or more zero factors

// Store R0 into a
@R0
D=M     // Put R0's value into the data register
@a
M=D

// Store R1 into b
@R1
D=M     // Put R1's value into the data register
@b
M=D
@END
D;JLE

(LOOP)

    @a
    // Set R2 to a in case we terminate
    D = M   // Set the value of D to a
    @R2
    M = D   // Kind of mixing sections but its nice

    // Store b into D
    @b
    M = M-1     // Decrement b by 1
    D = M
    @END        // This is our jmp address
    D;JLE       // We write a conditional jmp, if D
    // is less than or equal to zero we jmp

    // Increase a by R0
    @R0
    D=M     // Store R0's value to add it to a
    @a
    M = D+M // Apparently this is an opcode Legit



    @LOOP
    0;JMP   // repeat the loop

(END)
    @END
    0;JMP