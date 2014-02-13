        .text
        .align  4
        .globl  _ippsMalloc_16s


_ippsMalloc_16s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        ble     LDBH0
        ldr     r1, [pc, #0x30]
        mov     r0, r0, lsl #1
        add     r0, r0, #0x24
        ldr     r1, [r1]
        blx     r1
        cmp     r0, #0
        beq     LDBH0
        add     r1, r0, #0x23
        bic     r1, r1, #0x1F
        str     r0, [r1, #-4]
        mov     r0, r1
        ldr     pc, [sp], #4
LDBH0:
        mov     r0, #0
        ldr     pc, [sp], #4
        .long   i_malloc

