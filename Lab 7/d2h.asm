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


    mov cx, 0004
    Loop2:
    mov ax,bx
    and ax, 000Fh
    push ax
    shr bx,4
    dec cx
    jnz Loop2


    mov dl, 10
    mov ah, 02h
    int 21h

    mov cx, 0004
    Loop3:
    pop ax
    cmp al, 09h
    jbe l3
    add al,07h
    l3:
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h
    dec cx
    jnz Loop3

int 3
code ends

end start