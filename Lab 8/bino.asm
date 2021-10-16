 DATA SEGMENT
          n db 10
         r db 9
         ncr db 0
DATA ENDS
code segment
    assume cs:code,ds:data	
start:	      
     mov ax,data
      mov ds,ax

     ;  Initial values
      mov ncr,0
      mov al,n
      mov bl,r

     ;  Calling procedure
      call encr

     ;  Output
      call display
      mov ah,4ch
      int 21h

; Procedure for Calulating
encr proc
      cmp al,bl
      je ncr1

      cmp bl,0
      je ncr1

      cmp bl,1
      je ncrn

      dec al
      cmp bl,al
      je ncrn1
      
      push ax
      push bx
      call encr
      pop bx
      pop ax
      dec bl
      push ax
      push bx
      call encr
      pop bx
      pop ax
      ret
ncr1: 	      
inc ncr
     ret
ncrn1:	     
inc al
ncrn:	     
add ncr,al
     ret
encr endp


; Procedure for displaying
display proc
     push cx
     mov al,ncr
     mov ch,al
     and al,0f0h
     mov cl,04
     shr al,cl
     cmp al,09h
     jbe next
     add al,07h
next:add al,30h
     mov dl,al
     mov ah,02h
     int 21h
     mov al,ch
     and al,0fh
     cmp al,09h
     jbe next2
     add al,07h
next2:add al,30h
     mov dl,al
     mov ah,02h
     int 21h
     pop cx
ret
display endp
code ends
end start