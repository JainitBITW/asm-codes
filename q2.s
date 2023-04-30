.section .rodata 
.INP_STR: 
    .string "%lld" 
.Y_STR: 
    .string "Y\n" 
.N_STR: 
    .string "N\n"
.section .text 
.globl main

main: 
    subq    $56, %rsp
    leaq    .INP_STR(%rip), %rdi 
    movq    %rsp, %rsi 
    call    __isoc99_scanf@PLT
    movq    (%rsp), %rsi 
    movq    $0 , %r9
    jmp     .for

.for: 
    movq    $1,%r8
    andq    %rsi, %r8
    addq    %r8, %r9
    xorq    %rdx, %rdx 
    movq    %rsi , %rax
    movq    $2, %rcx
    cqto
    idivq   %rcx
    movq    %rax , %rsi
    jmp .forch


.forch: 
    cmpq    $0 , %rsi 
    je .end
    jmp .for


.end: 
    movq    $1, %rax
    andq    %r9, %rax 
    cmpq    $0, %rax 
    je      .no
    cmpq    $1, %rax 
    je  .yes

.yes:
    leaq   .Y_STR(%rip), %rdi 
    call    printf@PLT
    addq    $56, %rsp
    xorl    %eax, %eax
    ret
.no: 
    leaq   .N_STR(%rip), %rdi 
    call    printf@PLT
    addq    $56, %rsp
    xorl    %eax, %eax
    ret