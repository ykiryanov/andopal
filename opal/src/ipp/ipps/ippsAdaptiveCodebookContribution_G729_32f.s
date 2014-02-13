        .text
        .align  4
        .globl  _ippsAdaptiveCodebookContribution_G729_32f


_ippsAdaptiveCodebookContribution_G729_32f:
        stmdb   sp!, {r4 - r9, lr}
        cmp     r1, #0
        mov     r4, r0
        beq     LDHU1
        cmp     r2, #0
        beq     LDHU1
        cmp     r3, #0
        beq     LDHU1
        add     r7, r2, #4
        add     r6, r1, #4
        add     r5, r3, #4
        mov     r8, #0
LDHU0:
        ldr     r0, [r6, #-4]
        ldr     r9, [r7, #-4]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        str     r0, [r5, #-4]
        ldr     r0, [r6]
        ldr     r9, [r7]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        str     r0, [r5]
        ldr     r0, [r6, #4]
        ldr     r9, [r7, #4]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        str     r0, [r5, #4]
        ldr     r0, [r6, #8]
        ldr     r9, [r7, #8]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        add     r8, r8, #4
        str     r0, [r5, #8]
        cmp     r8, #0x28
        add     r7, r7, #0x10
        add     r6, r6, #0x10
        add     r5, r5, #0x10
        blt     LDHU0
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LDHU1:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


