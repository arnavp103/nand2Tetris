/// A few metaprogramming scripts to help for the projects

// for(let i = 0; i < 16; i++) {
// 	console.log(`Not(in=a[${i}], out=Nota${i})`);
// }
// for(let i = 0; i < 16; i++) {
// 	console.log(`Not(in=b[${i}], out=Notb${i})`);
// }

// for(let i = 0; i < 16; i++) {
// 	console.log(`\tAnd(a=aAndb[${i}], b=sel, out=aAndbAndsel${i});`);
// }

// for(let i = 6; i < 16; i++) {
// 	console.log(`\tOr(a=tmp${i}, b=in[${i+1}], out=tmp${i+1});`);
// }

// for(let i = 0; i < 8; i++) {
// 	console.log(`\tRAM8(in=in, load=load${i+1}, address=address[3..5], out=out${i+1});`);
// }


// Mult.asm
// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// 3 * 2 = 3 + 3
// a * b = Σ^b_i=0{a}

// a = R0;
// b = R1;

// LOOP:	// What? JS has Labels?!
// 	Load @b
// 	JLE	to END// Jump to end if b is less than equal to zero

// 	a = a + R0 // Increment a by RO
// 	b = b - 1	// Note that b's value is not directly ever used in the multiplication
// 	// b serves as a conveniently initialized variable that is a counter
//  R2 = a

// 	GOTO LOOP

// END


// Fill.asm
// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// 16,384 is the screen mmap can be accesed by SCREEN 32 words is 512 px which is one row. 256 rows
// 24,756 is the keyboard can be accesed by KBD the register contains the scan code of the currently pressed key

// define FILLBLACK/FILLWHITE to fall through, have their checks happen in the functions themselves. If no then jump to LOOP


// LOOP:
// 	// Set i to zero
// 	@i
// 	M = 0

// 	@SCREEN
// 	D = M
// 	@color	// Out pointer
// 	M = D

// 	keyscan jmp to func2 otherwise fall through to func1

// FILLBLACK:
// 	set color + i to black
// 	i ++
// 	if i < SCREEN jmp to func1	// How do we do this?
// 								// i => d; @SCREEN D-M; JLE. Jump if i minus screen is negative

// @LOOP
// 0;JMP

// FILLWHITE:
// 	set color + i to white
// 	i ++
// 	if i < SCREEN jmp to func2


// @LOOP
// 0;JMP

