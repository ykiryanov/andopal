        .text
        .align  4
        .globl  _ippsThreshold_32fc_I


_ippsThreshold_32fc_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        mov     r6, r2
        mov     r4, r3
        beq     LARM6
        cmp     r7, #0
        ble     LARM7
        ldr     r12, [pc, #0x1D4]
        mov     r0, r6
        ldr     r1, [r12]
        bl      __ltsf2
        cmp     r0, #0
        blt     LARM2
        mov     r0, r6
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        cmp     r4, #4
        mov     r5, r0
        mov     r4, r1
        mov     r9, #0
        beq     LARM3
        str     r6, [sp, #4]
LARM0:
        ldr     r0, [r8, #4]
        str     r0, [sp]
        mov     r1, r0
        bl      __mulsf3
        ldr     r6, [r8]
        mov     r10, r0
        mov     r0, r6
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        bl      __extendsfdf2
        mov     r11, r0
        mov     r10, r1
        mov     r2, r5
        mov     r3, r4
        bl      __ltdf2
        cmp     r0, #0
        bge     LARM1
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        ldreq   r12, [sp, #4]
        streq   r12, [r8]
        beq     LARM1
        mov     r2, r11
        mov     r3, r10
        mov     r0, r5
        mov     r1, r4
        bl      __divdf3
        bl      sqrt
        bl      __truncdfsf2
        mov     r10, r0
        mov     r1, r6
        bl      __mulsf3
        str     r0, [r8]
        ldr     r0, [sp]
        mov     r1, r10
        bl      __mulsf3
        str     r0, [r8, #4]
LARM1:
        add     r9, r9, #1
        cmp     r9, r7
        add     r8, r8, #8
        blt     LARM0
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LARM2:
        mvn     r0, #0x12
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LARM3:
        str     r7, [sp, #8]
LARM4:
        ldr     r11, [r8, #4]
        mov     r1, r11
        mov     r0, r11
        bl      __mulsf3
        ldr     r10, [r8]
        mov     r6, r0
        mov     r0, r10
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        bl      __extendsfdf2
        mov     r7, r0
        mov     r6, r1
        mov     r2, r5
        mov     r3, r4
        bl      __gtdf2
        cmp     r0, #0
        ble     LARM5
        mov     r0, r5
        mov     r2, r7
        mov     r3, r6
        mov     r1, r4
        bl      __divdf3
        bl      sqrt
        bl      __truncdfsf2
        mov     r6, r0
        mov     r1, r10
        bl      __mulsf3
        str     r0, [r8]
        mov     r0, r11
        mov     r1, r6
        bl      __mulsf3
        str     r0, [r8, #4]
LARM5:
        ldr     r12, [sp, #8]
        add     r9, r9, #1
        add     r8, r8, #8
        cmp     r9, r12
        blt     LARM4
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LARM6:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LARM7:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   LARM__2il0floatpacket.1


        .data
        .align  4


LARM__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


