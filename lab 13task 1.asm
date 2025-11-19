
.model small
.stack 100h
.data
msg DB 'My name is Aiza Gul.$'
.code

main proc
    mov ax, @data
    mov ds, ax

    call introduce     ; calling subroutine

    mov ah, 4ch
    int 21h
main endp


introduce proc
    mov dx, offset msg
    mov ah,09h
    int 21h
    ret
introduce endp

end main
