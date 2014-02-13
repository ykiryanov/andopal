        .text
        .align  4
        .globl  __intel_imod0
        .globl  __aeabi_idiv0
        .globl  _div0
        .globl  _mod0
        .globl  __aeabi_ldiv0
        .globl  __intel_lmod0


_div0:
__intel_imod0:
__aeabi_idiv0:
        ldr     r12, [pc, #0x24]
        mov     r3, #0
        mov     r2, #0
        mov     r1, #0
        mov     r0, #3, 2
        add     r0, r0, #0x94
        bx      r12
        .long   0xea000000
_mod0:
        b       _div0
__aeabi_ldiv0:
        b       _div0
__intel_lmod0:
        b       _div0
        .long   0xf000fe38


