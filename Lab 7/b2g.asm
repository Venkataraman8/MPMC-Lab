data segment
  x dw 0004h
  y dw ?
data ends

code segment
assume cs:code, ds:data

start:
  mov ax, data
  mov ds, ax

  mov ax, x
  mov bx, ax
  shr ax, 01
  xor bx, ax
  

  int 3

code ends
end start
