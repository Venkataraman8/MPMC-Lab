data segment
    a dw 08h
    arr dw 08h dup(?)
data ends

code segment
    assume cs:code, ds:data
    start:
    mov ax, data
    mov ds, ax
    mov bx, 0000h
    mov cl, 04

; 4 digit input hexa in char format
    mov ah, 01
    int 21h
    sub al, 30h
    cmp al, 09
    jbe l1
    sub al,07h
    l1:
    mov ah, 00
    add bx,ax
    shl bx,cl

    mov ah,01
    int 21h
    sub al, 30h
    cmp al,09
    jbe l2
    sub al,07h
    l2:
    mov ah, 00
    add bx,ax
    shl bx,cl

    mov ah,01
    int 21h
    sub al, 30h
    cmp al,09
    jbe l3
    sub al,07h
    l3:
    mov ah, 00
    add bx,ax
    shl bx,cl

    mov ah,01
    int 21h
    sub al, 30h
    cmp al,09
    jbe l4
    sub al,07h
    l4:
    mov ah, 00
    add bx,ax



    int 3


code ends

end start