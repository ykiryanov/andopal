        .text
        .align  4
        .globl  _ippsConjCcs_64fc_I


_ippsConjCcs_64fc_I:
        stmdb   sp!, {r4, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, pc}
        mov     r3, #0
        cmp     r1, #0
        mov     r2, #1
        movlt   r3, r2
        add     r3, r1, r3
        tst     r1, #1
        mov     r3, r3, asr #1
        add     r12, r3, #1
        subeq   r3, r3, #1
        cmp     r3, #0
        ble     LCXY3
        cmp     r3, #5
        blt     LCXY1
        mov     r1, r3, lsl #4
        add     r1, r1, #0x1C
        add     r2, r1, r0
        mov     r1, r12, lsl #4
        sub     r1, r1, #4
        add     r1, r1, r0
LCXY0:
        ldr     r4, [r2, #-0x18]
        ldr     lr, [r2, #-0x1C]
        add     r12, r12, #4
        str     r4, [r1, #8]
        sub     r3, r3, #4
        str     lr, [r1, #4]
        ldr     r4, [r2, #-0x10]
        ldr     lr, [r2, #-0x14]
        cmp     r3, #5
        eor     r4, r4, #2, 2
        str     r4, [r1, #0x10]
        str     lr, [r1, #0xC]
        ldr     r4, [r2, #-0x28]
        ldr     lr, [r2, #-0x2C]
        str     r4, [r1, #0x18]
        str     lr, [r1, #0x14]
        ldr     r4, [r2, #-0x20]
        ldr     lr, [r2, #-0x24]
        eor     r4, r4, #2, 2
        str     r4, [r1, #0x20]
        str     lr, [r1, #0x1C]
        ldr     r4, [r2, #-0x38]
        ldr     lr, [r2, #-0x3C]
        str     r4, [r1, #0x28]
        str     lr, [r1, #0x24]
        ldr     r4, [r2, #-0x30]
        ldr     lr, [r2, #-0x34]
        eor     r4, r4, #2, 2
        str     r4, [r1, #0x30]
        str     lr, [r1, #0x2C]
        ldr     r4, [r2, #-0x48]
        ldr     lr, [r2, #-0x4C]
        str     r4, [r1, #0x38]
        str     lr, [r1, #0x34]
        ldr     r4, [r2, #-0x40]
        ldr     lr, [r2, #-0x44]
        sub     r2, r2, #0x40
        eor     r4, r4, #2, 2
        str     r4, [r1, #0x40]
        str     lr, [r1, #0x3C]
        add     r1, r1, #0x40
        bge     LCXY0
LCXY1:
        mov     r1, r3, lsl #4
        mov     r12, r12, lsl #4
        add     r1, r1, #0x1C
        sub     r12, r12, #4
        add     r1, r1, r0
        add     r0, r12, r0
LCXY2:
        ldr     r12, [r1, #-0x1C]
        ldr     r2, [r1, #-0x18]
        sub     r3, r3, #1
        str     r12, [r0, #4]
        cmp     r3, #0
        str     r2, [r0, #8]
        ldr     r12, [r1, #-0x10]
        ldr     r2, [r1, #-0x14]
        sub     r1, r1, #0x10
        eor     r12, r12, #2, 2
        str     r12, [r0, #0x10]
        str     r2, [r0, #0xC]
        add     r0, r0, #0x10
        bgt     LCXY2
LCXY3:
        mov     r0, #0
        ldmia   sp!, {r4, pc}


