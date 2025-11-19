.model small
.stack 100h
.data
msg1 db 'Enter first number: $'
msg2 db 'Enter second number: $'
addMsg db 0Dh,0Ah,'Addition = $'
subMsg db 0Dh,0Ah,'Subtraction = $'
mulMsg db 0Dh,0Ah,'Multiplication = $'
divMsg db 0Dh,0Ah,'Division = $'

.code
main proc
    mov ax,@data
    mov ds,ax

  
    mov dx, offset msg1
    mov ah,9
    int 21h

    mov ah,1
    int 21h
    sub al,30h      ; convert ASCII to number
    mov bl,al      

 
    mov dx, offset msg2
    mov ah,9
    int 21h

    mov ah,1
    int 21h
    sub al,30h
    mov bh,al       



    call addition
    call subtraction
    call multiply
    call division

    mov ah,4ch
    int 21h
main endp

addition proc
    mov dx, offset addMsg
    mov ah,9
    int 21h

    mov al, bl
    add al, bh
    add al,30h
    mov dl, al
    mov ah,2
    int 21h
    ret
addition endp

subtraction proc
    mov dx, offset subMsg
    mov ah,9
    int 21h

    mov al, bl
    sub al, bh
    add al,30h
    mov dl, al
    mov ah,2
    int 21h
    ret
subtraction endp

multiply proc
    mov dx, offset mulMsg
    mov ah,9
    int 21h

    mov al, bl
    mul bh
    add al,30h
    mov dl, al
    mov ah,2
    int 21h
    ret
multiply endp

division proc
    mov dx, offset divMsg
    mov ah,9
    int 21h

    mov al, bl
    mov ah,0
    div bh
    add al,30h
    mov dl, al
    mov ah,2
    int 21h
    ret
division endp

end main




