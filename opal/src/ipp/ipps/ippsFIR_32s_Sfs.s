        .text
        .align  4
        .globl  _ippsFIR_32s_Sfs


_ippsFIR_32s_Sfs:
        stmdb   sp!, {r4 - r8, lr}
        ldr     r7, [sp, #0x18]
        mov     r4, r3
        cmp     r4, #0
        mov     r6, r0
        mov     r5, r1
        mov     r8, r2
        beq     LBTB2
        cmp     r6, #0
        beq     LBTB2
        cmp     r5, #0
        beq     LBTB2
        cmp     r8, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        ldr     r12, [r4]
        ldr     lr, [pc, #0x40]
        cmp     lr, r12
        mvnne   r0, #0x10
        ldmneia sp!, {r4 - r8, pc}
        cmp     r8, #0
        ble     LBTB1
LBTB0:
        mov     r3, r7
        ldr     r0, [r6], #4
        mov     r2, r4
        mov     r1, r5
        bl      _ippsFIROne_32s_Sfs
        subs    r8, r8, #1
        add     r5, r5, #4
        bne     LBTB0
LBTB1:
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LBTB2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}
        .long   0x46493231


