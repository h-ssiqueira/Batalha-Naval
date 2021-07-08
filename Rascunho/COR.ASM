TITLE COR
.MODEL SMALL
.STACK 100h
.DATA
M DB "PUC$"
.CODE
MOV AX,@DATA
MOV DS,AX
MOV ES,AX

MOV AH,0
MOV AL,3
INT 10h

;################SELECT ATIVE PAGE###########

MOV AH,5
MOV AL,1;Nº PAG 0-7 PARA O MODO 3 DE VIDEO
INT 10h

;################################################

;mov ah,13h          ; function 13 - write string
;MOV BP, M
;mov al,01h          ; attrib in bl, move cursor
;mov bl,0bh          ; attribute - magenta
;mov cx,4           ; length of string
;mov dh,5            ; row to put string
;mov dl,7            ; column to put string
;int 10h             ; call BIOS service

mov al, 1
mov bh, 0
mov bl, 00111011b
mov cx, M - offset M ; calculate message size.
mov dl, 10
mov dh, 7
push cs
pop es
mov bp, offset M
mov ah, 13h
int 10h

MOV AH,4Ch
INT 21h
END