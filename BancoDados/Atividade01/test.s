;Hello word em Assembly

section.data
    input db "Qual variavel deseja imprimir? ", 0
    output db "O valor da variavel eh: ", 0
    var1 dd 0
    var2 dd 1 

section.text
    global _start

_start:
    mov eax, [var1]
    cmp eax, [var2]
    je  equal_case

    mov eax, 4
    mov ebx, 1
    mov ecx, output
    mov edx, 24
    int 0x80
    jmp end_program 

equal_case:
    mov eax, 4
    mov ebx, 1
    mov ecx, input
    mov edx, 27
    int 0x80

end_program:
    
    mov eax, 1
    xor ebx, ebx
    int 0x80