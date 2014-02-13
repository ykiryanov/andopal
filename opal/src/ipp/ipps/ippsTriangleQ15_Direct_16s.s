        .text
        .align  4
        .globl  _ippsTriangleQ15_Direct_16s


_ippsTriangleQ15_Direct_16s:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #0xC
        ldr     r9, [sp, #0x2C]
        ldr     r10, [sp, #0x30]
        mov     r6, r0
        cmp     r6, #0
        mov     r7, r1
        mov     r8, r2
        mov     r0, r3
        beq     LANM6
        cmp     r7, #0
        ble     LANM5
        cmp     r8, #0
        ble     LANM4
        cmp     r0, #0
        blt     LANM3
        mov     r12, #0xFF
        orr     r12, r12, #0x3F, 24
        cmp     r12, r0
        blt     LANM3
        cmp     r9, #0
        blt     LANM2
        ldr     lr, [pc, #0xCC]
        cmp     r9, lr, lsl #1
        bgt     LANM2
        rsb     r12, lr, #0
        cmp     r12, r10
        bgt     LANM0
        cmp     lr, r10
        bge     LANM1
LANM0:
        mvn     r0, #0x27
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LANM1:
        ldr     r12, [pc, #0xA4]
        ldr     r4, [r12]
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r5, r0
        mov     r0, r9
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        str     r1, [sp, #8]
        mov     r0, r10
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        add     r12, sp, #8
        str     r0, [sp]
        str     r12, [sp, #4]
        mov     r0, r6
        mov     r3, r5
        mov     r2, r8
        mov     r1, r7
        bl      _ippsTriangle_Direct_16s
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LANM2:
        mvn     r0, #0x28
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LANM3:
        mvn     r0, #0x29
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LANM4:
        mvn     r0, #0x2A
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LANM5:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LANM6:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
        .long   0x0001921f
        .long   LANM__2il0floatpacket.1


        .data
        .align  4


LANM__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x38


