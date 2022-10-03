// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// 16,384 is the screen mmap can be accesed by SCREEN 32 words is 512 px in one row. 256 rows
// 24,756 is the keyboard can be accesed by KBD the register contains the scan code of the currently pressed key

// Put your code here.

// As I write this i realize i could've gotten rid of a loop

// 512 px in one row. Word size 16 so actually just do 32
// 256 rows so 256 * 32 = 8192 (dk why but it works at ~2300)
@2300
D = A
@R0 // Store this to check against our counter
M = D

(LOOP)
    // Set our counter to zero
	@count
	M = 0

    @SCREEN
	D = A
	@color	// Set our coloring pointer to screen
	M = D

    // Decide which function to go to
    @KBD
    D = M
    @FILLWHITE  // If no input, fillwhite
    D;JEQ
                // else fall through to fillblack

(FILLBLACK)
    // Store the count in D and then increment it
    @count
    D = M
    M = M+1
    @color
    A = D+M     // Set count + color to black
    M = -1      // M is referring to A here. I hope.

    // If count < screen loop back to FILLBLACK
    @count
    D = M
    @R0
    D = D-M     // D = count - R0
    @FILLBLACK
    D;JLT   // Jump if D is less than 0

@LOOP
0;JMP

(FILLWHITE)
    // Store the count in D and then increment it
    @count
    D = M
    M = M+1
    @color
    A = D+M     // Set count + color to white
    M = 0      // Color code for white is 0

    // If count < screen loop back to FILLWHITE
    @count
    D = M
    @R0
    D = D-M     // Same as above
    @FILLWHITE
    D;JLT


@LOOP
0;JMP

// DONE!