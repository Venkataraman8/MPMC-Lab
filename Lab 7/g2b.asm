data segment
  x dw 0006h
  y dw ?
data ends

code segment
assume cs:code, ds:data

start:
  mov ax, data
  mov ds, ax

  mov ax, x
  mov bx, ax
  mov cx, 10h

Loop1:
  shr ax, 01
  xor bx, ax

  dec cx
  cmp cx, 0h
  jnz Loop1
  

  int 3

code ends
end start
