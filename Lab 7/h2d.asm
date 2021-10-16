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
    mov cl, 04
    mov dx, 0004

; 4 digit input hexa in char format
    Loop1:
    shl bx,cl
    mov ah, 01
    int 21h
    sub al, 30h
    cmp al, 09
    jbe l1
    sub al,07h
    l1:
    mov ah, 00
    add bx,ax

    dec dx
    jnz Loop1

    mov dl, 10
    mov ah, 02h
    int 21h
    
    mov ax,bx

    mov cl, 100d
    div cl
    mov dl, al
    mov bh, ah
    add dl, 30h
    mov ah, 02h
    int 21h
    mov al, bh
    mov ah, 0

    mov cl, 10d
    div cl
    mov dl, al
    mov bh, ah
    add dl, 30h
    mov ah, 02h
    int 21h
    mov al, bh
    mov ah, 0

    mov cl, 1d
    div cl
    mov dl, al
    mov bh, ah
    add dl, 30h
    mov ah, 02h
    int 21h
    mov al, bh
    mov ah, 0
    


int 3
code ends

end start