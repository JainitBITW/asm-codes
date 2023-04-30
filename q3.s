.section .rodata
.INP_STR:
    .string "%d"
.OUT_STR:
    .string "%d\n"
.section .text 
.globl main

main: 
    subq    $56, %rsp
    leaq    .INP_STR(%rip), %rdi 
    movq    %rsp, %rsi 
    call    __isoc99_scanf@PLT
    movq    (%rsp), %rsi
    movq    $0 , %r9
    movq    $1, %r8 
    jmp     .for

.for: 
    addq    $1, %r9
    imulq   %r9, %r8
    jmp .forch

.forch: 
    movq   %r8, %rax 
    movq   %rsi, %rcx
    xorq   %rdx,%rdx
    cqto 
    idivq   %rcx
    cmpq    $0 , %rdx 
    je  .end
    jmp  .for

.end : 
    movq %r9 ,%rsi
    leaq    .OUT_STR(%rip), %rdi
    call    printf@PLT
    addq    $56, %rsp
    xorl    %eax, %eax
    ret



    





