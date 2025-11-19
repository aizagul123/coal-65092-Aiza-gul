.model small
.stack 100h
.data
msg1 db 'Enter X: $'
msg2 db 0Dh,0Ah,'Enter Y: $'
msg3 db 0Dh,0Ah,'Enter Z: $'
resMsg db 0Dh,0Ah,'Result = $'

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

    call solve

    mov ah,4ch
    int 21h
main endp

solve proc
    mov dx, offset resMsg
    mov ah,9
    int 21h

    mov al, bl
    add al, bh
    sub al, cl
    sub al, 1

    add al,30h
    mov dl,al
    mov ah,2
    int 21h
    ret
solve endp

end main
