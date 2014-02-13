        .text
        .align  4
        .globl  ownsDecodePulseData_AAC


ownsDecodePulseData_AAC:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r8, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        mov     r5, r0
        mov     r4, r1
        mov     r6, r2
        mov     r2, #2
        mov     r9, r3
        bl      ownsGetBits_AAC
        add     r0, r0, #1
        str     r0, [r6]
        mov     r0, r5
        mov     r2, #6
        mov     r1, r4
        bl      ownsGetBits_AAC
        cmp     r0, #0x33
        str     r0, [r9]
        mvngt   r0, #0x9F
        ldmgtia sp!, {r4 - r9, pc}
        ldr     r3, [r6]
        cmp     r3, #0
        ble     LGHM1
        mov     r9, #0
LGHM0:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #5
        bl      ownsGetBits_AAC
        str     r0, [r8], #4
        mov     r0, r5
        mov     r1, r4
        mov     r2, #4
        bl      ownsGetBits_AAC
        str     r0, [r7], #4
        ldr     r3, [r6]
        add     r9, r9, #1
        cmp     r9, r3
        blt     LGHM0
LGHM1:
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}


