        .text
        .align  4
        .globl  _ippsAutoCorrLagMax_Fwd_16s


_ippsAutoCorrLagMax_Fwd_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r6, [sp, #0x40]
        ldr     r12, [sp, #0x44]
        cmp     r0, #0
        beq     LDQW8
        cmp     r6, #0
        beq     LDQW8
        cmp     r12, #0
        beq     LDQW8
        cmp     r1, #0
        ble     LDQW6
        cmp     r2, r3
        mov     r7, #2, 2
        movgt   lr, #0
        bgt     LDQW5
        mov     r5, r7
        mov     lr, #0
        sub     r4, r1, #5
        str     r7, [sp, #8]
        str     r12, [sp, #4]
        str     r6, [sp]
LDQW0:
        cmp     r1, #0
        movle   r12, #0
        ble     LDQW4
        cmp     r1, #5
        blt     LDQW7
        mov     r12, #0
        add     r8, r0, r2, lsl #1
        mov     r9, r12
        mov     r7, r8
        mov     r6, r0
        str     r3, [sp, #0xC]
        str     r2, [sp, #0x10]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
LDQW1:
        ldrsh   r10, [r6]
        ldrsh   r3, [r7]
        ldrsh   r1, [r7, #2]
        ldrsh   r2, [r6, #2]
        ldrsh   r0, [r7, #4]
        mla     r11, r10, r3, r12
        ldrsh   r10, [r6, #4]
        ldrsh   r3, [r7, #6]
        ldrsh   r12, [r6, #6]
        add     r7, r7, #8
        mla     r11, r2, r1, r11
        add     r6, r6, #8
        add     r9, r9, #4
        cmp     r9, r4
        mla     r11, r10, r0, r11
        mla     r12, r12, r3, r11
        ble     LDQW1
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x18]
LDQW2:
        mov     r7, r9, lsl #1
        add     r6, r0, r9, lsl #1
LDQW3:
        ldrsh   r11, [r8, +r7]
        ldrsh   r10, [r6], #2
        add     r9, r9, #1
        cmp     r9, r1
        mla     r12, r10, r11, r12
        add     r7, r7, #2
        blt     LDQW3
LDQW4:
        cmp     r12, r5
        movgt   r5, r12
        movgt   lr, r2
        add     r2, r2, #1
        cmp     r2, r3
        ble     LDQW0
        ldr     r7, [sp, #8]
        ldr     r12, [sp, #4]
        ldr     r6, [sp]
        cmn     r5, #7, 2
        mvngt   r7, #2, 2
        bgt     LDQW5
        cmp     r5, #3, 2
        movge   r7, r5, lsl #1
LDQW5:
        str     lr, [r12]
        mov     r0, #0
        str     r7, [r6]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDQW6:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDQW7:
        mov     r12, #0
        mov     r9, r12
        add     r8, r0, r2, lsl #1
        b       LDQW2
LDQW8:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


