; (a+12)/5 , если a < b
; a/b-21 , если a > b
; 210 , a = b

section .data
    mega_brain db "Себя поделить на ноль не хочешь, ммм?", 10, 0
    len equ $-mega_brain
    hmm db  "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⡛⢯⣋⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣔⣥⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠉⠉⡩⠋⠁⠀⠀⠈⠙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠈⠀⣤⣴⡀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⡉⠉⠀⠀⠀⣤⣾⡿⠟⠛⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣛⣛⣷⢄⠀⣰⢟⠏⠀⠤⡀⠀⠄⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠈⢿⣥⠒⠢⡠⠵⠁⠱⠉⢁⣑⡜⠀⠄⠀⠀⠀⠀⠐⠻⠿⣿⣿⣿⠟⠋⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠂⢀⠼⡠⠭⠙⠀⢀⡰⣃⠓⢛⡃⠀⠀⠀⠀⠈⠀⠀⠀⠀⠈⠹⠁⠀⠀⢸⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠼⢀⡏⠀⠀⠀⠀⢀⣀⡍⠢⠤⠐⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡐⠋⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⣤⣴⣷⡤⠀⠀⠲⣿⣿⣿⣦⣄⣀⣂⣤⡤⠤⢀⠀⠀⠀⠀⠀⠀⡀⠁⢁⡇⠈⡟⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠺⣿⣿⠏⠀⠀⠀⠀⠹⣿⣿⠿⠛⠁⠀⠀⠡⠀⠀⠄⠀⠀⠀⠀⠀⠈⠀⠁⡇⠀⢱⢇⡐⢊⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⢿⠿⢟⠯⡉⣝⢟⡆⠀⠀⡇⠈⠀⠀⠀⠀⠀⠀⠘⠉⠀⠀⠀⠀⠀⠀⡄⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠇⡠⠋⢗⣨⢱⢞⣐⠴⠽⢿⣿⣿⣿⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣱⠁⡔⡓⡫⣷⠓⣇⡸⠀⠀⠀⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⢀⡠⠀⠊⠉⠉⠉⠑⠒⠫⢣⠓⡌⡊⠢⠋⣻⣿⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠉⠀⠉⣆⡭⣣⡣⠭⢊⡇⠀⠀⠀⠈⡖⠀⠀⠀⠀⠀⠀⠀⠀⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢦⡙⣀⢜⠖⢹⢿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⢸⡝⢁⠳⢆⣲⡇⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠌⠀⠀⠀⢀⣀⡀⠀⣀⠀⠀⠀⠀⠀⠀⠙⣮⠗⣤⡙⣘⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⣠⣮⡨⡊⠲⣚⠔⠉⡀⠀⠀⠀⠀⠑⠀⠢⢀⠀⢀⡀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣀⠔⠒⠉⠀⠀⠀⠀⠀⠀⠑⢄⠀⠀⠀⠀⠀⢳⣍⢖⢎⢼⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⡡⢄⡀⠀⠀⣠⠞⢌⠚⠁⢂⡔⠁⠀⠀⢨⡆⢀⠀⠀⠒⠠⣀⡀⠀⠀⢀⠠⠀⠀⠀⠀⠀⠀⠀⠀⡠⠐⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⡀⠀⠀⠀⠀⢣⢇⢿⢠⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢱⠃⠀⠀⡘⠈⠉⠙⡕⣡⡨⣣⠊⠀⠀⠀⡔⠁⠱⡀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄⠀⠀⠀⠈⣇⡌⠸⣸⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⡿⠛⠀⢺⠀⠀⠀⡃⠀⠀⢀⠰⡽⡜⠁⠀⠀⢀⠎⠀⠀⠀⠀⠠⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠤⠥⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢣⠀⠀⠀⠀⣿⠱⣶⠀⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⢸⡂⠀⠀⢃⠀⠀⠀⠈⠫⢀⡀⠀⡠⠃⠀⠀⠀⠀⠀⠀⠀⠑⠂⠤⠀⣀⣀⣀⡀⠤⠄⠓⠤⡀⠀⠀⠙⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⢸⠁⡚⠸⣷⣿", 10,\
            "    ⣿⣿⣿⣿⣿⡿⠀⠀⠀⢀⠞⠇⠀⠀⠀⠐⠄⠀⠀⠀⠀⠈⢢⡃⠀⠀⠀⣀⠀⠀⠀⠀⠀⢀⣀⠤⠖⠊⠉⠀⠀⠀⠀⠀⠘⠆⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⡎⠀⠀⢀⠏⠓⣰⣣⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⡇⠀⡀⠔⠁⠀⠀⠀⠀⠀⠀⢀⠂⠀⠀⠀⠀⠈⠈⠠⡼⠁⠀⠉⠳⡒⠊⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡠⠴⠒⢉⠜⠀⠀⢀⢾⢲⢞⣍⢹⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⡧⠊⠀⢀⠀⠀⠀⠀⣀⠀⠂⠁⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠡⡀⠀⢻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠤⠒⠁⠀⠀⡠⣛⠶⣯⡪⠯⣾⣿⣿", 10,\
            "    ⣿⣿⣿⣿⠟⠁⠀⠀⣨⠤⠀⠂⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧⠀⠈⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡤⣤⠶⢬⣀⣀⢀⣀⡤⣾⡿⠓⣏⠁⡻⢶⣿⣿⣿", 10,\
            "    ⣿⣿⡿⢃⠤⠐⠂⠉⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⢈⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠠⣤⢴⠪⣬⠡⠚⢧⡔⠲⠎⢚⢻⣽⡓⢈⠤⡙⣴⣓⢕⢹⣿⣿⣿⣿", 10,\
            "    ⣿⣏⠑⣣⠀⠠⠤⣤⣀⠺⠂⠂⠉⠉⠀⠀⠀⠐⠈⢁⠠⠐⠀⠀⢀⢈⣀⡤⠞⠀⠀⡎⠀⠀⠀⠀⠀⠀⣀⣀⣀⡤⠤⡴⠒⠉⠊⠉⠀⡤⠍⡶⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠁⣠⣶⣾⡆⢇⡥⡺⢻⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣷⣶⣷⠆⠂⠀⢀⠀⢀⣀⠤⠤⠐⠊⠀⠀⠐⡀⠠⢀⡠⠔⠉⠀⠀⠑⠢⠴⠚⠉⠉⠉⠉⠉⠉⠉⠀⠀⠀⠀⡐⠀⠀⠀⠀⠀⣰⣯⢖⣃⠱⠆⠀⠀⠀⠀⠀⠀⠀⠀⢞⠟⡫⠔⡐⠞⠋⠀⣾⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣦⣤⣶⣏⠽⠋⡁⢀⣠⡠⠄⠥⠤⡠⠐⠚⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡸⠀⠀⠀⠀⠀⢠⢣⠈⠀⠉⠀⠀⠀⠀⠀⠠⠼⣧⡈⡛⣈⡾⠛⠃⠀⠀⠀⣰⣿⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣟⡶⠶⠭⠽⠁⠀⠀⠀⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⠁⠀⠀⠀⠀⠀⡶⡠⠀⠀⠀⠀⠀⠀⠀⠀⢠⣘⣳⠶⠚⠁⠀⠀⠀⠀⡠⣺⣿⣿⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠃⠀⠀⠀⠀⠀⠀⢗⠧⢂⡰⠰⠢⣔⣐⡤⠴⠂⠁⠀⠀⠀⠀⠀⢀⡠⣪⣾⣿⣿⣿⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⣀⣀⣀⣀⣀⣀⡞⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡎⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⣠⠔⣭⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿", 10,\
            "    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣵⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣴⣥⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣶⣭⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿", 10, 0
    len_hmm equ $-hmm

section .text
    global asm_short
    global asm_ushort

asm_short:
    push rbp
    mov rbp, rsp

    mov ax, di
    mov bx, si
    cmp ax, bx
    jge Bol
    add ax, 12
    cwd
    mov bx, 5
    idiv bx
    
    mov rsp, rbp
    pop rbp
    ret

    Bol:
    cmp ax, bx
    je Ravno

    cmp bx, 0
    je brain  
    cwd
    idiv bx
    mov bx, 21
    sub rax, rbx

    mov rsp, rbp
    pop rbp
    ret

    Ravno:
    mov ax, 210

    mov rsp, rbp
    pop rbp
    ret

brain:
    mov rsi, mega_brain
    mov rdx, len
    mov rax, 1
    mov rdi, 1
    syscall

    mov rsi, hmm
    mov rdx, len_hmm
    mov rax, 1
    mov rdi, 1
    syscall

    mov rax, 60
    mov rdi, 1
    syscall


asm_ushort:
    push rbp
    mov rbp, rsp

    mov ax, di
    mov bx, si
    cmp ax, bx
    jae _Bol

    add ax, 12
    movzx eax, ax
    xor rdx, rdx
    mov bx, 5
    div bx
    
    mov rsp, rbp
    pop rbp
    ret

    _Bol:
    cmp ax, bx
    je _Ravno

    cmp bx, 0
    je brain  
    xor dx, dx              ;для деления нужен чистый dx ?????
    div bx
    mov bx, 21
    sub rax, rbx
    
    mov rsp, rbp
    pop rbp
    ret

    _Ravno:
    mov ax, 210

    mov rsp, rbp
    pop rbp
    ret