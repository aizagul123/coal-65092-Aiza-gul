.model small
.stack 100h
.data
.code
main proc
    mov bx, 1      ; starting value (1 number in first line)
    mov cx, 5      ; outer loop runs 5 times (for 5 lines)

L1:
    push cx
    mov cx, bx     ; inner loop counter = number of digits to print
    mov dl, '1'    ; start printing from '1'

L2:
    mov ah, 2
    int 21h       
    inc dl      
    loop L2

 
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h

    inc bx         ; increase number of digits for next line
    pop cx
    loop L1

    mov ah, 4ch
    int 21h
main endp
end main
