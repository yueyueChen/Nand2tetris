// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

@24575	
D=A
@MAXSCREEN
M=D

@16384
D=A
@POINTER
M=D
(LOOP)
@KBD
D=M
@FILL
D;JNE
@UNFILL
D;JEQ



(FILL)
@MAXSCREEN
D=M
@POINTER
D=M-D
@LOOP
D;JGT

D=-1 // -1 = 1111111111111111
@POINTER
A=M
M=D
@1
D=A
@POINTER
M=M+D
@LOOP
0;JMP


(UNFILL)
@SCREEN
D=A
@POINTER
D=M-D
D;JLT

D=0
@POINTER
A=M
M=D
@1
D=A
@POINTER
M=M-D
@LOOP
0;JMP