.386
assume cs:code, ds:data
data segment
  x dd 000Ah
  y dd ?
data ends


code segment

start:
  mov eax, data
  mov ds, eax

  
  mov eax, 01
  mov ebx, 01 



fact:
  inc ebx
  mul ebx
  cmp ebx, x
  jnz fact

  mov y, eax
  int 3

code ends
end start
