assume cs:code,ds:data

data segment
n1 dw 4444h
n2 dw 4567h
n3 dd ?
data ends

code segment

start:
mov ax,data
mov ds,ax

mov ax,n1
mov bx,n2
mul bx
lea si,n3
mov [si],ax
mov [si+2],dx

int 3

code ends
end start

