assume cs:code,ds:data

data segment
n1 dw 0444h
n2 db 45h
n3 dw ?
data ends

code segment

start:
mov ax,data
mov ds,ax

mov ax,n1
mov bl,n2
div bl

mov n3,ax
lea si,n3

int 3

code ends
end start









