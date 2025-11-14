.model small
.stack 100h
.data
arr db 49,50,51,52   ; ASCII for '1','2','3','4'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov si, offset arr

    mov dl, [si]      ; print first element ('1')
    mov ah, 2
    int 21h

    mov dl, [si+1]    ; print second element ('2')
    mov ah, 2
    int 21h

    mov dl, [si+2]    ; print third element ('3')
    mov ah, 2
    int 21h

    mov dl, [si+3]    ; print fourth element ('4')
    mov ah, 2
    int 21h

    mov ah, 4Ch       ; exit to DOS
    int 21h
main endp
end main
