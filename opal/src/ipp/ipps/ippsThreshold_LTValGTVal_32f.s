        .text
        .align  4
        .globl  _ippsThreshold_LTValGTVal_32f


_ippsThreshold_LTValGTVal_32f:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r11, [sp, #0x24]
        ldr     r4, [sp, #0x28]
        ldr     r10, [sp, #0x2C]
        mov     r7, r0
        cmp     r7, #0
        mov     r9, r1
        mov     r8, r2
        mov     r5, r3
        beq     LAPP4
        cmp     r9, #0
        beq     LAPP4
        cmp     r8, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        mov     r0, r4
        mov     r1, r5
        bl      __ltsf2
        cmp     r0, #0
        mvnlt   r0, #0x11
        ldmltia sp!, {r4 - r11, pc}
        cmp     r8, #0
        ble     LAPP3
LAPP0:
        ldr     r6, [r7], #4
        mov     r1, r5
        mov     r0, r6
        bl      __gesf2
        cmp     r0, #0
        blt     LAPP1
        mov     r0, r6
        mov     r1, r4
        bl      __lesf2
        cmp     r0, #0
        strle   r6, [r9]
        ble     LAPP2
LAPP1:
        mov     r0, r6
        mov     r1, r4
        bl      __lesf2
        cmp     r0, #0
        movgt   r12, r10
        movle   r12, r11
        str     r12, [r9]
LAPP2:
        subs    r8, r8, #1
        add     r9, r9, #4
        bne     LAPP0
LAPP3:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAPP4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


