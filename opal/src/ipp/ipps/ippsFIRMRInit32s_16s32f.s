        .text
        .align  4
        .globl  _ippsFIRMRInit32s_16s32f


_ippsFIRMRInit32s_16s32f:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #0x18
        ldr     r12, [sp, #0x2C]
        ldr     lr, [sp, #0x34]
        ldr     r5, [sp, #0x30]
        ldr     r6, [sp, #0x38]
        ldr     r7, [sp, #0x3C]
        mov     r4, r0
        str     lr, [sp, #8]
        str     r12, [sp]
        str     r5, [sp, #4]
        str     r6, [sp, #0xC]
        str     r7, [sp, #0x10]
        bl      _ippsFIRMRInit32f_16s
        cmp     r0, #0
        bne     LBTY0
        ldr     r4, [r4]
        ldr     r3, [pc, #0x28]
        ldr     r2, [r4, #0x58]
        sub     r1, r3, #0xFA
        cmp     r1, r2
        subne   r3, r3, #0xF8
        strne   r3, [r4, #0x58]
        beq     LBTY1
LBTY0:
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r7, pc}
LBTY1:
        str     r3, [r4, #0x58]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r7, pc}
        .long   0x46493131


