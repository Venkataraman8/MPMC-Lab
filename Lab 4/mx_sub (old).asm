data segment
  ; Declare 3x2 size array
  matrix1 dw 1h, 2h, 3h, 4h, 5h, 6h

  ; Declare 3x2 size array
  matrix2 dw 1h, 1h, 1h, 1h, 1h, 1h

  a dw 3h
  b dw 2h

data ends

code segment
assume cs:code, ds:data
start:
    mov ax, data
    mov ds, ax

    mov ax, a
    mul b

    mov cx, ax
    lea si, matrix1
    lea di, matrix2

Loop_i:
    mov ax, [si]
    mov bx, [di]
    sub ax, bx
    
    mov [si], ax
   
    add si, 2h
    add di, 2h
    sub cx, 0001h
    
    cmp cx, 0
    jnz Loop_i

    int 3

code ends
end start 