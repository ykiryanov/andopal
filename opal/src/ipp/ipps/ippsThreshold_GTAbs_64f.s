        .text
        .align  4
        .globl  _ippsThreshold_GTAbs_64f


_ippsThreshold_GTAbs_64f:
        mov     r12, sp
        stmdb   sp!, {r3}
        stmdb   sp!, {r4 - r12, lr}
        sub     r11, r12, #4
        ldr     r5, [r11, #4]
        mov     r7, r0
        cmp     r7, #0
        mov     r9, r1
        mov     r8, r2
        mov     r4, r3
        beq     LARB3
        cmp     r9, #0
        beq     LARB3
        cmp     r8, #0
        mvnle   r0, #5
        ldmledb r11, {r4 - r11, sp, pc}
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        mvnlt   r0, #0x12
        ldmltdb r11, {r4 - r11, sp, pc}
        cmp     r8, #0
        ble     LARB2
LARB0:
        ldr     r10, [r7, #4]
        ldr     r6, [r7]
        mov     r2, r4
        bic     r1, r10, #2, 2
        mov     r3, r5
        mov     r0, r6
        bl      __ledf2
        cmp     r0, #0
        strle   r6, [r9]
        strle   r10, [r9, #4]
        ble     LARB1
        mov     r0, r6
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        eorlt   r12, r5, #2, 2
        movge   r12, r5
        str     r12, [r9, #4]
        str     r4, [r9]
LARB1:
        subs    r8, r8, #1
        add     r9, r9, #8
        add     r7, r7, #8
        bne     LARB0
LARB2:
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LARB3:
        mvn     r0, #7
        ldmdb   r11, {r4 - r11, sp, pc}


