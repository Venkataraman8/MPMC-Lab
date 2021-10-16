data segment
    n db 10
    r db 9
data ends

code segment
assume cs:code, ds:data
start:
  mov ax, data
  mov ds, ax

 mov al, n
 sub al, r
 inc al

  mov bl, al
  mov cl, 1
  mov dl, r

    mov ax, 0001h
  Loop1:
    mul bl
    div cl
    mov ah, 00h 

    inc cl
    inc bl 

    dec dl
    cmp dl, 0
    jnz Loop1
    


  int 3

code ends
end start