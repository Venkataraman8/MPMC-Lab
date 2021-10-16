data segment
    a dw 08h
    arr dw 08h dup(?)
data ends

code segment
    assume cs:code, ds:data
    start:
    mov ax, data
    mov ds, ax
    mov bl, 00
    mov cl, 04

; 2 digit input hexa
    mov ah, 01
    int 21h
    sub al, 30h
    cmp al, 09
    jbe l1
    sub al,07h
    l1:
    rol al,cl
    mov bl,al

    mov ah,01
    int 21h
    sub al, 30h
    cmp al,09
    jbe l2
    sub al,07h
    l2:
    add bl,al
    

; Initial
    mov ax, 0
    mov dl, bl
    mov bx, 1  
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


code ends

end start