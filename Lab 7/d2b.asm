data segment
    a dw 08h
    arr dw 08h dup(?)
data ends

code segment
    assume cs:code, ds:data
    start:
    mov ax, data
    mov ds, ax
    mov bx, 0000
    mov ax, 0000
    mov cl, 10
    mov dx, 0004

; 4 digit input deci in char format
    Loop1:
    mul cl
    mov bx, ax
    mov ah, 01
    int 21h
    sub al, 30h
    mov ah, 00
    add bx,ax
    mov ax,bx

    dec dx
    jnz Loop1



    int 3


code ends

end start