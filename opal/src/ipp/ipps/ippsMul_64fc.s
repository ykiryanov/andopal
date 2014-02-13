        .text
        .align  4
        .globl  _ippsMul_64fc


_ippsMul_64fc:
        stmdb   sp!, {r4 - r11, lr}
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        beq     LBEC2
        cmp     r5, #0
        beq     LBEC2
        cmp     r4, #0
        beq     LBEC2
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r3, #0
        sub     r7, r3, #1
        beq     LBEC1
LBEC0:
        ldr     r0, [r6]
        ldr     r1, [r6, #4]
        ldr     r2, [r5]
        ldr     r3, [r5, #4]
        bl      __muldf3
        ldr     r2, [r6, #8]
        ldr     r10, [r6, #0xC]
        ldr     r11, [r5, #8]
        ldr     r3, [r5, #0xC]
        mov     r8, r0
        mov     r9, r1
        mov     r0, r2
        mov     r1, r10
        mov     r2, r11
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r8
        mov     r1, r9
        bl      __subdf3
        str     r0, [r4]
        str     r1, [r4, #4]
        ldr     r0, [r6]
        ldr     r1, [r6, #4]
        ldr     r2, [r5, #8]
        ldr     r3, [r5, #0xC]
        bl      __muldf3
        ldr     r2, [r6, #8]
        ldr     r3, [r5, #4]
        ldr     r10, [r6, #0xC]
        ldr     r11, [r5], #0x10
        mov     r8, r0
        mov     r0, r2
        mov     r9, r1
        mov     r1, r10
        mov     r2, r11
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        sub     r7, r7, #1
        str     r0, [r4, #8]
        str     r1, [r4, #0xC]
        cmn     r7, #1
        add     r6, r6, #0x10
        add     r4, r4, #0x10
        bne     LBEC0
LBEC1:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBEC2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


