
.model small
.stack 100h
.data
msg1 db 'Enter a string: $'
msg2 db 13,10,'Reversed string: $'

.code
main proc
    mov ax,@data
    mov ds,ax

    mov ah,09h
    lea dx,msg1
    int 21h

    
    xor cx, cx            ; counter for number of characters

read_loop:
    mov ah,1              ; read character (INT 21h)
    int 21h
    cmp al,13             ; Enter key pressed? (ASCII 13)
    je done_input
    push ax               ; push character on stack
    inc cx                ; count characters
    jmp read_loop

done_input:
    ;--- Print new line and message ---
    mov dl,13
    mov ah,2
    int 21h
    mov dl,10
    int 21h

    mov ah,09h
    lea dx,msg2
    int 21h

    ;--- Pop and print in reverse ---
print_loop:
    cmp cx,0
    je end_prog
    pop ax
    mov dl,al
    mov ah,2
    int 21h
    dec cx
    jmp print_loop

end_prog:
    mov ah,4Ch
    int 21h
main endp
end main


