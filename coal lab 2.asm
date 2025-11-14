.model small
.stack 100h
.data
arr db 49,50,51,52   ; ASCII for '1','2','3','4'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov si, offset arr
     mov cx,5
     
     loopx:
     mov dl,[si]
     mov


    mov ah, 4Ch       ; exit to DOS
    int 21h
main endp
end main
