;an assembly program in which a procedure converts hexadecimal value to print its decimal form ;on screen
data segment
     num dw 1234h
     res  db 10 dup ('$')
data ends
code segment
        assume ds:data,cs:code
start:       
    mov ax,data
    mov ds,ax
   
    mov ax,num
      
    lea si,res
    call hex2dec
   
    lea dx,res
    mov ah,9
    int 21h 
            
    mov ah,4ch
    int 21h        
code ends
hex2dec proc near
    mov cx,0
    mov bx,10
   
loop1: mov dx,0
       div bx
       add dl,30h
       push dx
       inc cx
       cmp ax,9
       jg loop1
     
       add al,30h
       mov [si],al


loop2: pop ax
       inc si
       mov [si],al
       loop loop2 ;loop using counter in ecx
       ret
hex2dec endp           
   
end start