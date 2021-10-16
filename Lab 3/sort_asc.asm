; Program for Bubble Sort

data segment
  arr dw 0555h, 0222h, 0333h, 0444h, 0111h
  sz db 05h
data ends

code segment
assume cs:code, ds:data
start:
  mov ax, data
  mov ds, ax
  
  mov ch, sz
  dec ch
  ; This loop runs from i = 0 to size - 1
InitInnerLoop:

  mov cl, sz
  dec cl
  lea si, arr

InnerLoop:

  mov ax, [si]
  mov bx, [si + 2]
  cmp ax, bx
  jc Continue ; Ascending
  
  ; jnc Continue ; Descending
  mov dx, [si + 2] 
  xchg [si], dx
  mov [si + 2], dx

Continue:
  add si, 2
  dec cl
  jnz InnerLoop
  dec ch
  jnz InitInnerLoop
  mov ch, sz
  lea si, arr
  
showop:
  mov ax, [si]
  add si, 2
  dec ch
  jnz showop

  int 3

code ends
end start