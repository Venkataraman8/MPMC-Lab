data segment
  x dw 0008h
  y dw ?
data ends

code segment
assume cs:code, ds:data

start:
  mov ax, data
  mov ds, ax

  
  mov ax, 01
  mov bx, 01 



fact:
  inc bx
  mul bx
  cmp bx, x
  jnz fact

  mov y, ax
  int 3

code ends
end start
