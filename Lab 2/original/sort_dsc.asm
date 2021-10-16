; Program for Bubble Sort

data segment
  arr db 5h, 4h, 3h, 2h, 1h
  sz db 05h
data ends

code segment
assume cs:code, ds:data
start:
  mov ax, data
  mov ds, ax
  
  ; 16-bit CX register is divied into two 8 bits regiters: CH & CL
  ; Store size of array in CH & CL
  mov ch, sz
  dec ch
  ; This loop runs from i = 0 to size - 1
InitInnerLoop:
  ; Initalize the inner loop again
  mov cl, sz
  dec cl
  lea si, arr

InnerLoop:
  ; This loop runs from j = 0 to size - 1
  ; Swaps if arr[j] > arr[j + 1]
  mov al, [si]
  mov bl, [si + 1]
  cmp al, bl
  jnc Continue ; Ascending
  
  ; jnc Continue ; Descending
  ; For 16 bit change: [si + 1] => [si + 2]
  mov dl, [si + 1] 
  xchg [si], dl
  mov [si + 1], dl

Continue:
  inc si
  dec cl
  jnz InnerLoop
  dec ch
  jnz InitInnerLoop

  ; Interrupt for breakpoint
  int 3

code ends
end start