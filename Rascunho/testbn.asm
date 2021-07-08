; Batalha naval
; Bruno Emer
; Universidade de Caxias do Sul
; Organizacao e arquitetura de computadores III
; 2012
.model small
.stack 100h
.data
	tableTop1 db 		218, 22 dup(196), 191
	tableTitleTiros db 	179, "   Matriz de tiros    ", 179
	tableTitleNavios db 179, "   Matriz de navios   ", 179
	tableTop2 db 		195, 22 dup(196), 180
	tableNumberLine db 	"  0 1 2 3 4 5 6 7 8 9 "
	tableBottom db 		192, 22 dup(196), 217
	tableTitleRes db 	179, "   Resultado", 10 dup(' '), 179
	resultadoTitle1 db 		"Voce", 17 dup(' ')
	resultadoTiros db 		"  Tiros:       0", 5 dup(' ')
	resultadoAcertos db 	"  Acertos:     0", 5 dup(' ')
	resultadoAfundados db 	"  Afundados:   0", 5 dup(' ')
	resultadoTitle2 db		"Adversario", 11 dup(' ')
	resultadoUltTiro db 	"  Ultimo tiro: 0", 5 dup(' ')
	tableDownTop db		218, 70 dup(196), 191
	tableDownBottom db	192, 70 dup(196), 217
	tableDownMiddle db	195, 70 dup(196), 180
	titleMensagem db 	"Mensagem:"
	titlePortaB db 		"Porta B  "
	titlePortaC db 		"Porta C  "
	titleTiro db 		"Tiro     "
	empty db 21 dup(' ')
	embarcacaoA db "Porta avioes   "
	embarcacaoB db "Navio de guerra"
	embarcacaoS db "Submarino      "
	embarcacaoD db "Destroyer      "
	embarcacaoP db "Barco patrulha "
	mensagemErroLoadNavioPosicao db 	"Digite V para vertical ou H para horizontal", 7 dup(' ')
	mensagemErroLoadNavioLimite db		"Digite uma posicao valida", 25 dup(' ')
	mensagemErroTiroEnvia db			"Coordenada do tiro invalida", 23 dup(' ')
	mensagemTiroEnvia db				"Sua vez de jogar", 34 dup(' ')
	mensagemTiroRecebe db				"Aguarde adversario jogar", 26 dup(' ')
	mensagemEndGameGanhou db 			"Voce ganhou", 39 dup(' ')
	mensagemEndGamePerdeu db 			"Voce perdeu", 39 dup(' ')
	lengthA dw 5
	lengthB dw 4
	lengthS dw 3
	lengthD dw 3
	lengthP dw 2
	resTiros db 0
	resAcertos db 0
	resAfundados db 0
	resAdvTiros db 0
	resAdvAcertos db 0
	resAdvAfundados db 0
.code

EXIT proc ; termina o programa
	mov al, 0
	call MUDA_PAGINA
	mov ah, 4ch	; prepara o fim do programa
	int 21h		; sinaliza o DOS
	ret
endp

QUEBRA_LINHA proc ; quebra linha
	push dx
	mov dx, 13 ; new line
	call ESC_CHAR_21
	mov dx, 10 ; carriage return
	call ESC_CHAR_21
	pop dx
	ret
endp

ESC_CHAR_21 proc ; escreve char ascii de dx
	push ax
	mov ah, 02
	int 21h
	pop ax
	ret
endp

ESC_STRING_21 proc ; escreve string a partir do endereco de dx, ate caracter $
	push ax
	mov ah, 09
	int 21h
	pop ax
	ret
endp

ESC_INT_21 proc ; escreve numero de ax
	push ax
	push bx
	push dx
	push cx
	mov bx, 10
	xor cx, cx
	DIVIDE: xor dx, dx
		div bx
		add dl, '0' ; transforma de numero para caracter ascii
		push dx
		inc cx
		or ax, ax
	jnz DIVIDE
	LACO2: pop dx
		call ESC_CHAR_21
	loop LACO2
	pop cx
	pop dx
	pop bx
	pop ax
	ret
endp

WRITE_HEX PROC ;Este procedimento converte para hexadecimal o byte armazenado no registrador DL e mostra o dígito
	push CX ;coloca na pilha o valor do registrador CX
	push DX ;coloca na pilha o valor do registrador DX
	mov DH, DL ;move o valor de DL para o registrador DH
	mov CX, 4 ;move o valor 4 para o registrador CX
	shr DL, CL
	call WRITE_HEX_DIGIT ;mostra na tela o primeiro número hexadecimal
	mov  DL, DH ;move o valor de DH para o registrador DL
	and  DL, 0Fh
	call WRITE_HEX_DIGIT ;mostra na tela o segundo número hexadecimal
	pop  DX ;retira da pilha o valor do registrador DX
	pop  CX ;retira da pilha o valor do registrador CX
	ret ;retorna o controle ao procedimento que chamou
ENDP

WRITE_HEX_DIGIT PROC ;Este procedimento converte os 4 bits mais baixos do registrador DL para um número hexadecimal e o mostra na tela do computador
	push DX ;coloca na pilha o valor de DX
	cmp DL, 10 ;compara se número de bits é menor que 10
	jae HEX_LETTER ;se não, salta para HEX_LETER
	add DL, "0" ;se sim, converte para número
	jmp Short WRITE_DIGIT ;escreve o caracter
	HEX_LETTER: add DL,"A"-10 ;converte um caracter para hexadecimal
	WRITE_DIGIT: call ESC_CHAR_21 ;imprime o caracter na tela
	pop  DX ;Retorna o valor inicial do registrador DX para o registrador DL
	ret ;Retorna o controle ao procedimento que chamou
ENDP

LE_CHAR_SEM_ECO proc ; le caracter sem escrever na tela, retorna em al
	mov ah, 07
	int 21h
	ret
endp

LE_CHAR proc ; le caracter e escrever na tela, retorna em al
	mov ah, 01
	int 21h
	ret
endp

MUDA_PAGINA proc ; muda a pagina, o numero da pagina definido em al
	push ax
	mov ah, 05h ; numero do servico de BIOS
	int 10h
	pop ax
	ret
endp

DEFINE_MODO proc ; define modo
    push ax
    mov al, 03h ; modo texto 80 x 25
    mov ah, 00h ; modo de video
    int 10h
    pop ax
    ret
endp

LE_CHAR_VIDEO proc ; le caracter do video, retorna em al o caracter ascii e ah os atributos cor
	push bx
	mov bh, 1 ; pagina
	mov ah, 08 ; numero do servico de BIOS
	int 10h ; posiciona cursor
	pop bx
	ret
endp

MOV_CURSOR proc ; move o cursor dh=linha dl=coluna
	push ax
	push bx
	mov bh, 1 ; pagina
	mov ah, 02 ; numero do servico de BIOS
	int 10h ; posiciona cursor
	pop bx
	pop ax
	ret
endp

ESC_CHAR proc ; escreve char com atributo pelo servico de video do bios, escreve caracter de al
	; bl atributo cor - 4 bits: intensidade, red, green, blue
	push ax
	push bx
	push cx
	push dx
	mov bh, 1 ; pagina ou cor do segundo plano
	mov cx, 1 ; numero de repeticoes
	mov ah, 09h ; numero do servico de BIOS
	int 10h
	pop dx
	pop cx
	pop bx
	pop ax
	ret
endp

ESC_STRING proc ; escreve string pelo servico de video do bios, escreve string iniciada em ES:BP, comprimento cx
	; coordenadas da tela em dx, dh = linha, dl = coluna - bl atributo cor - 4 bits: intensidade, red, green, blue
	push ax
	push bx
	push cx
	push dx
	mov bh, 1 ; pagina
	mov ah, 13h ; numero do servico de BIOS
	mov al, 00h ; numero do subservico
	int 10h
	pop dx
	pop cx
	pop bx
	pop ax
	ret
endp

PRINT_TABLE proc ; escreve borda da tabela
	push ax
	push bx
	push cx
	push dx

	mov al, dl ; salva coluna base
	mov dh, 0 ; head
	mov bp, offset tableTop1 ; inicio
	call ESC_STRING
	mov dh, 2
	mov bp, offset tableTop2
	call ESC_STRING
	mov dh, 14
	mov bp, offset tableBottom
	call ESC_STRING
	mov dl, al ; primeira linha
	mov dh, 3
	mov cx, 11
	push ax ; salva a coluna base
	bordav1: mov al, 179
		call MOV_CURSOR
		call ESC_CHAR
		add dl, 23 ; move pra escrever segunda coluna
		call MOV_CURSOR
		call ESC_CHAR
		sub dl, 23 ; volta pra escrever primeira coluna
		mov ax, 10 ; escreve numeros verticais
		sub al, cl
		inc dl
		call MOV_CURSOR
		call ESC_INT_21
		dec dl
		inc dh
	loop bordav1
	pop ax
	mov dl, al
	inc dl
	mov dh, 3 ; escreve numeros horizontais
	mov bp, offset tableNumberLine
	mov cx, 21
	call ESC_STRING

	pop dx
	pop cx
	pop bx
	pop ax
	ret
endp

PRINT_TABLES proc
	push ax
	push bx
	push cx
	push dx

	mov ax, @data ; escreve string
	mov es, ax
	mov bl, 7 ; cor branco nas bordas
	mov cx, 24 ; tamanho
	; tabela 1
	mov dl, 0 ; coluna base
	mov dh, 1
	mov bp, offset tableTitleTiros
	call ESC_STRING
	call PRINT_TABLE
	; tabela 2
	mov dl, 24
	mov bp, offset tableTitleNavios
	call ESC_STRING
	call PRINT_TABLE
	; tabela resultados
	mov dl, 49
	mov bp, offset tableTitleRes
	call ESC_STRING
	call PRINT_TABLE
	mov dh, 8 ; linha divisao do resultado
	mov bp, offset tableTop2
	call ESC_STRING
	mov cx, 21 ; escreve conteudo dos resultados
	inc dl
	mov dh, 3 ; linhas titulos
	mov bp, offset resultadoTitle1
	call ESC_STRING
	mov dh, 9
	mov bp, offset resultadoTitle2
	call ESC_STRING
	inc dh ; linhas tiros
	mov bp, offset resultadoTiros
	call ESC_STRING
	mov dh, 4
	call ESC_STRING
	inc dh ; linhas acertos
	mov bp, offset resultadoAcertos
	call ESC_STRING
	mov dh, 11
	call ESC_STRING
	inc dh ; linhas afundados
	mov bp, offset resultadoAfundados
	call ESC_STRING
	mov dh, 6
	call ESC_STRING
	mov dh, 13 ; linha ultimo tiro
	mov bp, offset resultadoUltTiro
	call ESC_STRING
	mov dh, 7
	mov bp, offset empty
	call ESC_STRING
	; tabela inferior
	mov cx, 72
	mov dl, 0
	mov dh, 23
	mov bp, offset tableDownBottom
	call ESC_STRING
	mov dh, 17
	mov bp, offset tableDownTop
	call ESC_STRING
	mov cx, 5 ; bordar laterais
	inc dh
	bordaiv1: mov al, 179
		call MOV_CURSOR
		call ESC_CHAR
		add dl, 71 ; move pra escrever segunda coluna
		call MOV_CURSOR
		call ESC_CHAR
		sub dl, 71 ; volta pra escrever primeira coluna
		inc dh
	loop bordaiv1
	mov dh, 20 ; borda horrizontal do meio
	mov dl, 0
	mov cx, 72
	mov bp, offset tableDownMiddle
	call ESC_STRING
	mov cx, 9 ; titulos
	mov dh, 18
	mov dl, 1
	mov bp, offset titleMensagem
	call ESC_STRING
	add dh, 3
	mov bp, offset titlePortaB
	call ESC_STRING
	add dl, 24
	mov bp, offset titlePortaC
	call ESC_STRING
	add dl, 25
	mov bp, offset titleTiro
	call ESC_STRING

	; escreve conteudo da tabela 1
	call PRINT_CONTENT_MATRIZ

	pop dx
	pop cx
	pop bx
	pop ax
	ret
endp

PRINT_CONTENT_MATRIZ proc ; escreve conteudo da tabela 1
	push ax
	push bx
	push cx
	push dx

	mov dh, 4 ; bases
	mov bl, 1 ; cor azul
	mov cx, 10
	MATRIZ_LACOI: mov dl, 3
		push cx
		mov cx, 10
		MATRIZ_LACOJ: call MOV_CURSOR
			mov al, 254
			call ESC_CHAR
			add dl, 2
		loop MATRIZ_LACOJ
		pop cx
		inc dh
	loop MATRIZ_LACOI

	pop dx
	pop cx
	pop bx
	pop ax
	ret
endp

ESC_MENSAGEM proc ; escreve no campo mensagem, bp inicio da mensagem
	push bx
	push cx
	push dx
	mov dx, 1301h ; mensagem
	mov cx, 45 ; tamanho maximo
	mov bl, 4 ; cor
	call ESC_STRING
	pop dx
	pop cx
	pop bx
	ret
endp

LOAD_NAVIO_VERIFICA proc ; verifica posicao da embarcacao
	push ax
	push cx
	push dx

	cmp bl, 'H'
	jz NAVIO_HORIZONTAL_VER
	cmp bl, 'V'
	jz NAVIO_VERTICAL_VER
	jmp LOAD_NAVIO_VERIFICA_FIM

	NAVIO_HORIZONTAL_VER: call MOV_CURSOR
		call LE_CHAR_VIDEO
		cmp al, ' '
		jnz LOAD_NAVIO_VERIFICA_ERRO
		add dl, 2
	loop NAVIO_HORIZONTAL_VER
	jmp LOAD_NAVIO_VERIFICA_FIM

	NAVIO_VERTICAL_VER: call MOV_CURSOR
		call LE_CHAR_VIDEO
		cmp al, ' '
		jnz LOAD_NAVIO_VERIFICA_ERRO
		inc dh
	loop NAVIO_VERTICAL_VER
	jmp LOAD_NAVIO_VERIFICA_FIM

	LOAD_NAVIO_VERIFICA_ERRO: stc

	LOAD_NAVIO_VERIFICA_FIM:
	pop dx
	pop cx
	pop ax
	ret
endp

LOAD_NAVIO proc ; carrega navio pega o caracter do ax e tamanho do cx
	push ax
	push bx
	push cx
	push dx

	LOAD_NAVIO_ERRO: mov dx, 1332h ; posicao 19 x 50
	call MOV_CURSOR
	push ax
	xor ax, ax
	call LE_CHAR
	sub al, '0' ; transforma em numero
	push ax
	inc dl
	call LE_CHAR
	sub al, '0' ; transforma em numero
	push ax
	inc dl
	call LE_CHAR
	inc dl

	mov bx, ax ; v ou h
	pop ax ; x
	mov ah, 2
	mul ah ; deslocamento x2
	add al, 27 ; base
	mov dl, al
	pop ax ; y
	mov dh, al
	add dh, 4 ; base

	pop ax ; caracter

	call LOAD_NAVIO_VERIFICA ; verificar posicao valida, retorna carry flag = 1 se tiver erro
	jnc LOAD_NAVIO_CONTINUA
	mov bp, offset mensagemErroLoadNavioLimite
	call ESC_MENSAGEM
	jmp LOAD_NAVIO_ERRO

	LOAD_NAVIO_CONTINUA: cmp bl, 'H'
	jz NAVIO_HORIZONTAL
	cmp bl, 'V'
	jz NAVIO_VERTICAL
	mov bp, offset mensagemErroLoadNavioPosicao
	call ESC_MENSAGEM
	jmp LOAD_NAVIO_ERRO

	NAVIO_HORIZONTAL: call MOV_CURSOR
		mov bl, 7
		call ESC_CHAR
		add dl, 2
	loop NAVIO_HORIZONTAL
	jmp NAVIO_FIM

	NAVIO_VERTICAL: call MOV_CURSOR
		mov bl, 7
		call ESC_CHAR
		inc dh
	loop NAVIO_VERTICAL

	NAVIO_FIM:
	pop dx
	pop cx
	pop bx
	pop ax
	ret
endp

NAVIO_TITLE proc ; escreve titulo com posicao inicial em bp
	push bx
	push cx
	push dx

	mov cx, 15
	mov bl, 7
	mov dx, 1232h ; posicao 18 x 50
	call ESC_STRING

	pop dx
	pop cx
	pop bx
	ret
endp

INIT_NAVIOS proc ; inicializa pedindo a posicao das navios
	push ax
	push bx
	push cx
	push dx

	mov bp, offset embarcacaoA
	call NAVIO_TITLE
	mov ax, 'A'
	mov bx, offset lengthA
	mov cx, [bx]
	call LOAD_NAVIO
	mov bp, offset embarcacaoB
	call NAVIO_TITLE
	mov ax, 'B'
	mov cx, [bx+2]
	call LOAD_NAVIO
	mov bp, offset embarcacaoS
	call NAVIO_TITLE
	mov ax, 'S'
	mov cx, [bx+4]
	call LOAD_NAVIO
	mov bp, offset embarcacaoD
	call NAVIO_TITLE
	mov ax, 'D'
	mov cx, [bx+6]
	call LOAD_NAVIO
	mov bp, offset embarcacaoP
	call NAVIO_TITLE
	mov ax, 'P'
	mov cx, [bx+8]
	call LOAD_NAVIO

	pop dx
	pop cx
	pop bx
	pop ax
	ret
endp

REG_INT proc ; registra interrupcao
	push ds
	mov ax, cs
	mov ds, ax
	mov dx, offset I6FH ; ds:dx rotina do processamento(proc)
	mov al, 6fh ; numero da interrupcao
	mov ah, 25h ; servico define vetor da interrupcao
	int 21h
	pop ds

	; configura ppa
	mov al, 8ah ; configuracao 10001010b - modo 0, porta A = output, porta B = input, porta C- = output, porta C+ = input
	mov dx, 0303h ; endereco da porta de controle
	out dx, al ; envia configuracao para porta de controle

	ret
endp

; Comunicacao paralela PPA i8255A
; PA=300H PB=301H PC=302H PortControle=303H
I6FH proc ; int 6fh
	sti
	push dx
	; 1)jogador atual: envia PC0 = 1, envia PC0 = 0 e envia coordenada na porta A, espera retorno em PC5-PC7
	; 2)adversario: espera ate PC4 = 0, le coordenada do adversario na porta B, envia retorno para PC1-PC3

	; envia PC0 = 1
	cmp ax, 0 ; opcao 0
	jnz I6FH_CONT_1
	mov dx, 302h
	in al, dx ; le porta C para manter led do resultado anterior
	or al, 0001b
	out dx, al ; envia para porta C
	jmp I6FH_FIM
	; envia PC0 = 0 e envia coordenada na porta A, le retorno em PC5-PC7
	I6FH_CONT_1: cmp ax, 1 ; opcao 1
	jnz I6FH_CONT_2
	mov al, bl ; bl tem coordenada do tiro
	mov dx, 300h
	out dx, al ; envia para porta A
	mov al, 0000b
	mov dx, 302h
	out dx, al ; envia para porta C-
	call DELAY ; aguardar
	call DELAY ; aguardar 2 segundos
	in al, dx ; le porta C+
	jmp I6FH_FIM
	; le PC4
	I6FH_CONT_2: cmp ax, 2 ; opcao 2
	jnz I6FH_CONT_3
	mov dx, 302h
	in al, dx ; le porta C
	jmp I6FH_FIM
	; le porta B
	I6FH_CONT_3: cmp ax, 3 ; opcao 3
	jnz I6FH_CONT_4
	mov dx, 301h
	in al, dx ; le porta B
	jmp I6FH_FIM
	; envia retorno para PC1-PC3
	I6FH_CONT_4: cmp ax, 4 ; opcao 4
	jnz I6FH_FIM
	mov al, bl ; bl tem resposta do tiro adversario
	mov dx, 302h
	out dx, al ; envia para porta C

	I6FH_FIM:
	pop dx
	iret
endp

RESULT_CONT proc ; atualiza display do resultado, posicao na tela em dx, endereco offset do contador em bx
	push ax
	push bx
	push dx
	call MOV_CURSOR
	mov al, [bx]
	xor ah, ah
	mov bl, 7
	call ESC_INT_21
	pop dx
	pop bx
	pop ax
	ret
endp

ESC_PORTA_C proc ; escreve no campo Porta C, recebe de al
	push dx

	mov dx, 1619h ; coordenada campo Porta C
	call MOV_CURSOR
	mov dl, al
	call WRITE_HEX

	pop dx
	ret
endp

TIRO_ENVIA proc
	push ax
	push bx
	push cx
	push dx

	mov bp, offset mensagemTiroEnvia ; escreve mensagem
	call ESC_MENSAGEM

	mov ax, 0 ; envia 1 para PC0
	int 6fh
	TIRO_ENVIA_INICIO: mov dx, 1632h ; posicao 22 x 50
		call MOV_CURSOR
		call LE_CHAR
		cmp al, '0' ; verifica se o numero eh menor que 0
		jl TIRO_ENVIA_ERRO
		cmp al, '9' ; verifica se o numero eh maior que 9
		jg TIRO_ENVIA_ERRO
		sub al, '0' ; transforma em numero
		mov bl, al ; salva linha
		inc dl
		call LE_CHAR
		cmp al, '0'
		jl TIRO_ENVIA_ERRO
		cmp al, '9'
		jg TIRO_ENVIA_ERRO
		jmp TIRO_VERIFICA_CONTINUA
		TIRO_ENVIA_ERRO: mov bp, offset mensagemErroTiroEnvia
		call ESC_MENSAGEM
	jmp TIRO_ENVIA_INICIO
	TIRO_VERIFICA_CONTINUA:
	sub al, '0' ; transforma em numero
	mov ah, bl
	push ax ; salva coordenadas reais
	add bl, 4 ; base
	mov ah, 2
	mul ah ; deslocamento x2
	add al, 3 ; base

	mov dl, al ; salva coordenada
	mov dh, bl

	pop ax
	mov bl, ah ; coordenada x
	shl bl, 4
	add bl, al ; coordenada y
	;mov bl, 00100011b ; TESTE
	mov ax, 1 ; envia coordenada para PA e retorna o resultado
	int 6fh
	;mov al, 01100000b ; TESTE
	call ESC_PORTA_C ; escreve no campo Porta C o valor de al
	push dx ; salva posicao do tiro para escrever depois
	mov dl, al ; pc, pc5 = 1: acertou navio; pc6 = 1: afundou navio; pc7 = 1: terminou jogo(voce ganhou)

	ror dl, 6 ; pega bit 5 da direita e joga em cf
	jc TIRO_ACERTOU
	mov al, 'x' ; caracter tiro erro
	mov bl, 4 ; cor vermelha
	jmp TIRO_ERROU

	TIRO_ACERTOU: mov al, 'o'
	mov bl, 2 ; cor verde
	inc resAcertos ; incrementa os acertos

	ror dl, 1; verifica pc6: afundou navio
	jnc NAVIO_NAO_AFUNDOU
	inc resAfundados ; incrementa os afundados

	NAVIO_NAO_AFUNDOU:
	ror dl, 1; verifica pc7: termina jogo
	jnc TIRO_ERROU ; continua jogo
	call END_GAME_WIN

	TIRO_ERROU: pop dx ; recupera posicao do tiro

	call MOV_CURSOR
	call ESC_CHAR ; escreve o caracter se errou ou acertou

	inc resTiros ; incrementa contador de tiro
	mov bx, offset resTiros ; contador de tiros
	mov dx, 0441h
	call RESULT_CONT
	mov bx, offset resAcertos ; contador de acertos
	inc dh
	call RESULT_CONT
	mov bx, offset resAfundados ; contador de afundados
	inc dh
	call RESULT_CONT

	pop dx
	pop cx
	pop bx
	pop ax
	ret
endp

DELAY proc ; delay de 1 segundo
	push ax
	push bx
	push cx
	push dx
	mov ah, 0 ; funcao 0 retorna em cx:dx contagem de tiques. Frequencia de 18,2 clock/segundo
	int 1ah ; pega o tempo de contagem de dias
	add dx, 18 ; adicionar um atraso de 1 segundo(18 clocks/seg) a palavra baixa
	mov bx, dx
	DELAY_LACO: int 1ah
		cmp dx, bx
	jne DELAY_LACO
	pop dx
	pop cx
	pop bx
	pop ax
	ret
endp

TIRO_RECEBE proc
	push ax
	push bx
	push cx
	push dx

	mov bp, offset mensagemTiroRecebe ; escreve mensagem
	call ESC_MENSAGEM

	TIROR_CHECK: mov dx, 7h ; beep 7h ascii
		call ESC_CHAR_21
		call DELAY
		mov ax, 2 ; retorna PC, para verificar PC4 = 0
		int 6fh
		;mov al, 00000000b ; TESTE ; 00010000b = aguarda
		call ESC_PORTA_C ; escreve no campo Porta C o valor de al
		shr al, 5 ; joga bit 4 no carry flag
	jc TIROR_CHECK ; PC4 = 1, adversario pensando

	mov ax, 3 ; retorna PB em al, com as coordenadas do tiro do adversario, 4 bits para x e 4 para y
	int 6fh
	;mov al, 56h ; TESTE

	mov dx, 1601h ; coordenada campo Porta B
	call MOV_CURSOR ; move cursor para campo porta b
	mov dl, al
	call WRITE_HEX ; escreve valor de al que vem da PB
	mov dx, 0d41h ; coordenada resultado ultimo tiro
	call MOV_CURSOR ; move cursor para campo ultimo tiro
	mov dl, al
	call WRITE_HEX ; escreve valor de al que vem da PB

	ror ax, 4 ; al = linha
	shr ah, 4 ; ah = coluna
	add al, 4 ; base
	mov dh, al
	mov al, ah
	mov ah, 2
	mul ah ; deslocamento x2
	add al, 27 ; base
	mov dl, al

	call MOV_CURSOR ; vai para posicao do tiro
	call LE_CHAR_VIDEO
	cmp al, ' ' ; se nao tiver caracter adversario errou o tiro
	jnz TIROR_ACERTOU
	mov al, 254 ; se errou escreve quadrado vermelho
	jmp TIROR_CONTINUA
	TIROR_ACERTOU: cmp ah, 4 ; verificar se ja atirou nessa posicao
	jz TIROR_CONTINUA ; se for caracter for vermelho adversario ja atirou na posicao
	cmp al, 'A'
	jz ACERTOU_A
	cmp al, 'B'
	jz ACERTOU_B
	cmp al, 'S'
	jz ACERTOU_S
	cmp al, 'D'
	jz ACERTOU_D
	cmp al, 'P'
	jz ACERTOU_P
	ACERTOU_A: dec lengthA
	mov bx, offset lengthA
	jmp ACERTOU_CONTINUA
	ACERTOU_B: dec lengthB
	mov bx, offset lengthB
	jmp ACERTOU_CONTINUA
	ACERTOU_S: dec lengthS
	mov bx, offset lengthS
	jmp ACERTOU_CONTINUA
	ACERTOU_D: dec lengthD
	mov bx, offset lengthD
	jmp ACERTOU_CONTINUA
	ACERTOU_P: dec lengthP
	mov bx, offset lengthP

	ACERTOU_CONTINUA: mov dx, [bx]
	xor ah, ah ; limpa ah e armazena resultado para enviar para pc3 da ppa
	cmp dx, 0
	jnz AFUNDOU_CONTINUA ; se nao afundou o navio
	inc resAdvAfundados
	or ah, 0100b ; bit 2 afundou navio
	AFUNDOU_CONTINUA: inc resAdvAcertos ; incrementa contador de acertos do adversario
	or ah, 0010b ; bit 1 acertou navio
	TIROR_CONTINUA: mov bl, 4 ; cor vermelha

	call ESC_CHAR

	inc resAdvTiros ; incrementa contador de tiro
	mov bx, offset resAdvTiros ; contador de tiros
	mov dx, 0a41h
	call RESULT_CONT
	mov bx, offset resAdvAcertos ; contador de acertos
	inc dh
	call RESULT_CONT
	mov bx, offset resAdvAfundados ; contador de afundados
	inc dh
	call RESULT_CONT

	mov al, [bx] ; pega o contador de navios afundados
	cmp al, 5 ; compara se ja afundou todas navios
	jl NAO_TERMINOU_JOGO ; se for menor q 5 continua jogo
	or ah, 1000b ; bit 3 terminou jogo(voce ganhou)
	NAO_TERMINOU_JOGO: mov bl, ah ; pc, pc1 = 1: acertou navio; pc2 = 1: afundou navio; pc3 = 1: terminou jogo(voce ganhou)
	;mov bl, 00001110b ; TESTE
	mov ax, 4 ; envia retorno de bl para PC1-PC3
	int 6fh

	shr bl, 4 ; verifica se terminou jogo
	jnc TIROR_FIM
	call END_GAME_DEFEAT ; termina o jogo e voce perdeu

	TIROR_FIM:
	pop dx
	pop cx
	pop bx
	pop ax
	ret
endp

INIT_GAME proc ; inicia o jogo, solicitando quem comeca
	RODADAS: call TIRO_ENVIA
		call TIRO_RECEBE
	jmp RODADAS
	ret
endp

END_GAME_WIN proc
	mov bp, offset mensagemEndGameGanhou
	call ESC_MENSAGEM
	call END_GAME
	ret
endp

END_GAME_DEFEAT proc
	mov bp, offset mensagemEndGamePerdeu
	call ESC_MENSAGEM
	call END_GAME
	ret
endp

END_GAME proc
	mov cx, 3 ; contagem de 3 segundos e sair
	END_GAME_CONT: call DELAY
	loop END_GAME_CONT
	call EXIT
endp

INICIO:	mov ax, @data ; carrega valor inicial da stack
	mov ds, ax
	call DEFINE_MODO
	mov al, 1
	call MUDA_PAGINA ; usa pagina 1
	call REG_INT
	call PRINT_TABLES
	call INIT_NAVIOS
	call INIT_GAME
	call EXIT
end INICIO