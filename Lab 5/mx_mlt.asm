data segment
  ; 3x2 matrix
  matrix1 db 1h, 2h, 3h, 4h, 5h, 6h

  ; 2x3 matrix
  matrix2 db 1h, 1h, 1h, 1h, 1h, 1h

  ; 3x3 product matrix initialize
  matrix3 db 09h dup(?) 

; Max indexes for i, j, k (byte size for counters)
  i_max db 3h
  k_max db 2h
  j_max db 3h

; Const values to revert back (word sized for registers)
  a dw 3h
  b dw 2h
  c dw 3h

data ends

code segment
assume cs:code, ds:data
start:
  mov ax, data
  mov ds, ax

  mov ch, i_max 

; starting offsets
  mov bx, offset matrix3
  mov si, offset matrix1

i_loop:
; starting offset
  mov di, offset matrix2
; cl : j_max -> 0
  mov cl, j_max 

j_loop:
; dl : k_max -> 0
  mov dl, k_max
  mov bp, 0h

k_loop:
; Actual multplication code:
  mov ax, 0h
  mov al, [si]
  mul byte ptr[di]
  add bp, ax

; k value fixed: corresponding i,j change
  inc si 
  add di, c 
  dec dl 
  jnz k_loop

; Store final result, move to next address
  mov [bx], bp
  inc bx
  
; Revert si back from last col
  sub si, b

; Revert di back from last row (and move di to next col)
  mov ax, b
  mul c
  dec ax
  sub di, ax

; j counter decreases
  dec cl 
  cmp cl, 0
  jnz j_loop

; Move si to next row
  add si, b
; i counter decreases
  dec ch
  cmp ch, 0
  jnz i_loop


  int 3 ; breakpoint

code ends
end start