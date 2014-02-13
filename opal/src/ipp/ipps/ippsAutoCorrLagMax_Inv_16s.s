        .text
        .align  4
        .globl  _ippsAutoCorrLagMax_Inv_16s


_ippsAutoCorrLagMax_Inv_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     lr, [sp, #0x40]
        ldr     r12, [sp, #0x44]
        cmp     r0, #0
        beq     LDQV8
        cmp     lr, #0
        beq     LDQV8
        cmp     r12, #0
        beq     LDQV8
        cmp     r1, #0
        ble     LDQV6
        cmp     r2, r3
        mov     r7, #2, 2
        movgt   r4, #0
        bgt     LDQV5
        mov     r6, r7
        mov     r4, #0
        sub     r5, r1, #5
        str     r7, [sp, #8]
        str     r12, [sp, #4]
        str     lr, [sp]
LDQV0:
        cmp     r1, #0
        movle   lr, #0
        ble     LDQV4
        cmp     r1, #5
        blt     LDQV7
        rsb     r12, r2, #0
        mov     lr, #0
        add     r12, r0, r12, lsl #1
        mov     r9, lr
        mov     r8, r12
        mov     r7, r0
        str     r3, [sp, #0xC]
        str     r2, [sp, #0x10]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
LDQV1:
        ldrsh   r10, [r7]
        ldrsh   r3, [r8]
        ldrsh   r1, [r8, #2]
        ldrsh   r2, [r7, #2]
        ldrsh   r0, [r8, #4]
        mla     r11, r10, r3, lr
        ldrsh   r10, [r7, #4]
        ldrsh   r3, [r8, #6]
        ldrsh   lr, [r7, #6]
        add     r8, r8, #8
        mla     r11, r2, r1, r11
        add     r7, r7, #8
        add     r9, r9, #4
        cmp     r9, r5
        mla     r11, r10, r0, r11
        mla     lr, lr, r3, r11
        ble     LDQV1
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x18]
LDQV2:
        mov     r8, r9, lsl #1
        add     r7, r0, r9, lsl #1
LDQV3:
        ldrsh   r11, [r12, +r8]
        ldrsh   r10, [r7], #2
        add     r9, r9, #1
        cmp     r9, r1
        mla     lr, r10, r11, lr
        add     r8, r8, #2
        blt     LDQV3
LDQV4:
        cmp     lr, r6
        movgt   r6, lr
        movgt   r4, r2
        add     r2, r2, #1
        cmp     r2, r3
        ble     LDQV0
        ldr     r7, [sp, #8]
        ldr     r12, [sp, #4]
        ldr     lr, [sp]
        cmn     r6, #7, 2
        mvngt   r7, #2, 2
        bgt     LDQV5
        cmp     r6, #3, 2
        movge   r7, r6, lsl #1
LDQV5:
        str     r4, [r12]
        mov     r0, #0
        str     r7, [lr]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDQV6:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDQV7:
        rsb     r12, r2, #0
        mov     lr, #0
        add     r12, r0, r12, lsl #1
        mov     r9, lr
        b       LDQV2
LDQV8:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


