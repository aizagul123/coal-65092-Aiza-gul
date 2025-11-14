.model small
.stack 100h
.data
.code
main proc
    mov bx, 5      ; start with 5 stars
    mov cx, 5      ; outer loop runs 5 times

L1:
    push cx
    mov cx, bx     ; inner loop counter = number of stars to print

L2:
    mov dl, '*'
    mov ah, 2
    int 21h
    loop L2

   
    mov dl, 10
    mov ah, 2
    int 21h

    mov dl, 13
    mov ah, 2
    int 21h

    dec bx          ; decrease number of stars
    pop cx
    loop L1

    mov ah, 4ch
    int 21h
main endp
end main
                                            .