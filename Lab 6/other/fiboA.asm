data segment
    a dw 08h
    arr dw 08h dup(?)
data ends

code segment
    assume cs:code, ds:data
    start:
    mov ax, data
    mov ds, ax

   ; we will be using ax,bx,cx so store them in stack
   push ax
   push bx
   push dx

   ; reading number in bx register
   xor bx,bx

; as int 21 h gets only character by character we have to loop until we hit a non digit
 mov ah,1h
ReadNumberLoop:
   xor ax,ax    ; 1h is for input and 2h is for output both are related to al
   int 21h

   ; val now stored in al 
   ; Note : its stored in ascii so compare it with characters and later convert it into decimal by subtracting ascii value of '0' == 30h
   ; check if its in [0..9]

   
   cmp al,0DH
   jz ExitRead   
   cmp al,'9'
   ja ExitRead  ; above 9
   cmp al,'0'
   jb ExitRead  ; below 0


   

   
    
   ;convert ascii to hexa
   sub al,30h
   ; now we have al, but ax might be 1h or 2h so extend its sign 
   ; use cbw --> convert byte to word ,extends sign of al to ax
   cbw
   ; use cwd --> convert word to double , extends sign of ax to dx so now its 32 bit number
   cwd



   ; main op
   ; initially bx is 0 but later we need to add bx = (bx*10)+ax
   ; first push ax to stack as mult is done by ax
   push ax
   mov ax,bx
   ; mul 10 gives illegal immediate error
   ; so use cx for that
   mov cx,10
   mul cx

   mov bx,ax ; moving bx*10 to bx
   pop ax  ; pop old ax value and add it to bx
   add bx,ax
   
   jmp ReadNumberLoop ; run until we hit non digit character


ExitRead:
  ; pop in reverse order
  pop dx
  pop cx
  pop ax
;   MOV AH,4CH         ;DOS EXIT FUNCTION
;  INT 21H            ;EXECUTE
    

; Initial
    mov ax, 0
    mov dx, bx
    mov bx, 1  
    mov si, offset arr

    Loop1:
    mov cx, bx
    add bx, ax
    mov ax, cx

    mov [si], ax 
    add si, 2 

    dec dx
    cmp dx, 0
    jg Loop1

    int 3


code ends

end start