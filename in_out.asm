;для 16 битных чисел
%define bufsize 512 
extern printf

section .data
    error db "Error!", 10, 0
    minus db "-"
    format_sig_fin db "%hi",10, 0
    len_error equ $-error

section .bss
    buffer dw bufsize

section .text
    global input, output


input:                
    push rbp
    mov rbp, rsp
    
    mov rsi, buffer         ;читаем
    mov rdx, bufsize
    mov rax, 0
    mov rdi, 0
    syscall

    dec eax                 ;получаем кол-во считанных знаков
    cmp eax, 6
    ja er_
    mov r15, rax

    xor r14, r14            ;проверка на минус, и непонятные махинации
    mov al, [buffer]        
    cmp al, 45
    jne end_minus
    mov r14, 1              ;флаг на минус
    dec r15
   
    end_minus:

    xor ebx, ebx
    xor rax, rax
    xor ecx, ecx            ;попробуй убрать, и посмотри что получится
    xor r8, r8
    xor r9, r9
    xor r10, r10
    lp:                     ;преобразуем в число
    xor ax, ax

    cmp r14, 1              ;работает флаг
    jne succ
    mov al, [buffer + 1 + ecx]
    jmp succ_double
    succ:
    mov al, [buffer + ecx]
    succ_double:

    cmp al, 48              ;проверка на цифры 
    jb er_
    cmp al, 57
    ja er_

    sub ax, 48              ;получаем цифру

    mov r9, r15
    sub r9, rcx
    pow:                    ;ну типа 234 = 2 * 10^2 + 3 * 10^1 + 4 * 10^0               
    cmp r9, 1
    je pow_end
    mov r12, 10
    mul r12
    dec r9
    jmp pow

    pow_end:
    add r8, rax

    inc ecx
    cmp rcx, r15
    jne lp

    cmp r14, 1              ;опять флаг
    jne min_mul
    neg r8
    min_mul:

    mov rax, r8             ;передаем значение обратно
    fin:
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

output:
    push rbp
    mov rbp, rsp

    mov eax, edi   

    xor rcx, rcx
    xor r9, r9
    xor r10, r10

    cmp eax, 0              ;проверка на минус
    jge looo
    mov r14, 1
    neg eax

    looo:                   ;переводим число в строку, но в обратном порядке (31 -> 13)
    xor dx, dx
    mov bx, 10
    div bx
    add dx, 48
    mov [buffer + ecx], dl
    inc ecx
    cmp ax, 0
    jne looo
    mov r9, rcx             ;кол-во знаков
    
    cmp r14, 1 
    jne zlooo
    mov rsi, minus          ;минус
    mov rdx, 1
    mov rax, 1 
    mov rdi, 1
    syscall

    zlooo:                  ;выводим по одной цифре с конца строки до начала
    mov rsi, buffer
    add rsi, r9
    dec rsi
    mov rdx, 1
    mov rax, 1
    mov rdi, 1
    syscall

    dec r9
    cmp r9, 0
    jne zlooo

    mov al, 10
    mov [buffer], al        ;перенос строки
    mov rsi, buffer
    mov rdx, 1 
    mov rax, 1 
    mov rdi, 1
    syscall
    
    jmp fin
