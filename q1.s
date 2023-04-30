.section .rodata
.INP_STR:
    .string "%d %d %d"
.OUT_STR:
    .string "%d\n"
.ERR_STR: 
    .string "please dont do this to me i am already tired" 
.section    .text
.globl  main 

main:
    subq    $56,%rsp
    leaq    .INP_STR(%rip), %rdi
    movq    %rsp, %rsi
    leaq    4(%rsp), %rdx
    leaq    8(%rsp), %rcx
    call    __isoc99_scanf@PLT
    movl    (%rsp), %esi 
    movl    4(%rsp), %edx
    movl    8(%rsp), %ebx
    cmpl    $1, %ebx
    je      .add
    cmpl    $2, %ebx
    je      .sub
    cmpl    $3, %ebx
    je      .div
    cmpl    $4, %ebx
    je      .mod



.add: 
    addl    %edx, %esi
    leaq    .OUT_STR(%rip), %rdi
    call    printf@PLT
    addq    $56, %rsp
    xorl    %eax, %eax
    ret

.sub: 
    subl    %edx, %esi
    leaq    .OUT_STR(%rip), %rdi
    call    printf@PLT
    addq    $56, %rsp
    xorl    %eax, %eax
    ret

    
.div:
    cmpl $0, %edx
    je .error
    movl %esi , %eax
    movl %edx, %ecx
    xorl  %edx , %edx 
    cqto
    idivl       %ecx
    movl %eax , %esi 
    leaq    .OUT_STR(%rip), %rdi
    call    printf@PLT
    addq    $56, %rsp
    xorl    %eax, %eax
    ret

.mod:
    cmpl $0, %edx
    je .error
    movl %esi , %eax
    movl %edx, %ecx
    xorl  %edx , %edx 
    cqto
    idivl       %ecx
    movl %edx , %esi 
    leaq    .OUT_STR(%rip), %rdi
    call    printf@PLT
    addq    $56, %rsp
    xorl    %eax, %eax
    ret

.error:
    leaq    .ERR_STR(%rip), %rdi
    call    printf@PLT
    addq    $56, %rsp
    xorl    %eax, %eax
    ret
