.model small
.stack 100h
.data
values dw 450,0,487,101,500,0,359,0,458
count dw 9
msg db 0Dh,0Ah,'Non-zero values:$'
newline db 0Dh,0Ah,'$'
.code
main proc
mov ax,@data
mov ds,ax

mov ah,9
lea dx,msg
int 21h

mov cx,count
lea si,values

next:
mov ax,[si]
cmp ax,0
je skip
push ax        ; push non-zero value
; print it (for output)
mov bx,ax
call print_num
skip:
add si,2
loop next

mov ah,4ch
int 21h

;---------- print_num procedure ----------
print_num proc
    push ax
    push bx
    push cx
    push dx
    mov cx,0
    mov bx,10
convert:
    xor dx,dx
    div bx
    push dx
    inc cx
    cmp ax,0
    jne convert
printloop:
    pop dx
    add dl,'0'
    mov ah,2
    int 21h
    loop printloop
    mov ah,9
    lea dx,newline
    int 21h
    pop dx
    pop cx
    pop bx
    pop ax
    ret



end main
