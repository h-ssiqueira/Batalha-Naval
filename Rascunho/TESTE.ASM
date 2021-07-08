TITLE RANDOM
.model small

.stack 100h

.data

message1 db "   $"

.code



main proc



mov ax, @data

mov ds,ax


MOV AL,32
 mov ah,09h

    mov bl,54

    mov cx, 11

    int 10h


mov ah,09
lea dx,message1

int 21h

mov ax,4c00h

int 21h





main endp

end main
