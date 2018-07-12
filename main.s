        .file   "main.c"
        .section        .rodata
        .align 8
.LC0:
        .string "Testing write data to memory, from one block to another block. Memory copy only 100 bytes and can check byte by byte addresses in memory"
.LC1:
        .string "b[%u] = %p\n"
.LC2:
        .string "sizeof(b) = %lu\n"
        .text
        .globl  main
        .type   main, @function
main:
.LFB0:
        .cfi_startproc
        pushq   %rbp
        .cfi_def_cfa_offset 16
        .cfi_offset 6, -16
        movq    %rsp, %rbp
        .cfi_def_cfa_register 6
        pushq   %rbx
        subq    $1160, %rsp
        .cfi_offset 3, -24
        movl    %edi, -1156(%rbp)
        movq    %rsi, -1168(%rbp)
        movq    %fs:40, %rax
        movq    %rax, -24(%rbp)
        xorl    %eax, %eax
        leaq    -1024(%rbp), %rax
        movq    %rax, %rdx
        movl    $.LC0, %eax
        movl    $17, %ecx
        movq    %rdx, %rdi
        movq    %rax, %rsi
        rep movsq
        movq    %rsi, %rax
        movq    %rdi, %rdx
        movzbl  (%rax), %ecx
        movb    %cl, (%rdx)
        addq    $1, %rdx
        addq    $1, %rax
        movl    $0, -1140(%rbp)
        jmp     .L2
.L3:
        movl    -1140(%rbp), %eax
        cltq
        movzbl  -1024(%rbp,%rax), %edx
        movl    -1140(%rbp), %eax
        cltq
        movb    %dl, -1136(%rbp,%rax)
        addl    $1, -1140(%rbp)
.L2:
        cmpl    $99, -1140(%rbp)
        jle     .L3
        movb    $0, -1036(%rbp)
        leaq    -1136(%rbp), %rax
        movq    %rax, %rdi
        call    puts
.L4:
        leaq    -1136(%rbp), %rdx
        movl    -1140(%rbp), %eax
        cltq
        addq    %rax, %rdx
        movl    -1140(%rbp), %eax
        movl    %eax, %esi
        movl    $.LC1, %edi
        movl    $0, %eax
        call    printf
        addl    $1, -1140(%rbp)
        movl    -1140(%rbp), %eax
        cmpl    $99, %eax
        jbe     .L4
        movl    $100, %esi
        movl    $.LC2, %edi
        movl    $0, %eax
        call    printf
        movl    $0, %eax
        movq    -24(%rbp), %rbx
        xorq    %fs:40, %rbx
        je      .L6
        call    __stack_chk_fail
.L6:
        addq    $1160, %rsp
        popq    %rbx
        popq    %rbp
        .cfi_def_cfa 7, 8
        ret
        .cfi_endproc
.LFE0:
        .size   main, .-main
