        .text
        .align  4
        .globl  _ippsBuildSymblTableDV4D_16sc


_ippsBuildSymblTableDV4D_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x80
        cmp     r0, #0
        beq     LANI15
        cmp     r1, #0
        beq     LANI15
        cmp     r3, #0
        mov     r12, #0
        bne     LANI1
        cmp     r2, #0x10
        beq     LANI7
        cmp     r2, #0x20
        beq     LANI3
        add     r3, sp, #0x70
        add     r2, sp, #0x60
        add     r1, r1, #2
        mov     lr, r12
LANI0:
        mov     r5, lr, lsr #2
        add     r4, lr, r5
        add     r6, sp, #0x70
        and     r4, r4, #3
        str     r5, [r6]
        mov     r7, r4, lsl #2
        add     r6, sp, #0x60
        add     r7, r7, #0x20
        str     r4, [r6]
        ldrsh   r6, [r0, +r7]
        mov     r7, r5, lsl #2
        ldrsh   r7, [r0, +r7]
        add     r4, r4, #4
        add     r8, r5, #4
        and     r5, r4, #7
        add     r4, r7, r6
        strh    r4, [r1]
        and     r8, r8, #7
        mov     r6, r5, lsl #2
        str     r8, [r3, #4]
        add     r6, r6, #0x20
        ldrsh   r6, [r0, +r6]
        str     r5, [r2, #4]
        mov     r8, r8, lsl #2
        ldrsh   r5, [r0, +r8]
        bic     r4, r4, #0xFF, 8
        bic     r4, r4, #0xFF, 16
        add     r6, r5, r6
        cmp     r4, r6
        movls   r5, r12
        strhih  r6, [r1]
        movhi   r5, #1
        add     r4, sp, #0x70
        ldr     r4, [r4, +r5, lsl #2]
        add     r6, sp, #0x60
        ldr     r5, [r6, +r5, lsl #2]
        add     r4, r0, r4, lsl #2
        ldrsh   r4, [r4, #2]
        add     lr, lr, #1
        add     r5, r0, r5, lsl #2
        ldrsh   r5, [r5, #0x22]
        and     r4, r4, #0xFF
        cmp     lr, #0x20
        orr     r5, r4, r5, lsl #8
        strh    r5, [r1, #-2]
        add     r1, r1, #4
        blt     LANI0
        mov     r0, #0
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LANI1:
        cmp     r2, #0x10
        beq     LANI13
        cmp     r2, #0x20
        beq     LANI9
        add     lr, sp, #0x78
        add     r2, sp, #0x68
        add     r4, r1, #2
        mov     r5, r12
LANI2:
        eor     r7, r5, r3
        add     r1, sp, #0x78
        mov     r6, r7, lsr #2
        add     r7, r6, r7
        str     r6, [r1]
        and     r1, r7, #3
        add     r7, sp, #0x68
        mov     r8, r1, lsl #2
        add     r8, r8, #0x20
        str     r1, [r7]
        ldrsh   r7, [r0, +r8]
        mov     r8, r6, lsl #2
        ldrsh   r8, [r0, +r8]
        add     r1, r1, #4
        and     r1, r1, #7
        add     r6, r6, #4
        str     r1, [r2, #4]
        and     r6, r6, #7
        add     r7, r8, r7
        mov     r1, r1, lsl #2
        strh    r7, [r4]
        add     r1, r1, #0x20
        ldrsh   r1, [r0, +r1]
        str     r6, [lr, #4]
        mov     r6, r6, lsl #2
        ldrsh   r6, [r0, +r6]
        bic     r7, r7, #0xFF, 8
        bic     r7, r7, #0xFF, 16
        add     r1, r6, r1
        cmp     r7, r1
        movls   r6, r12
        strhih  r1, [r4]
        movhi   r6, #1
        add     r1, sp, #0x78
        ldr     r1, [r1, +r6, lsl #2]
        add     r7, sp, #0x68
        ldr     r6, [r7, +r6, lsl #2]
        add     r1, r0, r1, lsl #2
        ldrsh   r1, [r1, #2]
        add     r5, r5, #1
        add     r6, r0, r6, lsl #2
        ldrsh   r6, [r6, #0x22]
        and     r1, r1, #0xFF
        cmp     r5, #0x20
        orr     r6, r1, r6, lsl #8
        strh    r6, [r4, #-2]
        add     r4, r4, #4
        blt     LANI2
        mov     r0, #0
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LANI3:
        add     r9, sp, #0x20
        mov     r8, sp
        add     r7, sp, #0x20
        mov     r6, sp
        add     r4, sp, #0x20
        mov     lr, sp
        add     r3, sp, #0x20
        mov     r2, sp
        add     r1, r1, #2
        add     r5, r0, #0x20
LANI4:
        and     r3, r12, #8
        add     r11, sp, #0x20
        add     r10, r12, r3, lsl #1
        eor     r3, r10, #8
        mov     r9, r10, lsr #2
        mov     r6, r3, lsr #2
        add     r3, r3, r6
        and     lr, r3, #3
        mov     r4, r6, lsl #2
        mov     r3, lr, lsl #2
        ldrsh   r4, [r0, +r4]
        add     r3, r3, #0x20
        ldrsh   r3, [r0, +r3]
        add     r7, r6, #4
        and     r7, r7, #7
        str     r7, [r11, #4]
        add     r8, lr, #4
        add     r3, r4, r3
        and     r8, r8, #7
        mov     r11, sp
        str     r8, [r11, #4]
        ldr     r8, [r2, #4]
        add     r4, sp, #0x20
        add     r7, sp, #0x20
        ldr     r7, [r7, #4]
        str     r9, [r4, #8]
        mov     r4, r3, lsl #16
        add     r10, r9, r10
        mov     r4, r4, asr #16
        strh    r4, [r1]
        and     r3, r10, #3
        mov     r8, r8, lsl #2
        ldrsh   r10, [r5, +r8]
        mov     r7, r7, lsl #2
        ldrsh   r7, [r0, +r7]
        add     r8, r9, #4
        add     r9, r3, #4
        add     r10, r7, r10
        mov     r7, sp
        str     r3, [r7, #8]
        add     r3, sp, #0x20
        and     r8, r8, #7
        str     r8, [r3, #0xC]
        mov     r3, sp
        and     r9, r9, #7
        str     r9, [r3, #0xC]
        add     r3, sp, #0x20
        str     r6, [r3]
        mov     r3, sp
        cmp     r4, r10
        str     lr, [r3]
        movls   r3, #0
        bls     LANI5
        mov     r10, r10, lsl #16
        mov     r3, #1
        mov     r4, r10, asr #16
        strh    r4, [r1]
LANI5:
        add     lr, sp, #0x20
        ldr     r6, [r2, #8]
        ldr     lr, [lr, #8]
        mov     r6, r6, lsl #2
        ldrsh   r6, [r5, +r6]
        mov     lr, lr, lsl #2
        ldrsh   lr, [r0, +lr]
        add     r6, lr, r6
        cmp     r4, r6
        bls     LANI6
        mov     r6, r6, lsl #16
        mov     r3, #2
        mov     r4, r6, asr #16
        strh    r4, [r1]
LANI6:
        add     lr, sp, #0x20
        ldr     r6, [r2, #0xC]
        ldr     lr, [lr, #0xC]
        mov     r6, r6, lsl #2
        ldrsh   r6, [r5, +r6]
        mov     lr, lr, lsl #2
        ldrsh   lr, [r0, +lr]
        add     r6, lr, r6
        cmp     r4, r6
        strhih  r6, [r1]
        movhi   r3, #3
        add     lr, sp, #0x20
        ldr     lr, [lr, +r3, lsl #2]
        mov     r4, sp
        ldr     r4, [r4, +r3, lsl #2]
        add     lr, r0, lr, lsl #2
        ldrsh   r3, [lr, #2]
        add     r4, r5, r4, lsl #2
        ldrsh   lr, [r4, #2]
        add     r12, r12, #1
        and     r3, r3, #0xFF
        cmp     r12, #0x10
        orr     lr, r3, lr, lsl #8
        strh    lr, [r1, #-2]
        add     r1, r1, #4
        blt     LANI4
        mov     r0, #0
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LANI7:
        add     r3, sp, #0x50
        add     r2, sp, #0x40
        add     r1, r1, #2
        mov     lr, r12
LANI8:
        mov     r5, lr, lsr #2
        add     r4, lr, r5
        add     r6, sp, #0x50
        and     r4, r4, #3
        str     r5, [r6]
        mov     r7, r4, lsl #2
        add     r6, sp, #0x40
        add     r7, r7, #0x20
        str     r4, [r6]
        ldrsh   r6, [r0, +r7]
        mov     r7, r5, lsl #2
        ldrsh   r7, [r0, +r7]
        add     r4, r4, #2
        add     r5, r5, #2
        add     r7, r7, r6
        and     r6, r4, #3
        str     r6, [r2, #4]
        mov     r4, r7, lsl #16
        and     r5, r5, #3
        mov     r6, r6, lsl #2
        mov     r4, r4, asr #16
        strh    r4, [r1]
        add     r6, r6, #0x20
        ldrsh   r6, [r0, +r6]
        str     r5, [r3, #4]
        mov     r5, r5, lsl #2
        ldrsh   r5, [r0, +r5]
        add     r6, r5, r6
        cmp     r4, r6
        movls   r5, r12
        strhih  r6, [r1]
        movhi   r5, #1
        add     r4, sp, #0x50
        ldr     r4, [r4, +r5, lsl #2]
        add     r6, sp, #0x40
        ldr     r5, [r6, +r5, lsl #2]
        add     r4, r0, r4, lsl #2
        ldrsh   r4, [r4, #2]
        add     lr, lr, #1
        add     r5, r0, r5, lsl #2
        ldrsh   r5, [r5, #0x22]
        and     r4, r4, #0xFF
        cmp     lr, #8
        orr     r5, r4, r5, lsl #8
        strh    r5, [r1, #-2]
        add     r1, r1, #4
        blt     LANI8
        mov     r0, #0
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LANI9:
        add     r11, sp, #0x30
        add     r10, sp, #0x10
        add     r9, sp, #0x30
        add     r8, sp, #0x10
        add     r7, sp, #0x30
        add     r6, sp, #0x10
        add     r4, sp, #0x30
        add     lr, sp, #0x10
        add     r2, r1, #2
        add     r5, r0, #0x20
LANI10:
        and     r1, r12, #8
        eor     lr, r12, r3
        add     r1, lr, r1, lsl #1
        eor     lr, r1, #8
        mov     r8, r1, lsr #2
        mov     r6, lr, lsr #2
        add     lr, lr, r6
        and     r4, lr, #3
        add     lr, sp, #0x30
        str     r8, [lr, #8]
        add     r9, r1, r8
        mov     r1, r4, lsl #2
        mov     lr, r6, lsl #2
        ldrsh   r10, [r0, +lr]
        add     r1, r1, #0x20
        ldrsh   lr, [r0, +r1]
        add     r7, r6, #4
        add     r1, r4, #4
        add     r11, sp, #0x30
        and     r7, r7, #7
        str     r7, [r11, #4]
        and     r1, r1, #7
        add     r10, r10, lr
        add     r11, sp, #0x10
        str     r1, [r11, #4]
        and     lr, r9, #3
        add     r9, sp, #0x10
        add     r1, sp, #0x10
        add     r7, sp, #0x30
        ldr     r7, [r7, #4]
        ldr     r1, [r1, #4]
        str     lr, [r9, #8]
        add     r9, r8, #4
        mov     r10, r10, lsl #16
        mov     r7, r7, lsl #2
        mov     r1, r1, lsl #2
        mov     r8, r10, asr #16
        strh    r8, [r2]
        ldrsh   r1, [r5, +r1]
        ldrsh   r7, [r0, +r7]
        add     lr, lr, #4
        and     r9, r9, #7
        and     lr, lr, #7
        add     r1, r7, r1
        add     r7, sp, #0x30
        str     r9, [r7, #0xC]
        add     r7, sp, #0x10
        str     lr, [r7, #0xC]
        add     lr, sp, #0x30
        str     r6, [lr]
        add     lr, sp, #0x10
        cmp     r8, r1
        str     r4, [lr]
        movls   r1, #0
        bls     LANI11
        mov     lr, r1, lsl #16
        mov     r1, #1
        mov     r8, lr, asr #16
        strh    r8, [r2]
LANI11:
        add     r4, sp, #0x10
        add     lr, sp, #0x30
        ldr     r4, [r4, #8]
        ldr     lr, [lr, #8]
        mov     r4, r4, lsl #2
        ldrsh   r4, [r5, +r4]
        mov     lr, lr, lsl #2
        ldrsh   lr, [r0, +lr]
        add     r4, lr, r4
        cmp     r8, r4
        bls     LANI12
        mov     r4, r4, lsl #16
        mov     r1, #2
        mov     r8, r4, asr #16
        strh    r8, [r2]
LANI12:
        add     r4, sp, #0x10
        add     lr, sp, #0x30
        ldr     r4, [r4, #0xC]
        ldr     lr, [lr, #0xC]
        mov     r4, r4, lsl #2
        ldrsh   r4, [r5, +r4]
        mov     lr, lr, lsl #2
        ldrsh   lr, [r0, +lr]
        add     r4, lr, r4
        cmp     r8, r4
        strhih  r4, [r2]
        movhi   r1, #3
        add     lr, sp, #0x30
        ldr     lr, [lr, +r1, lsl #2]
        add     r4, sp, #0x10
        ldr     r4, [r4, +r1, lsl #2]
        add     lr, r0, lr, lsl #2
        ldrsh   r1, [lr, #2]
        add     r4, r5, r4, lsl #2
        ldrsh   lr, [r4, #2]
        add     r12, r12, #1
        and     r1, r1, #0xFF
        cmp     r12, #0x10
        orr     lr, r1, lr, lsl #8
        strh    lr, [r2, #-2]
        add     r2, r2, #4
        blt     LANI10
        mov     r0, #0
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LANI13:
        add     lr, sp, #0x58
        add     r2, sp, #0x48
        add     r1, r1, #2
        mov     r4, r12
LANI14:
        eor     r6, r4, r3
        add     r5, sp, #0x58
        mov     r7, r6, lsr #2
        add     r6, r6, r7
        and     r6, r6, #3
        str     r7, [r5]
        mov     r8, r6, lsl #2
        add     r5, sp, #0x48
        add     r8, r8, #0x20
        str     r6, [r5]
        ldrsh   r5, [r0, +r8]
        mov     r8, r7, lsl #2
        ldrsh   r8, [r0, +r8]
        add     r6, r6, #2
        and     r6, r6, #3
        add     r5, r8, r5
        add     r7, r7, #2
        mov     r5, r5, lsl #16
        str     r6, [r2, #4]
        and     r7, r7, #3
        mov     r6, r6, lsl #2
        mov     r5, r5, asr #16
        strh    r5, [r1]
        str     r7, [lr, #4]
        add     r6, r6, #0x20
        mov     r7, r7, lsl #2
        ldrsh   r6, [r0, +r6]
        ldrsh   r7, [r0, +r7]
        add     r6, r7, r6
        cmp     r5, r6
        movls   r6, r12
        strhih  r6, [r1]
        movhi   r6, #1
        add     r5, sp, #0x58
        ldr     r5, [r5, +r6, lsl #2]
        add     r7, sp, #0x48
        ldr     r6, [r7, +r6, lsl #2]
        add     r5, r0, r5, lsl #2
        ldrsh   r5, [r5, #2]
        add     r4, r4, #1
        add     r6, r0, r6, lsl #2
        ldrsh   r6, [r6, #0x22]
        and     r5, r5, #0xFF
        cmp     r4, #8
        orr     r6, r5, r6, lsl #8
        strh    r6, [r1, #-2]
        add     r1, r1, #4
        blt     LANI14
        mov     r0, #0
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LANI15:
        mvn     r0, #7
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}


