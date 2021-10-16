data segment
    msg_inp db 'Please enter string: $'
    msg_success db 'OK - Input is palindrome$'
    msg_fail db 'FAIL - Input is not palindrome$'
    new db '$'
    s db 20 dup(0)
data ends
code segment              
assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax

    lea dx, msg_inp
    mov ah, 09h
    int 21h

    call StringInput
    call IsPalindrome

    mov ah, 4ch     
    int 21h


; Procedure to take input 
StringInput proc
    push ax
    mov bx, 00
StringInputTakeMore:
    mov ah, 01h
    int 21h
    cmp al, 0dh
    je StringInputDone
    mov [s+bx], al
    inc bx
    loop StringInputTakeMore
StringInputDone:
    pop ax
    ret
StringInput endp

; Procedure to check if string is palidrome
IsPalindrome proc
    push di
    
    mov di, 0
    dec bx
; compare [s+bx] and [s+di]
IsPalindromeChar:
    mov al, [s+bx]
    cmp al, [s+di]
    jne IsPalindromeFail
    inc di ; ++i
    dec bx ; --j
    jnz IsPalindromeChar
    

    lea dx, msg_success
    mov ah, 09h
    int 21h
    jmp IsPalindromeEnd
IsPalindromeFail:
    lea dx, msg_fail
    mov ah,09h
    int 21h
IsPalindromeEnd:
    pop di
    ret
IsPalindrome endp

code ends
end start