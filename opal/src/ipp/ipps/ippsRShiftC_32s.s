        .text
        .align  4
        .globl  _ippsRShiftC_32s


_ippsRShiftC_32s:
        stmdb   sp!, {r4 - r7, lr}
        mov     r4, r1
        mov     r1, r2
        cmp     r4, #0
        mov     r2, r3
        ldmeqia sp!, {r4 - r7, lr}
        beq     _ippsCopy_32s
        cmp     r0, #0
        beq     LAYD5
        cmp     r1, #0
        beq     LAYD5
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r4, #0
        mvnlt   r0, #0x1F
        ldmltia sp!, {r4 - r7, pc}
        cmp     r4, #0x1F
        mov     r6, #0
        bgt     LAYD3
        cmp     r2, #6
        blt     LAYD1
        sub     r5, r2, #6
        add     lr, r0, #4
        add     r12, r1, #4
LAYD0:
        ldr     r7, [lr, #-4]
        add     r6, r6, #5
        cmp     r6, r5
        mov     r7, r7, asr r4
        str     r7, [r12, #-4]
        ldr     r7, [lr]
        mov     r7, r7, asr r4
        str     r7, [r12]
        ldr     r7, [lr, #4]
        mov     r7, r7, asr r4
        str     r7, [r12, #4]
        ldr     r7, [lr, #8]
        mov     r7, r7, asr r4
        str     r7, [r12, #8]
        ldr     r7, [lr, #0xC]
        add     lr, lr, #0x14
        mov     r7, r7, asr r4
        str     r7, [r12, #0xC]
        add     r12, r12, #0x14
        ble     LAYD0
LAYD1:
        add     r0, r0, r6, lsl #2
        add     r1, r1, r6, lsl #2
LAYD2:
        ldr     r12, [r0], #4
        add     r6, r6, #1
        mov     r12, r12, asr r4
        str     r12, [r1], #4
        cmp     r6, r2
        blt     LAYD2
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LAYD3:
        mvn     lr, #0
        mov     r12, r6
LAYD4:
        ldr     r4, [r0], #4
        cmp     r4, #0
        movlt   r4, lr
        movge   r4, r6
        add     r12, r12, #1
        str     r4, [r1], #4
        cmp     r12, r2
        blt     LAYD4
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LAYD5:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


