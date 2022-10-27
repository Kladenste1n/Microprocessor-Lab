;Write a subroutine CHECK that will read an unsigned number N from P1 and send ‘Y’ to P2 if
;N turns out to be in the open interval (N1,N2) and send ‘N’ to P2 otherwise. The constants N1,
;N2 are defined by the DB directive as an array INTERVAL. We assume that N1 <N2 for proper
;operation. If N1, N2 are not entered properly (not satisfying the strict inequality condition),
;send ‘X’ to P2. 

ORG 0
INTERVAL: DB 10H,55H
	MOV DPTR,#0000H
	CLR A
	MOVC A,@A+DPTR
	MOV R0,A
	INC DPTR
	CLR A
	MOVC A,@A+DPTR
	MOV R1,A
LCALL CHECK
SJMP LAST
CHECK:
	MOV P1,#16H
	CLR A
	MOV A,R0
	SUBB A,R1
	JNC HERE1
	CLR C
	MOV A,P1
	SUBB A,R1
	JNC HERE2
	CLR C
	MOV A,R0
	SUBB A,P1
	JNC HERE2
	MOV P2,#59H
	RET
	HERE2:MOV P2,#4EH
	RET
	HERE1:MOV P2,#58H
	RET
LAST:END
