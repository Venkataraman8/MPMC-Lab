data segment
    a dw 08h
    char db ?
    arr dw 08h dup(?)
data ends

code segment
MAIN PROC
    assume cs:code, ds:data
    start:
    mov ax, data
    mov ds, ax
    
    mov ah,01h
    int 21h
    mov char,al 
    sub char, '0'

    mov ax, 0
    mov bx, 1  
    mov dl, char
    mov si, offset arr

    Loop1:
    mov cx, bx
    add bx, ax
    mov ax, cx

    mov [si], ax 
    add si, 2 

    dec dl
    cmp dl, 0
    jg Loop1

    int 3

MAIN ENDP

code ends

end start