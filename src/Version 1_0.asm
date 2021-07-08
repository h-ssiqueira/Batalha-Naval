TITLE JOGO BATALHA NAVAL
.MODEL SMALL
.STACK 100H
.DATA
	MSG1 DB 0AH,0DH," BATALHA NAVAL 1.0 ASSEMBLY $"
	MSG2 DB 0AH,0DH," --------------------------------------------------- $"
	MSG3 DB 0AH,0DH," JOGO DESENVOLVIDO EM LINGUAGEM ASSEMBLY $"
	MSG4 DB 0AH,0DH," Para iniciar o jogo digite: s $"
	MSG5 DB 0AH,0DH," Para sair do jogo digite: e $"
	MSG6 DB 0AH,0DH," VOLTE SEMPRE! $"
	MSG7 DB 0AH,0DH," Obrigado por escolher nosso jogo. $"
	MSG8 DB 0AH,0DH," Bem Vindo ao BATALHA NAVAL 1.0. $"
	MSG9 DB 0AH,0DH," Digite: $"
	MSG11 DB 0AH,0DH," JOGADOR 1: DIGITE AS CORDENADAS DE SEUS BARCOS(LINHA X COLUNA) EX: b3 ou c4. $"
	MSG12 DB 0AH,0DH," JOGADOR 2: DIGITE AS CORDENADAS DE SEUS BARCOS(LINHA X COLUNA) EX: b3 ou c4. $"
	MSG13 DB 0AH,0DH," ESSA POSICAO JA FOI ATINGIDA! $"
	MSG14 DB 0AH,0DH," ESSA POSICAO JA FOI OCUPADA! $"
	MSG15 DB 0AH,0DH," JOGADOR 1: DIGITE AS CORDENADAS QUE QUER ATINGIR(LINHA X COLUNA) EX: b3 ou c4. $"
	MSG16 DB 0AH,0DH," JOGADOR 2: DIGITE AS CORDENADAS QUE QUER ATINGIR(LINHA X COLUNA) EX: b3 ou c4. $"
	P1VENCEU DB 0AH,0DH," PARABENS JOGADOR 1 VOCE DESTRUIU SEU INIMIGO! $"
	P2VENCEU DB 0AH,0DH," PARABENS JOGADOR 2 VOCE DESTRUIU SEU INIMIGO! $"
	MSGESPACO DB "  $"
	MSGERRO DB " COORDENADA INVALIDA! DIGITE NOVAMENTE!$"
	COUNT1 DB "0$"
	COUNT2 DB "0$"
	BARCOATINGIDO DB " PARABENS VOCE ACABOU DE AFUNDAR UM DOS BARCOS DE SEU INIMIGO! $"
	BARCONATINGIDO DB 0AH,0DH," VOCE NAO ACERTOU SEU INIMIGO! TENTE DENOVO NA SUA PROXIMA RODADA. $"
	CONTBATALHA DB 0AH,0DH," PRESSIONE ENTER PARA CONTINUAR A BATALHA! $"
	PARALELA DB "   1  2  3  4  5  6$"
	TAB1A DB "000000$"
	TAB1B DB "000000$"
	TAB1C DB "000000$"
	TAB1D DB "000000$"
	TAB1E DB "000000$"
	TAB1F DB "000000$"

	TAB2A DB "000000$"
	TAB2B DB "000000$"
	TAB2C DB "000000$"
	TAB2D DB "000000$"
	TAB2E DB "000000$"
	TAB2F DB "000000$"

	TAB1VETA DB "000000$"
	TAB1VETB DB "000000$"
	TAB1VETC DB "000000$"
	TAB1VETD DB "000000$"
	TAB1VETE DB "000000$"
	TAB1VETF DB "000000$"

	TAB2VETA DB "000000$"
	TAB2VETB DB "000000$"
	TAB2VETC DB "000000$"
	TAB2VETD DB "000000$"
	TAB2VETE DB "000000$"
	TAB2VETF DB "000000$"

.CODE

;procedimeto p/ limpar a tela
PROC LIMPATELA
	MOV AH,00H
	MOV AL,3
	INT 10H
	RET
ENDP LIMPATELA

;procedimento se a posição ja foi atingida
PROC POSATINGIDA
	MOV AH,9
	LEA DX,MSG13
	INT 21H
	RET
ENDP POSATINGIDA

;procedimeto se a posição ja foi ocupada
PROC P_OCUPADA
	MOV AH,9
	LEA DX,MSG14
	INT 21H
	ADD CX,1
	RET
ENDP P_OCUPADA

;procedimento espaço
PROC ESPACO
	MOV AH,9
	LEA DX,MSGESPACO
	INT 21H
	RET
ENDP ESPACO

;procedimento para pular linha
PROC PLINHA
	MOV AH,2
	MOV DL,0AH
	INT 21H
	MOV AH,2
	MOV DL,0DH
	INT 21H
	RET
ENDP

;procedimento que mostra o tabuleiro 1
PROC TABULEIRO1
	MOV BL,0
	MOV CL,'A'
	MOV BX,0
	MOV AH,9
	LEA DX,PARALELA
	INT 21H
	CALL PLINHA

	MOV AH,2
	MOV DL,CL
	INT 21H
	CALL ESPACO

	STARTA1:
	MOV AH,2
	MOV DL,TAB1A[BX]
	INT 21H
	CALL ESPACO
	INC BX
	CMP BX,6
	JNE STARTA1
	CALL PLINHA
	MOV BX,0
	INC CL

	MOV AH,2
	MOV DL,CL
	INT 21H
	CALL ESPACO

	STARTB1:
	MOV AH,2
	MOV DL,TAB1B[BX]
	INT 21H
	CALL ESPACO
	INC BX
	CMP BX,6
	JNE STARTB1
	CALL PLINHA
	MOV BX,0
	INC CL

	MOV AH,2
	MOV DL,CL
	INT 21H
	CALL ESPACO

	STARTC1:
	MOV AH,2
	MOV DL,TAB1C[BX]
	INT 21H
	CALL ESPACO
	INC BX
	CMP BX,6
	JNE STARTC1
	CALL PLINHA
	MOV BX,0
	INC CL

	MOV AH,2
	MOV DL,CL
	INT 21H
	CALL ESPACO

	STARTD1:
	MOV AH,2
	MOV DL,TAB1D[BX]
	INT 21H
	CALL ESPACO
	INC BX
	CMP BX,6
	JNE STARTD1
	CALL PLINHA
	MOV BX,0
	INC CL

	MOV AH,2
	MOV DL,CL
	INT 21H
	CALL ESPACO

	STARTE1:
	MOV AH,2
	MOV DL,TAB1E[BX]
	INT 21H
	CALL ESPACO
	INC BX
	CMP BX,6
	JNE STARTE1
	CALL PLINHA
	MOV BX,0
	INC CL

	MOV AH,2
	MOV DL,CL
	INT 21H
	CALL ESPACO

	STARTF1:
	MOV AH,2
	MOV DL,TAB1F[BX]
	INT 21H
	CALL ESPACO
	INC BX
	CMP BX,6
	JNE STARTF1
	CALL PLINHA
	MOV BX,0
	INC CL

	RET
ENDP TABULEIRO1

;procedimento que mostra o tabuleiro 2
PROC TABULEIRO2
	MOV BL,0
	MOV CL,'A'
	MOV BX,0
	MOV AH,9
	LEA DX,PARALELA
	INT 21H
	CALL PLINHA

	MOV AH,2
	MOV DL,CL
	INT 21H
	CALL ESPACO

	STARTA2:
	MOV AH,2
	MOV DL,TAB2A[BX]
	INT 21H
	CALL ESPACO
	INC BX
	CMP BX,6
	JNE STARTA2
	CALL PLINHA
	MOV BX,0
	INC CL

	MOV AH,2
	MOV DL,CL
	INT 21H
	CALL ESPACO

	STARTB2:
	MOV AH,2
	MOV DL,TAB2B[BX]
	INT 21H
	CALL ESPACO
	INC BX
	CMP BX,6
	JNE STARTB2
	CALL PLINHA
	MOV BX,0
	INC CL

	MOV AH,2
	MOV DL,CL
	INT 21H
	CALL ESPACO

	STARTC2:
	MOV AH,2
	MOV DL,TAB2C[BX]
	INT 21H
	CALL ESPACO
	INC BX
	CMP BX,6
	JNE STARTC2
	CALL PLINHA
	MOV BX,0
	INC CL

	MOV AH,2
	MOV DL,CL
	INT 21H
	CALL ESPACO

	STARTD2:
	MOV AH,2
	MOV DL,TAB2D[BX]
	INT 21H
	CALL ESPACO
	INC BX
	CMP BX,6
	JNE STARTD2
	CALL PLINHA
	MOV BX,0
	INC CL

	MOV AH,2
	MOV DL,CL
	INT 21H
	CALL ESPACO

	STARTE2:
	MOV AH,2
	MOV DL,TAB2E[BX]
	INT 21H
	CALL ESPACO
	INC BX
	CMP BX,6
	JNE STARTE2
	CALL PLINHA
	MOV BX,0
	INC CL

	MOV AH,2
	MOV DL,CL
	INT 21H
	CALL ESPACO

	STARTF2:
	MOV AH,2
	MOV DL,TAB2F[BX]
	INT 21H
	CALL ESPACO
	INC BX
	CMP BX,6
	JNE STARTF2
	CALL PLINHA
	MOV BX,0
	INC CL

	RET
ENDP TABULEIRO2

;procedimento que atira na matriz 'a' do jogador 1
PROC P1TAB1A
SHOOTP1A:
	CMP TAB1A[SI],'X'
	JE ERRO2A
	CMP TAB1VETA[SI],'1'
	JE P1DESTROIA
	CMP TAB1VETA[SI],'0'
	JBE ERRO1A
P1DESTROIA:
	ADD COUNT1,1
	MOV TAB1A[SI],'X'
	CALL PLINHA
	MOV AH,9
	LEA DX,BARCOATINGIDO
	INT 21H
	JMP P1TAB1AJMP
ERRO1A:
	MOV TAB1A[SI],'*'
	MOV AH,9
	LEA DX,BARCONATINGIDO
	INT 21H
	JMP P1TAB1AJMP
ERRO2A:
	CALL POSATINGIDA
	JMP P1TAB1AJMP
P1TAB1AJMP:
	MOV AH,9
	LEA DX,CONTBATALHA
	INT 21H
	RET
ENDP P1TAB1A

;procedimento que atira na matriz 'b' do jogador 1
PROC P1TAB1B
SHOOTP1B:
	CMP TAB1B[SI],'X'
	JE ERRO2B
	CMP TAB1VETB[SI],'1'
	JE P1DESTROIB
	CMP TAB1VETB[SI],'0'
	JBE ERRO1B
P1DESTROIB:
	ADD COUNT1,1
	MOV TAB1B[SI],'X'
	CALL PLINHA
	MOV AH,9
	LEA DX,BARCOATINGIDO
	INT 21H
	JMP P1TAB1BJMP
ERRO1B:
	MOV TAB1B[SI],'*'
	MOV AH,9
	LEA DX,BARCONATINGIDO
	INT 21H
	JMP P1TAB1BJMP
ERRO2B:
	CALL POSATINGIDA
	JMP P1TAB1BJMP
P1TAB1BJMP:
	MOV AH,9
	LEA DX,CONTBATALHA
	INT 21H
	RET
ENDP P1TAB1B

;procedimento que atira na matriz 'c' do jogador 1
PROC P1TAB1C
SHOOTP1C:
	CMP TAB1C[SI],'X'
	JE ERRO2C
	CMP TAB1VETC[SI],'1'
	JE P1DESTROIC
	CMP TAB1VETC[SI],'0'
	JBE ERRO1C
P1DESTROIC:
	ADD COUNT1,1
	MOV TAB1C[SI],'X'
	CALL PLINHA
	MOV AH,9
	LEA DX,BARCOATINGIDO
	INT 21H
	JMP P1TAB1CJMP
ERRO1C:
	MOV TAB1C[SI],'*'
	MOV AH,9
	LEA DX,BARCONATINGIDO
	INT 21H
	JMP P1TAB1CJMP
ERRO2C:
	CALL POSATINGIDA
	JMP P1TAB1CJMP
P1TAB1CJMP:
	MOV AH,9
	LEA DX,CONTBATALHA
	INT 21H
	RET
ENDP P1TAB1C

;procedimento que atira na matriz 'd' do jogador 1
PROC P1TAB1D
SHOOTP1D:
	CMP TAB1D[SI],'X'
	JE ERRO2D
	CMP TAB1VETD[SI],'1'
	JE P1DESTROID
	CMP TAB1VETD[SI],'0'
	JBE ERRO1D
P1DESTROID:
	ADD COUNT1,1
	MOV TAB1D[SI],'X'
	CALL PLINHA
	MOV AH,9
	LEA DX,BARCOATINGIDO
	INT 21H
	JMP P1TAB1DJMP
ERRO1D:
	MOV TAB1D[SI],'*'
	MOV AH,9
	LEA DX,BARCONATINGIDO
	INT 21H
	JMP P1TAB1DJMP
ERRO2D:
	CALL POSATINGIDA
	JMP P1TAB1DJMP
P1TAB1DJMP:
	MOV AH,9
	LEA DX,CONTBATALHA
	INT 21H
	RET
ENDP P1TAB1D

;procedimento que atira na matriz 'e' do jogador 1
PROC P1TAB1E
SHOOTP1E:
	CMP TAB1E[SI],'X'
	JE ERRO2E
	CMP TAB1VETE[SI],'1'
	JE P1DESTROIE
	CMP TAB1VETE[SI],'0'
	JBE ERRO1E
P1DESTROIE:
	ADD COUNT1,1
	MOV TAB1E[SI],'X'
	CALL PLINHA
	MOV AH,9
	LEA DX,BARCOATINGIDO
	INT 21H
	JMP P1TAB1EJMP
ERRO1E:
	MOV TAB1E[SI],'*'
	MOV AH,9
	LEA DX,BARCONATINGIDO
	INT 21H
	JMP P1TAB1EJMP
ERRO2E:
	CALL POSATINGIDA
	JMP P1TAB1EJMP
P1TAB1EJMP:
	MOV AH,9
	LEA DX,CONTBATALHA
	INT 21H
	RET
ENDP P1TAB1E

;procedimento que atira na matriz 'f' do jogador 1
PROC P1TAB1F
SHOOTP1F:
	CMP TAB1F[SI],'X'
	JE ERRO2F
	CMP TAB1VETF[SI],'1'
	JE P1DESTROIF
	CMP TAB1VETF[SI],'0'
	JBE ERRO1F
P1DESTROIF:
	ADD COUNT1,1
	MOV TAB1F[SI],'X'
	CALL PLINHA
	MOV AH,9
	LEA DX,BARCOATINGIDO
	INT 21H
	JMP P1TAB1FJMP
ERRO1F:
	MOV TAB1F[SI],'*'
	MOV AH,9
	LEA DX,BARCONATINGIDO
	INT 21H
	JMP P1TAB1FJMP
ERRO2F:
	CALL POSATINGIDA
	JMP P1TAB1FJMP
P1TAB1FJMP:
	MOV AH,9
	LEA DX,CONTBATALHA
	INT 21H
	RET
ENDP P1TAB1F

;procedimento que atira na matriz 'a' do jogador 2
PROC P2TAB2A
SHOOTP2A:
	CMP TAB2A[SI],'X'
	JE ERRO4A
	CMP TAB2VETA[SI],'1'
	JE P2DESTROIA
	CMP TAB2VETA[SI],'0'
	JBE ERRO3A
P2DESTROIA:
	ADD COUNT2,1
	MOV TAB2A[SI],'X'
	CALL PLINHA
	MOV AH,9
	LEA DX,BARCOATINGIDO
	INT 21H
	JMP P2TAB2AJMP
ERRO3A:
	MOV TAB2A[SI],'*'
	MOV AH,9
	LEA DX,BARCONATINGIDO
	INT 21H
	JMP P2TAB2AJMP
ERRO4A:
	CALL POSATINGIDA
	JMP P2TAB2AJMP
P2TAB2AJMP:
	MOV AH,9
	LEA DX,CONTBATALHA
	INT 21H
	RET
ENDP P2TAB2A

;procedimento que atira na matriz 'b' do jogador 2
PROC P2TAB2B
SHOOTP2B:
	CMP TAB2B[SI],'X'
	JE ERRO4B
	CMP TAB2VETB[SI],'1'
	JE P2DESTROIB
	CMP TAB2VETB[SI],'0'
	JBE ERRO3B
P2DESTROIB:
	ADD COUNT2,1
	MOV TAB2B[SI],'X'
	CALL PLINHA
	MOV AH,9
	LEA DX,BARCOATINGIDO
	INT 21H
	JMP P2TAB2BJMP
ERRO3B:
	MOV TAB2B[SI],'*'
	MOV AH,9
	LEA DX,BARCONATINGIDO
	INT 21H
	JMP P2TAB2BJMP
ERRO4B:
	CALL POSATINGIDA
	JMP P2TAB2BJMP
P2TAB2BJMP:
	MOV AH,9
	LEA DX,CONTBATALHA
	INT 21H
	RET
ENDP P2TAB2B

;procedimento que atira na matriz 'c' do jogador 2
PROC P2TAB2C
SHOOTP2C:
	CMP TAB2C[SI],'X'
	JE ERRO4C
	CMP TAB2VETC[SI],'1'
	JE P2DESTROIC
	CMP TAB2VETC[SI],'0'
	JBE ERRO3C
P2DESTROIC:
	ADD COUNT2,1
	MOV TAB2C[SI],'X'
	CALL PLINHA
	MOV AH,9
	LEA DX,BARCOATINGIDO
	INT 21H
	JMP P2TAB2CJMP
ERRO3C:
	MOV TAB2C[SI],'*'
	MOV AH,9
	LEA DX,BARCONATINGIDO
	INT 21H
	JMP P2TAB2CJMP
ERRO4C:
	CALL POSATINGIDA
	JMP P2TAB2CJMP
P2TAB2CJMP:
	MOV AH,9
	LEA DX,CONTBATALHA
	INT 21H
	RET
ENDP P2TAB2C

;procedimento que atira na matriz 'd' do jogador 2
PROC P2TAB2D
SHOOTP2D:
	CMP TAB2D[SI],'X'
	JE ERRO4D
	CMP TAB2VETD[SI],'1'
	JE P2DESTROID
	CMP TAB2VETD[SI],'0'
	JBE ERRO3D
P2DESTROID:
	ADD COUNT2,1
	MOV TAB2D[SI],'X'
	CALL PLINHA
	MOV AH,9
	LEA DX,BARCOATINGIDO
	INT 21H
	JMP P2TAB2DJMP
ERRO3D:
	MOV TAB2D[SI],'*'
	MOV AH,9
	LEA DX,BARCONATINGIDO
	INT 21H
	JMP P2TAB2DJMP
ERRO4D:
	CALL POSATINGIDA
	JMP P2TAB2DJMP
P2TAB2DJMP:
	MOV AH,9
	LEA DX,CONTBATALHA
	INT 21H
	RET
ENDP P2TAB2D

;procedimento que atira na matriz 'e' do jogador 2
PROC P2TAB2E
SHOOTP2E:
	CMP TAB2E[SI],'X'
	JE ERRO4E
	CMP TAB2VETE[SI],'1'
	JE P2DESTROIE
	CMP TAB2VETE[SI],'0'
	JBE ERRO3E
P2DESTROIE:
	ADD COUNT2,1
	MOV TAB2E[SI],'X'
	CALL PLINHA
	MOV AH,9
	LEA DX,BARCOATINGIDO
	INT 21H
	JMP P2TAB2EJMP
ERRO3E:
	MOV TAB2E[SI],'*'
	MOV AH,9
	LEA DX,BARCONATINGIDO
	INT 21H
	JMP P2TAB2EJMP
ERRO4E:
	CALL POSATINGIDA
	JMP P2TAB2EJMP
P2TAB2EJMP:
	MOV AH,9
	LEA DX,CONTBATALHA
	INT 21H
	RET
ENDP P2TAB2E

;procedimento que atira na matriz 'f' do jogador 2
PROC P2TAB2F
SHOOTP2F:
	CMP TAB2F[SI],'X'
	JE ERRO4F
	CMP TAB2VETF[SI],'1'
	JE P2DESTROIF
	CMP TAB2VETF[SI],'0'
	JBE ERRO3F
P2DESTROIF:
	ADD COUNT2,1
	MOV TAB2F[SI],'X'
	CALL PLINHA
	MOV AH,9
	LEA DX,BARCOATINGIDO
	INT 21H
	JMP P2TAB2FJMP
ERRO3F:
	MOV TAB2F[SI],'*'
	MOV AH,9
	LEA DX,BARCONATINGIDO
	INT 21H
	JMP P2TAB2FJMP
ERRO4F:
	CALL POSATINGIDA
	JMP P2TAB2FJMP
P2TAB2FJMP:
	MOV AH,9
	LEA DX,CONTBATALHA
	INT 21H
	RET
ENDP P2TAB2F

;procedimento para o jagador 1 atingir os barcos do jogador 2 (chama os procedimentos das matrizes)
PROC ATIRARP1
	CMP AX,5
	JA ERROCARACTERP1
	CMP DH,'a'
	JE SHOOTA1
	CMP DH,'b'
	JE SHOOTB1
	CMP DH,'c'
	JE SHOOTC1
	CMP DH,'d'
	JE SHOOTD1
	CMP DH,'e'
	JE SHOOTE1
	CMP DH,'f'
	JE SHOOTF1
	CMP DH,96
	JBE ERROCARACTERP1
	CMP DH,103
	JAE ERROCARACTERP1
SHOOTA1:
	CALL P1TAB1A
	JMP ATIRARENDP1
SHOOTB1:
	CALL P1TAB1B
	JMP ATIRARENDP1
SHOOTC1:
	CALL P1TAB1C
	JMP ATIRARENDP1
SHOOTD1:
	CALL P1TAB1D
	JMP ATIRARENDP1
SHOOTE1:
	CALL P1TAB1E
	JMP ATIRARENDP1
SHOOTF1:
	CALL P1TAB1F
	JMP ATIRARENDP1
ERROCARACTERP1:
	MOV AH,9
	LEA DX,MSGERRO
	INT 21H
ATIRARENDP1:
	RET
ENDP ATIRARP1

;procedimento para o jagador 2 atingir os barcos do jogador 1 (chama os procedimentos das matrizes)
PROC ATIRARP2
	CMP AX,5
	JA ERROCARACTERP2
	CMP DH,'a'
	JE SHOOTA2
	CMP DH,'b'
	JE SHOOTB2
	CMP DH,'c'
	JE SHOOTC2
	CMP DH,'d'
	JE SHOOTD2
	CMP DH,'e'
	JE SHOOTE2
	CMP DH,'f'
	JE SHOOTF2
	CMP DH,96
	JBE ERROCARACTERP2
	CMP DH,103
	JAE ERROCARACTERP2
SHOOTA2:
	CALL P2TAB2A
	JMP ATIRARENDP2
SHOOTB2:
	CALL P2TAB2B
	JMP ATIRARENDP2
SHOOTC2:
	CALL P2TAB2C
	JMP ATIRARENDP2
SHOOTD2:
	CALL P2TAB2D
	JMP ATIRARENDP2
SHOOTE2:
	CALL P2TAB2E
	JMP ATIRARENDP2
SHOOTF2:
	CALL P2TAB2F
	JMP ATIRARENDP2
ERROCARACTERP2:
	MOV AH,9
	LEA DX,MSGERRO
	INT 21H
ATIRARENDP2:
	RET
ENDP ATIRARP2

;procedimento para colocar os barcos do jogador 1
PROC PUTCOORDP1
POSICMP1:
	CMP AX,5
	JA ERRO1
	CMP BH,96
	JBE ERRO1
	CMP BH,103
	JAE ERRO1
	CMP DH,48
	JBE ERRO1
	CMP DH,55
	JAE ERRO1
	CMP BH,'a'
    JE POSA1
    CMP BH,'b'
    JE POSB1
    CMP BH,'c'
    JE POSC1
    CMP BH,'d'
    JE POSD1
    CMP BH,'e'
    JE POSE1
    CMP BH,'f'
    JE POSF1

ERRO1:
	MOV AH,9
	LEA DX,MSGERRO
	INT 21H
	ADD CX,1
	CALL PLINHA
	JMP ENDPUTP1

POSA1:
	CMP TAB1VETA[SI],'1'
	JE POSIOCUPADA1
	MOV TAB1VETA[SI],'1'
	JMP ENDPUTP1

POSB1:
	CMP TAB1VETB[SI],'1'
	JE POSIOCUPADA1
	MOV TAB1VETB[SI],'1'
	JMP ENDPUTP1

POSC1:
	CMP TAB1VETC[SI],'1'
	JE POSIOCUPADA1
	MOV TAB1VETC[SI],'1'
	JMP ENDPUTP1

POSD1:
	CMP TAB1VETD[SI],'1'
	JE POSIOCUPADA1
	MOV TAB1VETD[SI],'1'
	JMP ENDPUTP1

POSE1:
	CMP TAB1VETE[SI],'1'
	JE POSIOCUPADA1
	MOV TAB1VETE[SI],'1'
	JMP ENDPUTP1

POSF1:
	CMP TAB1VETF[SI],'1'
	JE POSIOCUPADA1
	MOV TAB1VETF[SI],'1'
	JMP ENDPUTP1

POSIOCUPADA1:
	CALL P_OCUPADA
	JMP ENDPUTP1

ENDPUTP1:
	RET
ENDP PUTCOORDP1

;procedimento para colocar os barcos do jogador 2
PROC PUTCOORDP2
POSICMP2:
	CMP AX,5
	JA ERRO2
	CMP BH,96
	JBE ERRO2
	CMP BH,103
	JAE ERRO2
	CMP DH,48
	JBE ERRO2
	CMP DH,55
	JAE ERRO2
	CMP BH,'a'
    JE POSA2
    CMP BH,'b'
    JE POSB2
    CMP BH,'c'
    JE POSC2
    CMP BH,'d'
    JE POSD2
    CMP BH,'e'
    JE POSE2
    CMP BH,'f'
    JE POSF2

ERRO2:
	MOV AH,9
	LEA DX,MSGERRO
	INT 21H
	ADD CX,1
	CALL PLINHA
	JMP ENDPUTP2

POSA2:
	CMP TAB2VETA[SI],'1'
	JE POSIOCUPADA2
	MOV TAB2VETA[SI],'1'
	JMP ENDPUTP2

POSB2:
	CMP TAB2VETB[SI],'1'
	JE POSIOCUPADA2
	MOV TAB2VETB[SI],'1'
	JMP ENDPUTP2

POSC2:
	CMP TAB2VETC[SI],'1'
	JE POSIOCUPADA2
	MOV TAB2VETC[SI],'1'
	JMP ENDPUTP2

POSD2:
	CMP TAB2VETD[SI],'1'
	JE POSIOCUPADA2
	MOV TAB2VETD[SI],'1'
	JMP ENDPUTP2

POSE2:
	CMP TAB2VETE[SI],'1'
	JE POSIOCUPADA2
	MOV TAB2VETE[SI],'1'
	JMP ENDPUTP2

POSF2:
	CMP TAB2VETF[SI],'1'
	JE POSIOCUPADA2
	MOV TAB2VETF[SI],'1'
	JMP ENDPUTP2

POSIOCUPADA2:
	CALL P_OCUPADA
	JMP ENDPUTP2

ENDPUTP2:
	RET
ENDP PUTCOORDP2

;procedimeto main (onde o programa inicia)
PROC MAIN
	MOV AX,@DATA
	MOV DS,AX

	CALL LIMPATELA
	MOV AH,9
	LEA DX,MSG1
	INT 21H
	LEA DX,MSG2
	INT 21H
	LEA DX,MSG3
	INT 21H
	LEA DX,MSG2
	INT 21H
	LEA DX,MSG4
	INT 21H
	LEA DX,MSG5
	INT 21H
	LEA DX,MSG9
	INT 21H

INICIO:
	MOV AH,1
	INT 21H
	MOV BL,AL
	INT 21H
	CMP BL,'s'
	JE JOGO1
	CMP BL,'e'
	JE GO1

GO1:
	JMP FIM

JOGO1:
	CALL LIMPATELA
	MOV AH,9
	LEA DX,MSG8
	INT 21H
	MOV AH,1
	INT 21H
	CALL LIMPATELA
	JMP JOG1

;jogador 1 coloca suas posições
JOG1:
	MOV CX,5
	JMP JOG1PART1

JOG1PART1:
	MOV AH,9
	LEA DX,MSG11
	INT 21H
	LEA DX,MSG9
	INT 21H
	MOV AH,1
	INT 21H
	MOV BH,AL
	MOV AH,1
	INT 21H
	MOV DH,AL
	MOV AH,0
	SUB AX,49
	MOV SI,AX
	CALL PUTCOORDP1
	CALL PLINHA
	LOOP JOG1PART1

;jogador 2 coloca suas posições
JOG2:
	CALL LIMPATELA
	MOV CX,5
	JMP JOG2PART1

JOG2PART1:
	MOV AH,9
	LEA DX,MSG12
	INT 21H
	LEA DX,MSG9
	INT 21H
	MOV AH,1
	INT 21H
	MOV BH,AL
	MOV AH,1
	INT 21H
	MOV DH,AL
	MOV AH,0
	SUB AX,49
	MOV SI,AX
	CALL PUTCOORDP2
	CALL PLINHA
	LOOP JOG2PART1

;início da batalha
JOGO2:
	CALL LIMPATELA
	MOV COUNT1,'0'
	MOV COUNT2,'0'

;ambos os jogadores digitam alternadamente as posições a serem atingidas
PLAY:
	MOV CX,2
	CMP COUNT1,'5'
	JAE J1GANHOU
	CMP COUNT2,'5'
	JAE J2GANHOU
	MOV AH,9
	LEA DX,MSG15
	INT 21H
	MOV AH,9
	LEA DX,MSG9
	INT 21H
	MOV AH,1
	INT 21H
	MOV DH,AL
	MOV AH,1
	INT 21H
	MOV AH,0
	SUB AX,49
	MOV SI,AX
	CALL ATIRARP1
	CALL PLINHA
	CALL PLINHA
	CALL TABULEIRO1
	CALL PLINHA
	MOV AH,1
	INT 21H
	CALL LIMPATELA
	MOV AH,9
	LEA DX,MSG16
	INT 21H
	MOV AH,9
	LEA DX,MSG9
	INT 21H
	MOV AH,1
	INT 21H
	MOV DH,AL
	MOV AH,1
	INT 21H
	MOV AH,0
	SUB AX,49
	MOV SI,AX
	CALL ATIRARP2
	CALL PLINHA
	CALL PLINHA
	CALL TABULEIRO2
	CALL PLINHA
	MOV AH,1
	INT 21H
	CALL LIMPATELA
	LOOP PLAY

;resultado da condição se a vitória for do jogador 1
J1GANHOU:
	MOV AH,9
	LEA DX,P1VENCEU
	INT 21H
	CALL PLINHA
	INT 21H
	MOV AH,1
	INT 21H
	JMP FIM

;resultado da condição se a vitória for do jogador 2
J2GANHOU:
	MOV AH,9
	LEA DX,P2VENCEU
	INT 21H
	CALL PLINHA
	INT 21H
	MOV AH,1
	INT 21H
	JMP FIM

;fim do jogo
FIM:
	CALL LIMPATELA
	MOV AH,9
	LEA DX,MSG6
	INT 21H
	LEA DX,MSG7
	INT 21H
	CALL PLINHA
	MOV AH,4CH
	INT 21H
	RET
ENDP MAIN
END MAIN