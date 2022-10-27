
;Write a main program to display all the courses you are currently taking this semester one by one in four digits using four seven-segment displays. 
;For example, if the currently taken courses are EEE212, EEE202, MATH242, HUM112, ENG401, then we would be continuously displaying the
;pattern 0212, 0202, 1242, 2112, 3401, 0212, 0202, on the four seven segment displays. For other departments, use other codes, i..e., most significant digit, you find
;appropriate. 


ORG 0
THERE:
DIGIT3:MOV R3,#00H
DIGIT2:MOV R2,#00H
DIGIT1:MOV R1,#00H
DIGIT0:MOV R0,#00H
	MOV R4,#8
CLR A

MAIN_P:
	DJNZ R4,HERE
	SJMP THERE

HERE:	MOV P0,#00H
	ACALL SEND_N1

	MOV P1,#00H
	ACALL SEND_N2

	MOV P2,#00H
	ACALL SEND_N3

	MOV P3,#00H
	ACALL SEND_N4
	
	LCALL DELAY
	
	SJMP MAIN_P



SEND_N1:
	
	ADD A,R0
	INC R0
	MOV DPTR,#ARRAY0
	MOVC A,@A+DPTR
	MOV P0,A
	CLR A
	RET
SEND_N2:
	ADD A,R1
	INC R1
	MOV DPTR,#ARRAY1
	MOVC A,@A+DPTR
	MOV P1,A
	CLR A
	RET

SEND_N3:
	ADD A,R2
	INC R2
	MOV DPTR,#ARRAY2
	MOVC A,@A+DPTR
	MOV P2,A
	CLR A
	RET

SEND_N4:
	ADD A,R3
	INC R3
	MOV DPTR,#ARRAY3
	MOVC A,@A+DPTR
	MOV P3,A
	CLR A
	RET

ORG 500h

DELAY:
	MOV R5,#01
	BACK5: MOV R6,#10
	BACK6: MOV R7,#10
	BACK7: DJNZ R7,BACK7
	DJNZ R6,BACK6
	DJNZ R5,BACK5
	RET

ORG 1300h
ARRAY0: DB 5Bh,07h,5Bh,6Fh,5Bh,6Dh,06h
ARRAY1: DB 3Fh,66h,06h,6Fh,66h,6Dh,4Fh
ARRAY2: DB 5Bh,66h,5Bh,5Bh,5Bh,5Bh,06h
ARRAY3: DB 3Fh,3Fh,3Fh,3Fh,06h,06h,5Bh
END 
