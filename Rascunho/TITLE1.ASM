TITLE QUAD
.MODEL SMALL
.STACK 100h
.DATA
QUAD DB "         1   2   3   4   5   6                  1   2   3   4   5   6",10,13,"$"
QUAD1 DB "       ",218,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,191,"              ",218,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,191,10,13,"$"
QUAD2A DB "     A ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,"            A ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,10,13,"$"
QUAD2B DB "     B ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,"            B ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,10,13,"$"
QUAD2C DB "     C ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,"            C ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,10,13,"$"
QUAD2D DB "     D ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,"            D ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,10,13,"$"
QUAD2E DB "     E ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,"            E ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,10,13,"$"
QUAD2F DB "     F ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,"            F ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,"   ",179,10,13,"$"
QUAD3 DB "       ",195,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,180,"              ",195,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,180,10,13,"$"
QUAD4 DB "       ",192,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,217,"              ",192,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,217,10,13,"$"
.CODE
PULALINHA PROC
MOV AH,2
MOV DL,10
INT 21h
MOV DL,13
INT 21h
RET
PULALINHA ENDP

MAIN PROC
MOV AX,@DATA
MOV DS,AX
MOV ES,AX

MOV AH, 0
MOV AL, 3
INT 10H


MOV AX,1
INT 33h

MOV CX,5
PULA:
CALL PULALINHA
LOOP PULA

;MOV AH,19
;MOV BH,25 ; Nº
;MOV AL,1Eh ; Cor
;MOV CX,2 ; Nº pág
;MOV DH,4 ; Linha
;MOV DL,6 ; Coluna
;MOV ES,QUAD ; Offset da string
;INT 10h

;MOV AH,6
;MOV AL,0
;MOV BH,1Eh
;XOR CX,CX
;MOV DH,25
;MOV DL,80
;INT 10h


;MOV AH,9
;MOV AL,0
;MOV BH,0
;MOV BL,1Fh
;MOV CX,68
;MOV DH,5
;MOV DL,0
;LEA DX,QUAD
;INT 21h

  MOV BL,7
	MOV  ah,13h
  MOV  bp, OFFSET QUAD
  MOV  bh,0

  MOV  cx,71
  MOV  dl,0
  MOV  dh,5
  int  10h

	MOV  ah,13h
  MOV  bp, OFFSET QUAD1
  MOV  bh,0

  MOV  cx,71
  MOV  dl,0
  MOV  dh,6
  int  10h

	MOV  ah,13h
  MOV  bp, OFFSET QUAD2A
  MOV  bh,0

  MOV  cx,71
  MOV  dl,0
  MOV  dh,7
  int  10h

	MOV  ah,13h
  MOV  bp, OFFSET QUAD3
  MOV  bh,0

  MOV  cx,71
  MOV  dl,0
  MOV  dh,8
  int  10h

	MOV  ah,13h
  MOV  bp, OFFSET QUAD2B
  MOV  bh,0

  MOV  cx,71
  MOV  dl,0
  MOV  dh,9
  int  10h

	MOV  ah,13h
  MOV  bp, OFFSET QUAD3
  MOV  bh,0

  MOV  cx,71
  MOV  dl,0
  MOV  dh,10
  int  10h

	MOV  ah,13h
  MOV  bp, OFFSET QUAD2C
  MOV  bh,0

  MOV  cx,71
  MOV  dl,0
  MOV  dh,11
  int  10h

	MOV  ah,13h
  MOV  bp, OFFSET QUAD3
  MOV  bh,0

  MOV  cx,71
  MOV  dl,0
  MOV  dh,12
  int  10h

	MOV  ah,13h
  MOV  bp, OFFSET QUAD2D
  MOV  bh,0

  MOV  cx,71
  MOV  dl,0
  MOV  dh,13
  int  10h

	MOV  ah,13h
  MOV  bp, OFFSET QUAD3
  MOV  bh,0

  MOV  cx,71
  MOV  dl,0
  MOV  dh,14
  int  10h

	MOV  ah,13h
  MOV  bp, OFFSET QUAD2E
  MOV  bh,0

  MOV  cx,71
  MOV  dl,0
  MOV  dh,15
  int  10h

	MOV  ah,13h
  MOV  bp, OFFSET QUAD3
  MOV  bh,0

  MOV  cx,71
  MOV  dl,0
  MOV  dh,16
  int  10h

	MOV  ah,13h
  MOV  bp, OFFSET QUAD2F
  MOV  bh,0

  MOV  cx,71
  MOV  dl,0
  MOV  dh,17
  int  10h

    MOV  ah,13h
  MOV  bp, OFFSET QUAD4
  MOV  bh,0

  MOV  cx,71
  MOV  dl,0
  MOV  dh,18
  int  10h

LEA DX,QUAD1
INT 21h
LEA DX,QUAD2A
INT 21h
LEA DX,QUAD3
INT 21h
LEA DX,QUAD2B
INT 21h
LEA DX,QUAD3
INT 21h
LEA DX,QUAD2C
INT 21h
LEA DX,QUAD3
INT 21h
LEA DX,QUAD2D
INT 21h
LEA DX,QUAD3
INT 21h
LEA DX,QUAD2E
INT 21h
LEA DX,QUAD3
INT 21h
LEA DX,QUAD2F
INT 21h
LEA DX,QUAD4
INT 21h




MOV AH,4Ch
INT 21h

MAIN ENDP
END MAIN

