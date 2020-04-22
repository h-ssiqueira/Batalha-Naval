;Alcides Gomes Beato Neto					RA 19060987
;Henrique Sartori Siqueira					RA 19240472
;Maria Julia de Carvalho Pellegrinelli				RA 19323559
;Thiago Hideki Honda						RA 19310515

;Organizacao de Computadores e Linguagem de Montagem
;2019
;Engenharia de Computacao
;PUC-CAMPINAS

TITLE BATALHANAVAL
.MODEL SMALL
.STACK 100H
.DATA
L1	DB	0Ah,0Dh,"          ",0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0BBh,20h,20h,0DBh,0DBh,0DBh,0DBh,0DBh,0BBh,20h,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0BBh,20h,0DBh,0DBh,0DBh,0DBh,0DBh,0BBh,20h,0DBh,0DBh,0BBh,20h,20h,20h,20h,20h,0DBh,0DBh,0BBh,20h,20h,0DBh,0DBh,0BBh,20h,0DBh,0DBh,0DBh,0DBh,0DBh,0BBh,20h,"$"
L2	DB	0Ah,0Dh,"          ",0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BBh,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BBh,0C8h,0CDh,0CDh,0DBh,0DBh,0C9h,0CDh,0CDh,0BCh,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BBh,0DBh,0DBh,0BAh,20h,20h,20h,20h,20h,0DBh,0DBh,0BAh,20h,20h,0DBh,0DBh,0BAh,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BBh,"$"
L3	DB	0Ah,0Dh,"          ",0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0c9h,0BCh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0BAh,20h,20h,20h,0DBh,0DBh,0BAh,20h,20h,20h,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0BAh,0DBh,0DBh,0BAh,20h,20h,20h,20h,20h,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0BAh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0BAh,"$"
L4	DB	0Ah,0Dh,"          ",0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BBh,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BAh,20h,20h,20h,0DBh,0DBh,0BAh,20h,20h,20h,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BAh,0DBh,0DBh,0BAh,20h,20h,20h,20h,20h,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BAh,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BAh,"$"
L5	DB	0Ah,0Dh,"          ",0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0c9h,0BCh,0DBh,0DBh,0BAh,20h,20h,0DBh,0DBh,0BAh,20h,20h,20h,0DBh,0DBh,0BAh,20h,20h,20h,0DBh,0DBh,0BAh,20h,20h,0DBh,0DBh,0BAh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0BBh,0DBh,0DBh,0BAh,20h,20h,0DBh,0DBh,0BAh,0DBh,0DBh,0BAh,20h,20h,0DBh,0DBh,0BAh,"$"
L6	DB	0Ah,0Dh,"          ",0C8h,0CDh,0CDh,0CDh,0CDh,0CDh,0BCh,20h,0C8h,0CDh,0BCh,20h,20h,0C8h,0CDh,0BCh,20h,20h,20h,0C8h,0CDh,0BCh,20h,20h,20h,0C8h,0CDh,0BCh,20h,20h,0C8h,0CDh,0BCh,0C8H,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0BCh,0C8h,0CDh,0BCh,20h,20h,0C8h,0CDh,0BCh,0C8h,0CDh,0BCh,20h,20h,0C8h,0CDh,0BCh,"$"
L7	DB	0Ah,0Dh,"                 ",0DBh,0DBh,0DBh,0BBh,20h,20h,20h,0DBh,0DBh,0BBh,20h,0DBh,0DBh,0DBh,0DBh,0DBh,0BBh,20h,0DBh,0DBh,0BBh,20h,20h,20h,0DBh,0DBh,0BBh,20h,0DBh,0DBh,0DBh,0DBh,0DBh,0BBh,20h,0DBh,0DBh,0BBh,20h,20h,20h,20h,20h,"$"
L8	DB	0Ah,0Dh,"                 ",0DBh,0DBh,0DBh,0DBh,0BBh,20h,20h,0DBh,0DBh,0BAh,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BBh,0DBh,0DBh,0BAh,20h,20h,20h,0DBh,0DBh,0BAh,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BBh,0DBh,0DBh,0BAh,20h,20h,20h,20h,20h,"$"
L9	DB	0Ah,0Dh,"                 ",0DBh,0DBh,0C9h,0DBh,0DBh,0BBh,20h,0DBh,0DBh,0BAh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0BAh,0DBh,0DBh,0BAh,20h,20h,20h,0DBh,0DBh,0BAh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0BAh,0DBh,0DBh,0BAh,20h,20h,20h,20h,20h,"$"
L10	DB	0Ah,0Dh,"                 ",0DBh,0DBh,0BAh,0C8h,0DBh,0DBh,0BBh,0DBh,0DBh,0BAh,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BAh,0C8h,0DBh,0DBh,0BBh,20h,0DBh,0DBh,0C9h,0BCh,0DBh,0DBh,0C9h,0CDh,0CDh,0DBh,0DBh,0BAh,0DBh,0DBh,0BAh,20h,20h,20h,20h,20h,"$"
L11	DB	0Ah,0Dh,"                 ",0DBh,0DBh,0BAh,20h,0C8h,0DBh,0DBh,0DBh,0DBh,0BAh,0DBh,0DBh,0BAh,20h,20h,0DBh,0DBh,0BAh,20h,0C8h,0DBh,0DBh,0DBh,0DBh,0C9h,0BCh,20h,0DBh,0DBh,0BAh,20h,20h,0DBh,0DBh,0BAh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0BBh,"$"
L12	DB	0Ah,0Dh,"                 ",0C8h,0CDh,0BCh,20h,20h,0C8h,0CDh,0CDh,0CDh,0BCh,0C8h,0CDh,0BCh,20h,20h,0C8h,0CDh,0BCh,20h,20h,0C8h,0CDh,0CDh,0CDh,0BCh,20h,20h,0C8h,0CDh,0BCh,20h,20h,0C8h,0CDh,0BCh,0C8H,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0BCh,"$"
V1	DB	0Ah,0Dh," _|      _|  _|_|_|  _|_|_|_|_|    _|_|    _|_|_|    _|_|_|    _|_|  $"
V2	DB	0Ah,0Dh," _|      _|    _|        _|      _|    _|  _|    _|    _|    _|    _|$"
V3	DB	0Ah,0Dh," _|      _|    _|        _|      _|    _|  _|_|_|      _|    _|_|_|_|$"
V4	DB	0Ah,0Dh,"   _|  _|      _|        _|      _|    _|  _|    _|    _|    _|    _|$"
V5	DB	0Ah,0Dh,"     _|      _|_|_|      _|        _|_|    _|    _|  _|_|_|  _|    _|",0Ah,0Dh,"$"
V6	DB	0Ah,0Dh,"       _|    _|_|      _|_|_|    _|_|    _|_|_|      _|_|    _|_|_|   $"
V7	DB	"       _|  _|    _|  _|        _|    _|  _|    _|  _|    _|  _|    _| $"
V8	DB	"       _|  _|    _|  _|  _|_|  _|_|_|_|  _|    _|  _|    _|  _|_|_|   $"
V9	DB	" _|    _|  _|    _|  _|    _|  _|    _|  _|    _|  _|    _|  _|    _| $"
V10	DB	"   _|_|      _|_|      _|_|_|  _|    _|  _|_|_|      _|_|    _|    _| $"
V11	DB	0Ah,0Dh," _|_|_|     _|_|   _|_|_|     _|_|   _|_|_|   _|_|_|_| _|      _|   _|_|_| _|$"
V12	DB	0Ah,0Dh," _|    _| _|    _| _|    _| _|    _| _|    _| _|       _|_|    _| _|       _|$"
V13	DB	0Ah,0Dh," _|_|_|   _|_|_|_| _|_|_|   _|_|_|_| _|_|_|   _|_|_|   _|  _|  _|   _|_|   _|$"
V14	DB	0Ah,0Dh," _|       _|    _| _|    _| _|    _| _|    _| _|       _|    _|_|       _|   $"
V15	DB	0Ah,0Dh," _|       _|    _| _|    _| _|    _| _|_|_|   _|_|_|_| _|      _| _|_|_|   _|$"
ONE1	DB	"   _|",0Ah,0Dh,"$"  ;Utiliza-se 4 vezes
ONE2	DB	" _|_|",0Ah,0Dh,"$"
TWO1	DB	"   _|_|  ",0Ah,0Dh,"$"
TWO2	DB	" _|    _|",0Ah,0Dh,"$"
TWO3	DB	"     _|  ",0Ah,0Dh,"$"
TWO4	DB	"   _|    ",0Ah,0Dh,"$"
TWO5	DB	" _|_|_|_|",0Ah,0Dh,"$"
	INICIO DB "Para iniciar o jogo, aperte ENTER", 0Ah, 0Dh, "$"
	CONT1 DB (0) ;Contador de acertos do jogador 1
	CONT2 DB (0) ;Contador de acertos do jogador 2
	JOCOUNT1 DB (0) ; Contador de jogadas player1
	JOCOUNT2 DB (0) ; Contador de jogadas player2
	TABULEIRO1 	DB 36 DUP (0) ;Posicao sem navio vale 0.
	TABULEIRO2 	DB 36 DUP (0) 
	J1T1 DB "JOGADOR 1 - TABULEIRO 1", 10, 13, "$"
	J2T2 DB 10, 13, 10, 13, "JOGADOR 2 - TABULEIRO 2", 10, 13, "$"
	LC DB 10, 13, "Linha e coluna da posicao: $"
	P1 DB 10, 13, 10, 13, "Vez do jogador 1: $"
	P2 DB 10, 13, 10, 13, "Vez do jogador 2: $"
	FAIL DB 10, 13, "Valor invalido! Tente novamente$"
	WATER DB 10, 13, "Tiro na agua!$"
	PE DB 10, 13, "Posicao ja escolhida! Jogue novamente$"
	NA DB 10, 13, "Navio acertado!$"
.CODE
EXIBET1 PROC
   PUSH SI
   PUSH BX 
   PUSH CX
   MOV AH,2
   MOV DL,10
   INT 21H
   MOV AH,2
   MOV DL,13
   INT 21H 
   
   XOR SI,SI
   XOR BX,BX
   MOV CH,6
   
   RESETAL1:
   MOV CL,6
   EXIBEL1:
   MOV AH,2
   MOV DL,TABULEIRO1[BX][SI]
   CMP DL,1
   JNE ISNTONE1
   ADD DL,47
   JMP CONTINUE1
   ISNTONE1:
   ADD DL,48
   CONTINUE1:
   INT 21H
   INC SI
   DEC CL
   JNZ EXIBEL1
   DEC CH
   MOV AH,2
   MOV DL,10
   INT 21H
   MOV AH,2
   MOV DL,13
   INT 21H   
   JNZ RESETAL1
   
   POP CX
   POP BX
   POP SI
   RET
EXIBET1 ENDP

EXIBET2 PROC
   PUSH SI
   PUSH BX 
   PUSH CX
   
   MOV AH,2
   MOV DL,10
   INT 21H
   MOV AH,2
   MOV DL,13
   INT 21H 
   
   XOR SI,SI
   XOR BX,BX
   MOV CH,6
   
   RESETAL2:
   MOV CL,6
   EXIBEL2:
   MOV AH,2
   MOV DL,TABULEIRO2[BX][SI]
   CMP DL,1
   JNE ISNTONE2
   ADD DL,47
   JMP CONTINUE2
   ISNTONE2:
   ADD DL,48
   CONTINUE2:
   INT 21H
   INC SI
   DEC CL
   JNZ EXIBEL2
   DEC CH
   MOV AH,2
   MOV DL,10
   INT 21H
   MOV AH,2
   MOV DL,13
   INT 21H   
   JNZ RESETAL2
   
   POP CX
   POP BX
   POP SI
   RET
EXIBET2 ENDP

PROC TITULO

MOV AH,9
LEA DX, L1
INT 21H
LEA DX, L2
INT 21H
LEA DX, L3
INT 21H
LEA DX, L4
INT 21H
LEA DX, L5
INT 21H
LEA DX, L6
INT 21H
LEA DX, L7
INT 21H
LEA DX, L8
INT 21H
LEA DX, L9
INT 21H
LEA DX, L10
INT 21H
LEA DX, L11
INT 21H
LEA DX, L12
INT 21H

RET 
ENDP TITULO

 ;Referencia: http://regismain.wikidot.com/assembler
;MOV AX, 0B800h ;Move o endereço de vídeo para AX 
;MOV ES, AX ;Aponta ES para o segmento de vídeo
;XOR DI, DI ;Zera DI 
;MOV CX, 2000 ;Move 2000 (80x25) para CX
;MOV AH, AH ;Move o atributo para AH 
;MOV AL, CH ;Move o caracter a usar para AL 
;REP STOSW ;Faz isso 
;RET

PROC LIMPATELA
MOV AH, 0 
MOV AL, 3 
INT 10H
RET
ENDP LIMPATELA

PROC PULALINHA
MOV CX, 2
P:
MOV AH, 2
MOV DL, 10
INT 21H
MOV DL, 13
INT 21H
LOOP P
RET
ENDP PULALINHA 

PROC LERTABS
XOR BX, BX ;MOV BX, 0 
XOR SI, SI ;MOV SI, 0 

JMP MSG

ERRO1:
MOV AH, 9
LEA DX, FAIL
INT 21H

MSG:
MOV AH, 9
LEA DX, LC
INT 21H

MOV AH, 7
INT 21H
AND AL, 11011111B
CMP AL, 65
JB ERRO1
CMP AL, 70
JA ERRO1

MOV BL, AL
SUB BL, 65
JZ L

MOV DL, BL
XOR BL, BL ;MOV BL, 0 

LINHA:
ADD BL, 6

DEC DL
JNZ LINHA

L:
XOR BH, BH ;MOV BH, 0
MOV AH, 7
INT 21H
CMP AL, 49
JB ERRO1
CMP AL, 54
JA ERRO1

SUB AL,49
JZ PP
XOR SI, SI ;MOV SI, 0 
MOV DH, AL

COLUNA:
INC SI
DEC DH
JNZ COLUNA
PP:
RET
ENDP LERTABS 


PROC WIN

MOV AH, 9
LEA DX, V1
INT 21H
LEA DX, V2
INT 21H
LEA DX, V3
INT 21H
LEA DX, V4
INT 21H
LEA DX, V5
INT 21H

RET 
ENDP WIN

PROC PLA1
MOV AH, 9
LEA DX, V6
INT 21H
LEA DX, ONE1
INT 21H
LEA DX, V7
INT 21H
LEA DX, ONE2
INT 21H
LEA DX, V8
INT 21H
LEA DX, ONE1
INT 21H
LEA DX, V9
INT 21H
LEA DX, ONE1
INT 21H
LEA DX, V10
INT 21H
LEA DX, ONE1
INT 21H
RET
ENDP PLA1


PROC PLA2
MOV AH, 9
LEA DX, V6
INT 21H
LEA DX, TWO1
INT 21H
LEA DX, V7
INT 21H
LEA DX, TWO2
INT 21H
LEA DX, V8
INT 21H
LEA DX, TWO3
INT 21H
LEA DX, V9
INT 21H
LEA DX, TWO4
INT 21H
LEA DX, V10
INT 21H
LEA DX, TWO5
INT 21H
RET
ENDP PLA2


PROC CONGRATZ
MOV AH, 9
LEA DX, V11
INT 21H
LEA DX, V12
INT 21H
LEA DX, V13
INT 21H
LEA DX, V14
INT 21H
LEA DX, V15
INT 21H

RET
ENDP CONGRATZ


PROC MAIN

MOV AX, @DATA
MOV DS, AX

MOV AH, 0 
MOV AL, 3 
INT 10H

CALL LIMPATELA
CALL TITULO
CALL PULALINHA

MOV AH, 9
LEA DX, INICIO
INT 21H

INICIAR:
MOV AH, 7
INT 21H
CMP AL, 13
JNE INICIAR 

COMECOU:
CALL LIMPATELA
MOV AH, 9
LEA DX, J1T1
INT 21H
MOV CX, 5

LER1:
JMP CONTINUA
ERRO3:
MOV AH, 9
LEA DX, PE
INT 21H

CONTINUA:
CALL LERTABS
CMP TABULEIRO1[BX+SI], 1
JE ERRO3
MOV TABULEIRO1[BX+SI], 1
LOOP LER1

CALL LIMPATELA

MOV CX, 5
MOV AH, 9
LEA DX, J2T2
INT 21H
LER2:
JMP CONTINUA2
ERRO4:
MOV AH, 9
LEA DX, PE
INT 21H
CONTINUA2:
CALL LERTABS
CMP TABULEIRO2[BX+SI], 1
JE ERRO4
MOV TABULEIRO2[BX+SI], 1
LOOP LER2

JOGADA:
CALL LIMPATELA
CALL EXIBET2
MOV AH, 9
LEA DX, P1
INT 21H
PLAYER1:
CALL LERTABS

CMP TABULEIRO2[BX+SI], 2
JE OCUPADO1
CMP TABULEIRO2[BX+SI], 0
JE AGUA1

MOV AH, 9
LEA DX, NA
INT 21H
INC CONT1
JMP POSICAO1

OCUPADO1:
MOV AH, 9
LEA DX, PE
INT 21H
JMP PLAYER1

AGUA1:
MOV AH, 9
LEA DX, WATER
INT 21H


POSICAO1:
MOV TABULEIRO2[BX+SI], 2
CALL EXIBET2

CMP CONT1, 5
JE FIM1

MOV AH,1
INT 21h
XOR AL,AL

CALL LIMPATELA
CALL EXIBET1

MOV AH, 9
LEA DX, P2
INT 21H
PLAYER2:
CALL LERTABS

CMP TABULEIRO1[BX+SI], 2
JE OCUPADO2
CMP TABULEIRO1[BX+SI], 0
JE AGUA2

MOV AH, 9
LEA DX, NA
INT 21H
INC CONT2
JMP POSICAO2

OCUPADO2:
MOV AH, 9
LEA DX, PE
INT 21H
JMP PLAYER2

AGUA2:
MOV AH, 9
LEA DX, WATER
INT 21H

POSICAO2:
MOV TABULEIRO1[BX+SI], 2
CALL EXIBET1

CMP CONT2, 5
JE FIM2

MOV AH,1
INT 21h
XOR AL,AL

JMP JOGADA

FIM1:
CALL LIMPATELA
CALL PULALINHA
CALL WIN
CALL PLA1
CALL CONGRATZ
JMP FIM

FIM2:
CALL LIMPATELA
CALL PULALINHA
CALL WIN
CALL PLA2
CALL CONGRATZ

FIM:
CALL PULALINHA
MOV AH, 4CH
INT 21H

ENDP MAIN

END MAIN









