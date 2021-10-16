data segment
    a dw 08h
    arr dw 08h dup(?)
data ends

code segment
assume cs:code, ds:data
start:
 mov ax, data
 mov ds, ax
 
 mov ax, 0
 mov bx, 1 
 mov dx, a
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