        .text
        .align  4
        .globl  _ippsIIRSetTaps32s_16s32f


_ippsIIRSetTaps32s_16s32f:
        stmdb   sp!, {r4, r5, lr}
        mov     r4, r1
        cmp     r4, #0
        beq     LBNV3
        cmp     r0, #0
        beq     LBNV3
        ldr     r2, [r4]
        ldr     r5, [pc, #0x88]
        cmp     r5, r2
        beq     LBNV0
        add     r3, r5, #0xF7
        cmp     r3, r2
        mvnne   r0, #0x10
        ldmneia sp!, {r4, r5, pc}
LBNV0:
        cmp     r5, r2
        subeq   r2, r5, #4
        streq   r2, [r4]
        beq     LBNV1
        add     r3, r5, #0xF7
        cmp     r3, r2
        subeq   r2, r5, #3
        streq   r2, [r4]
LBNV1:
        mov     r1, r4
        bl      _ippsIIRSetTaps32f_16s
        cmp     r0, #0
        ldmneia sp!, {r4, r5, pc}
        ldr     r0, [r4]
        sub     r2, r5, #4
        cmp     r2, r0
        beq     LBNV2
        sub     r2, r5, #3
        cmp     r2, r0
        movne   r0, #0
        ldmneia sp!, {r4, r5, pc}
        add     r5, r5, #0xF7
        str     r5, [r4]
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LBNV2:
        str     r5, [r4]
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LBNV3:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}
        .long   0x49493039


