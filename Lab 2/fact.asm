data segment
  x dw 0007h
  y dw ?
data ends

code segment
assume cs:code, ds:data

start:
  mov ax, data
  mov ds, ax

  
  mov ax, x 
  mov bx, x 

  cmp bx, 01
  jnz factorial
factorial:
  dec bx
  mul bx
  cmp bx, 01
  jnz factorial

  mov y, ax
  int 3

code ends
end start
