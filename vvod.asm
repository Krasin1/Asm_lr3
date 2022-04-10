; (a+12)/5 , если a < b
; a/b-21 , если a > b
; 210 , a = b
%define bufsize 512
extern unsig_cmp, sig_cmp

section .data
    menu db 10, "                 Лаб №2 + №3", 10, 10,\
        "Дунаев Влад №7", 10,\
        "Задание:", 10,\
        "(a+12)/5 , если a < b", 10,\
        "a/b-21 , если a > b", 10,\
        "210 , a = b", 10,10,\
        "Выберите тип данных(1 - short ; 2 - unsigned short): ", 0
    len_menu equ $-menu
    err_znach db "Такого варианта нет", 10, 0
    len_err_znach equ $-err_znach

section .bss
    n dd 0

section .text
    global _start

mainarr:
    dq sig_cmp
    dq unsig_cmp

_start:
    mov rdi, 1
    mov rsi, menu
    mov rdx, len_menu
    mov rax, 1
    syscall

    mov rsi, n
    mov rdx, bufsize
    mov rdi, 0
    mov rax, 0
    syscall
    
    dec rax
    cmp rax, 1
    jne err_

    mov al, [n]
    sub eax, 48
    dec eax
    cmp eax, 0
    jl err_
    cmp eax, 1
    jg err_
    call [mainarr + 8 * eax]

    final:
    mov rax, 60
    mov rdi, 1
    syscall

err_:
    mov rsi, err_znach
    mov rdx, len_err_znach
    mov rax, 1
    mov rdi, 1
    syscall
    jmp final
