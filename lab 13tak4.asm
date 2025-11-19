.model small
.stack 100h
.data
msg1 db 'Enter first number: $'
msg2 db 0Dh,0Ah,'Enter second number: $'
msg3 db 0Dh,0Ah,'Enter third number: $'
ans db 0Dh,0Ah,'Multiplication = $'

.code
main proc
    mov ax,@data
    mov ds,ax

   
    mov dx, offset msg1
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    sub al,30h
    mov bl,al

 
    mov dx, offset msg2
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    sub al,30h
    mov bh,al

   
    mov dx, offset msg3
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    sub al,30h
    mov cl,al

    call multiply3

    mov ah,4ch
    int 21h
main endp


multiply3 proc
    mov dx, offset ans
    mov ah,9
    int 21h

    mov al, bl
    mul bh      
    mov bl, al  
    mov al, bl
    mul cl      

  

    add al,30h
    mov dl,al
    mov ah,2
    int 21h
    ret
multiply3 endp

end main
