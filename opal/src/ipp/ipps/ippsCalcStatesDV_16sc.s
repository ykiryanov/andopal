        .text
        .align  4
        .globl  _ippsCalcStatesDV_16sc


_ippsCalcStatesDV_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        ldr     lr, [sp, #0x64]
        ldr     r6, [sp, #0x68]
        ldr     r12, [sp, #0x6C]
        cmp     r0, #0
        beq     LANH19
        cmp     r1, #0
        beq     LANH19
        cmp     r2, #0
        beq     LANH19
        cmp     r3, #0
        beq     LANH19
        cmp     lr, #0
        beq     LANH19
        cmp     r6, #0
        ble     LANH18
        mov     r5, #0
        mov     r4, r5
        mov     r8, r4
        add     r9, r3, #2
        add     r10, r3, #0xA
        add     r11, r3, #0x12
        add     r7, r3, #0x1A
        str     r0, [sp]
        str     r7, [sp, #0xC]
        str     r11, [sp, #0x10]
        str     r10, [sp, #0x14]
        str     r9, [sp, #0x18]
        str     r8, [sp, #4]
        str     r6, [sp, #8]
        str     r1, [sp, #0x24]
LANH0:
        ldr     r6, [sp]
        ldr     r8, [sp, #0x24]
        ldr     r1, [sp, #4]
        ldrh    r0, [r6], #2
        ldr     r9, [sp, #0x10]
        ldrb    r7, [r4, +r8]
        and     r1, r1, #1
        str     r6, [sp]
        str     r1, [sp, #0x1C]
        mov     r6, r1, lsl #2
        ldr     r1, [sp, #0x18]
        ldrsh   r9, [r9, +r6]
        add     r11, r8, r4
        ldrsh   r10, [r1, +r6]
        ldr     r1, [sp, #0x14]
        ldrsh   r1, [r1, +r6]
        str     r9, [sp, #0x30]
        ldr     r9, [sp, #0xC]
        add     r10, r0, r10
        add     r1, r0, r1
        ldrsh   r9, [r9, +r6]
        str     r9, [sp, #0x28]
        ldrb    r8, [r11, #1]
        ldrb    r9, [r11, #2]
        ldrb    r11, [r11, #3]
        str     r11, [sp, #0x34]
        mov     r11, r7, lsl #1
        str     r11, [sp, #0x20]
        ldrh    r11, [r2, +r11]
        str     r1, [sp, #0x2C]
        ldr     r1, [sp, #0x30]
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #0x38]
        add     r1, r0, r1
        cmp     r10, r11
        ldr     r11, [sp, #0x28]
        add     r11, r0, r11
        str     r11, [sp, #0x30]
        bge     LANH1
        ldrh    r11, [r3, +r6]
        add     r7, r12, r7
        str     r7, [sp, #0x28]
        str     r11, [sp, #0x38]
        ldr     r7, [sp, #0x38]
        ldr     r11, [sp, #0x28]
        orr     r7, r7, r5
        str     r7, [lr, +r11, lsl #2]
        ldr     r7, [sp, #0x20]
        strh    r10, [r2, +r7]
LANH1:
        mov     r7, r8, lsl #1
        str     r7, [sp, #0x28]
        ldrh    r7, [r2, +r7]
        ldr     r10, [sp, #0x2C]
        cmp     r10, r7
        bge     LANH2
        add     r7, r3, #8
        ldrh    r7, [r7, +r6]
        add     r8, r12, r8
        orr     r7, r7, r5
        str     r7, [lr, +r8, lsl #2]
        ldr     r8, [sp, #0x28]
        ldr     r7, [sp, #0x2C]
        strh    r7, [r2, +r8]
LANH2:
        mov     r7, r9, lsl #1
        ldrh    r8, [r2, +r7]
        cmp     r1, r8
        bge     LANH3
        add     r8, r3, #0x10
        ldrh    r8, [r8, +r6]
        add     r9, r12, r9
        orr     r8, r8, r5
        str     r8, [lr, +r9, lsl #2]
        strh    r1, [r2, +r7]
LANH3:
        ldr     r1, [sp, #0x34]
        ldr     r7, [sp, #0x30]
        mov     r1, r1, lsl #1
        ldrh    r8, [r2, +r1]
        cmp     r7, r8
        bge     LANH4
        add     r7, r3, #0x18
        ldrh    r7, [r7, +r6]
        ldr     r6, [sp, #0x34]
        orr     r7, r7, r5
        add     r6, r12, r6
        str     r7, [lr, +r6, lsl #2]
        ldr     r6, [sp, #0x30]
        strh    r6, [r2, +r1]
LANH4:
        ldr     r1, [sp, #8]
        add     r4, r4, #4
        cmp     r1, #0x10
        beq     LANH17
        ldr     r1, [sp, #0x1C]
        ldr     r7, [sp, #0x24]
        ldr     r8, [sp, #0x10]
        mov     r1, r1, lsl #2
        add     r6, r1, #0x20
        ldr     r1, [sp, #0x18]
        ldrb    r9, [r4, +r7]
        ldrsh   r8, [r8, +r6]
        add     r7, r7, r4
        ldrsh   r10, [r1, +r6]
        ldr     r1, [sp, #0x14]
        ldrsh   r1, [r1, +r6]
        str     r8, [sp, #0x38]
        ldr     r8, [sp, #0xC]
        add     r10, r0, r10
        add     r1, r0, r1
        ldrsh   r8, [r8, +r6]
        str     r8, [sp, #0x30]
        ldrb    r11, [r7, #2]
        ldrb    r8, [r7, #1]
        str     r11, [sp, #0x2C]
        ldrb    r7, [r7, #3]
        mov     r11, r9, lsl #1
        str     r11, [sp, #0x20]
        ldrh    r11, [r2, +r11]
        str     r11, [sp, #0x28]
        ldr     r11, [sp, #0x38]
        add     r11, r0, r11
        str     r11, [sp, #0x34]
        ldr     r11, [sp, #0x28]
        cmp     r10, r11
        ldr     r11, [sp, #0x30]
        add     r11, r0, r11
        str     r11, [sp, #0x30]
        bge     LANH5
        ldrh    r11, [r6, +r3]
        add     r9, r12, r9
        str     r9, [sp, #0x28]
        str     r11, [sp, #0x38]
        ldr     r9, [sp, #0x38]
        ldr     r11, [sp, #0x28]
        orr     r9, r9, r5
        str     r9, [lr, +r11, lsl #2]
        ldr     r9, [sp, #0x20]
        strh    r10, [r2, +r9]
LANH5:
        mov     r9, r8, lsl #1
        str     r9, [sp, #0x20]
        ldrh    r9, [r2, +r9]
        cmp     r1, r9
        bge     LANH6
        add     r9, r3, #8
        ldrh    r9, [r6, +r9]
        add     r8, r12, r8
        orr     r9, r9, r5
        str     r9, [lr, +r8, lsl #2]
        ldr     r8, [sp, #0x20]
        strh    r1, [r2, +r8]
LANH6:
        ldr     r1, [sp, #0x2C]
        ldr     r8, [sp, #0x34]
        mov     r1, r1, lsl #1
        ldrh    r9, [r2, +r1]
        cmp     r8, r9
        bge     LANH7
        add     r8, r3, #0x10
        ldrh    r8, [r6, +r8]
        ldr     r9, [sp, #0x2C]
        orr     r8, r8, r5
        add     r9, r12, r9
        str     r8, [lr, +r9, lsl #2]
        ldr     r8, [sp, #0x34]
        strh    r8, [r2, +r1]
LANH7:
        mov     r1, r7, lsl #1
        ldrh    r9, [r2, +r1]
        ldr     r8, [sp, #0x30]
        cmp     r8, r9
        bge     LANH8
        add     r8, r3, #0x18
        ldrh    r6, [r6, +r8]
        add     r7, r12, r7
        orr     r6, r6, r5
        str     r6, [lr, +r7, lsl #2]
        ldr     r6, [sp, #0x30]
        strh    r6, [r2, +r1]
LANH8:
        ldr     r1, [sp, #8]
        add     r4, r4, #4
        cmp     r1, #0x20
        beq     LANH17
        ldr     r1, [sp, #0x1C]
        ldr     r8, [sp, #0x18]
        ldr     r6, [sp, #0x24]
        mov     r1, r1, lsl #2
        add     r1, r1, #0x40
        ldrsh   r9, [r8, +r1]
        ldr     r10, [sp, #0x10]
        ldr     r8, [sp, #0x14]
        ldrb    r7, [r4, +r6]
        add     r6, r6, r4
        ldrsh   r10, [r10, +r1]
        ldrsh   r8, [r8, +r1]
        add     r9, r0, r9
        str     r10, [sp, #0x38]
        ldr     r10, [sp, #0xC]
        ldrsh   r10, [r10, +r1]
        str     r10, [sp, #0x2C]
        ldrb    r10, [r6, #1]
        str     r10, [sp, #0x34]
        ldrb    r10, [r6, #2]
        str     r10, [sp, #0x30]
        ldrb    r10, [r6, #3]
        str     r10, [sp, #0x28]
        mov     r10, r7, lsl #1
        str     r10, [sp, #0x20]
        ldrh    r10, [r2, +r10]
        str     r10, [sp, #0x3C]
        ldr     r11, [sp, #0x3C]
        add     r10, r0, r8
        ldr     r8, [sp, #0x38]
        cmp     r9, r11
        ldr     r11, [sp, #0x2C]
        add     r8, r0, r8
        add     r11, r0, r11
        str     r11, [sp, #0x2C]
        bge     LANH9
        ldrh    r11, [r1, +r3]
        add     r7, r12, r7
        str     r7, [sp, #0x38]
        str     r11, [sp, #0x3C]
        ldr     r7, [sp, #0x3C]
        ldr     r11, [sp, #0x38]
        orr     r7, r7, r5
        str     r7, [lr, +r11, lsl #2]
        ldr     r7, [sp, #0x20]
        strh    r9, [r2, +r7]
LANH9:
        ldr     r7, [sp, #0x34]
        mov     r7, r7, lsl #1
        str     r7, [sp, #0x20]
        ldrh    r7, [r2, +r7]
        cmp     r10, r7
        bge     LANH10
        add     r7, r3, #8
        ldrh    r7, [r1, +r7]
        ldr     r9, [sp, #0x34]
        orr     r7, r7, r5
        add     r9, r12, r9
        str     r7, [lr, +r9, lsl #2]
        ldr     r7, [sp, #0x20]
        strh    r10, [r2, +r7]
LANH10:
        ldr     r7, [sp, #0x30]
        mov     r7, r7, lsl #1
        ldrh    r9, [r2, +r7]
        cmp     r8, r9
        bge     LANH11
        add     r9, r3, #0x10
        ldrh    r9, [r1, +r9]
        ldr     r10, [sp, #0x30]
        orr     r9, r9, r5
        add     r10, r12, r10
        str     r9, [lr, +r10, lsl #2]
        strh    r8, [r2, +r7]
LANH11:
        ldr     r7, [sp, #0x28]
        ldr     r8, [sp, #0x2C]
        mov     r7, r7, lsl #1
        ldrh    r9, [r2, +r7]
        cmp     r8, r9
        bge     LANH12
        add     r8, r3, #0x18
        ldrh    r8, [r1, +r8]
        ldr     r1, [sp, #0x28]
        orr     r8, r8, r5
        add     r1, r12, r1
        str     r8, [lr, +r1, lsl #2]
        ldr     r1, [sp, #0x2C]
        strh    r1, [r2, +r7]
LANH12:
        ldrb    r8, [r6, #5]
        ldrb    r1, [r6, #4]
        ldr     r7, [sp, #0x1C]
        str     r8, [sp, #0x30]
        ldrb    r8, [r6, #6]
        ldr     r10, [sp, #0x10]
        add     r7, r7, #0x18
        str     r8, [sp, #0x2C]
        ldrb    r8, [r6, #7]
        ldr     r6, [sp, #0x18]
        mov     r7, r7, lsl #2
        ldrsh   r10, [r10, +r7]
        ldrsh   r9, [r6, +r7]
        ldr     r6, [sp, #0x14]
        add     r9, r0, r9
        ldrsh   r6, [r6, +r7]
        str     r10, [sp, #0x3C]
        ldr     r10, [sp, #0xC]
        ldrsh   r10, [r10, +r7]
        str     r10, [sp, #0x38]
        mov     r10, r1, lsl #1
        str     r10, [sp, #0x1C]
        ldrh    r10, [r2, +r10]
        str     r10, [sp, #0x34]
        ldr     r11, [sp, #0x34]
        add     r10, r0, r6
        ldr     r6, [sp, #0x3C]
        cmp     r9, r11
        ldr     r11, [sp, #0x38]
        add     r6, r0, r6
        add     r0, r0, r11
        bge     LANH13
        ldrh    r11, [r3, +r7]
        add     r1, r12, r1
        str     r1, [sp, #0x38]
        str     r11, [sp, #0x3C]
        ldr     r1, [sp, #0x3C]
        ldr     r11, [sp, #0x38]
        orr     r1, r1, r5
        str     r1, [lr, +r11, lsl #2]
        ldr     r1, [sp, #0x1C]
        strh    r9, [r2, +r1]
LANH13:
        ldr     r1, [sp, #0x30]
        mov     r1, r1, lsl #1
        str     r1, [sp, #0x20]
        ldrh    r1, [r2, +r1]
        cmp     r10, r1
        bge     LANH14
        add     r1, r3, #8
        ldrh    r1, [r1, +r7]
        ldr     r9, [sp, #0x30]
        orr     r1, r1, r5
        add     r9, r12, r9
        str     r1, [lr, +r9, lsl #2]
        ldr     r1, [sp, #0x20]
        strh    r10, [r2, +r1]
LANH14:
        ldr     r1, [sp, #0x2C]
        mov     r1, r1, lsl #1
        ldrh    r9, [r2, +r1]
        cmp     r6, r9
        bge     LANH15
        add     r9, r3, #0x10
        ldrh    r9, [r9, +r7]
        ldr     r10, [sp, #0x2C]
        orr     r9, r9, r5
        add     r10, r12, r10
        str     r9, [lr, +r10, lsl #2]
        strh    r6, [r2, +r1]
LANH15:
        mov     r1, r8, lsl #1
        ldrh    r6, [r2, +r1]
        cmp     r0, r6
        bge     LANH16
        add     r6, r3, #0x18
        ldrh    r7, [r6, +r7]
        add     r8, r12, r8
        orr     r7, r7, r5
        str     r7, [lr, +r8, lsl #2]
        strh    r0, [r2, +r1]
LANH16:
        add     r4, r4, #8
LANH17:
        ldr     r0, [sp, #4]
        ldr     r1, [sp, #8]
        add     r5, r5, #1, 16
        add     r0, r0, #1
        str     r0, [sp, #4]
        cmp     r0, r1
        blt     LANH0
LANH18:
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LANH19:
        mvn     r0, #7
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}


