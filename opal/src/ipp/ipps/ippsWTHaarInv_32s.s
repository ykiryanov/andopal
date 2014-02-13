        .text
        .align  4
        .globl  _ippsWTHaarInv_32s


_ippsWTHaarInv_32s:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r0, #0
        beq     LAJE6
        cmp     r1, #0
        beq     LAJE6
        cmp     r2, #0
        beq     LAJE6
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        sub     r5, r3, #1
        cmp     r5, #0
        mov     r7, #0
        movle   r6, r7
        ble     LAJE5
        mov     r6, r7
        add     r4, r2, #4
        mov     r12, r0
        mov     lr, r2
LAJE0:
        ldr     r8, [r12], #4
        ldr     r11, [r1], #4
        subs    r10, r8, r11
        add     r9, r8, r11
        ble     LAJE1
        cmp     r10, #0
        mvnlt   r10, #2, 2
        b       LAJE2
LAJE1:
        cmp     r10, #0
        movgt   r10, #2, 2
LAJE2:
        rsb     r11, r11, #0
        sub     r11, r11, #1
        cmp     r8, r11
        bgt     LAJE3
        cmp     r9, #0
        movge   r9, #2, 2
        b       LAJE4
LAJE3:
        cmp     r9, #0
        mvnlt   r9, #2, 2
LAJE4:
        str     r10, [lr], #8
        add     r7, r7, #2
        str     r9, [r4], #8
        cmp     r7, r5
        add     r6, r6, #1
        blt     LAJE0
LAJE5:
        tst     r3, #1
        ldrne   r6, [r0, +r6, lsl #2]
        strne   r6, [r2, +r7, lsl #2]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAJE6:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


