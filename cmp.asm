extern asm_short, asm_ushort    ;на вход запрашивает два числа, из $di и $si; возвращает результат в $ax
extern input       ;на вход ничего, возвращает считанное значение в $rax
extern output      ;на вход число должно записывается в $edi

section .data
    sig_range db "            short", 10,\
                "Диапозон данных : -32,768 до 32,767", 10, 0
    len_sig_range equ $-sig_range
    unsig_range db "             unsigned short", 10,\
                "Диапозон данных : 0 до 65,535",10, 0
    len_unsig_range equ $-unsig_range
    vvod_a db "ВВОДИТЬ ТОЛЬКО ЧИСЛА!!!!!", 10, "Введите a : ", 0
    len_vvod_a equ $-vvod_a
    vvod_b db "Введите b : ", 0
    len_vvod_b equ $-vvod_b
    error db "Error!", 10, 0
    len_error equ $-error
    result db "Результат: ", 0
    len_result equ $-result

    format_sig_fin db "%hi",10, 0
    format_unsig_fin db "%hu", 10, 0

section .bss
    a_sig dw 0
    a_unsig dw 0
    b_sig dw 0
    b_unsig dw 0

section .text
    global sig_cmp, unsig_cmp
    global metka

sig_cmp:
    push rbp
    mov rbp, rsp
    
    mov rsi, sig_range
    mov rdx, len_sig_range
    mov rax, 1
    mov rdi, 1
    syscall
    
    mov rsi, vvod_a
    mov rdx, len_vvod_a
    mov rax, 1
    mov rdi, 1
    syscall                 ;ввод
    call input

    cmp rax, 32767          ;проверка на диапозон
    jg er_
    cmp rax, -32767
    jl er_
    mov [a_sig], ax

    mov rsi, vvod_b
    mov rdx, len_vvod_b
    mov rax, 1
    mov rdi, 1
    syscall
    call input              ;ввод

    cmp rax, 32767          ;проверка на диапозон
    jg er_
    cmp rax, -32767
    jl er_
    mov [b_sig], ax

    mov di, [a_sig]
    mov si, [b_sig]
    call asm_short          ;считаем
    movsx ebx, ax
    
    mov rsi, result
    mov rdx, len_result
    mov rax, 1
    mov rdi, 1
    syscall

    mov edi, ebx
    call output

    final:
    mov rsp, rbp
    pop rbp
    ret 

er_:
    mov rsi, error
    mov rdx, len_error
    mov rax, 1
    mov rdi, 1
    syscall

    mov rax, 60
    mov rdi, 1
    syscall



unsig_cmp:
    push rbp
    mov rbp, rsp

    mov rsi, unsig_range
    mov rdx, len_unsig_range
    mov rax, 1
    mov rdi, 1
    syscall

    mov rsi, vvod_a
    mov rdx, len_vvod_a
    mov rax, 1
    mov rdi, 1
    syscall
    call input

    cmp rax, 65535          ;проверка на диапозон
    jg er_
    cmp rax, 0
    jl er_
    mov [a_unsig], ax
    
    mov rsi, vvod_b
    mov rdx, len_vvod_b
    mov rax, 1
    mov rdi, 1
    syscall
    call input

    cmp rax, 65535          ;проверка на диапозон
    jg er_
    cmp rax, 0
    jl er_
    mov [b_unsig], ax

    mov di, [a_unsig]
    mov si, [b_unsig]
    call asm_ushort
    mov ebx, eax

    mov rsi, result
    mov rdx, len_result
    mov rax, 1
    mov rdi, 1
    syscall

    mov edi, ebx
    call output

    jmp final
