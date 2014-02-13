        .text
        .align  4
        .globl  Arctan2


Arctan2:
        stmdb   sp!, {r1, r4 - r11, lr}
        ldr     r2, [pc, #0x16C]
        mov     r9, r1
        mov     r10, r0
        ldr     r4, [r2]
        mov     r0, r9
        mov     r1, r4
        bl      __eqsf2
        cmp     r0, #0
        beq     LBBC4
LBBC0:
        mov     r0, r10
        bl      __extendsfdf2
        ldr     r5, [pc, #0x144]
        ldr     r6, [pc, #0x144]
        mov     r2, r0
        bic     r3, r1, #2, 2
        mov     r0, r5
        mov     r1, r6
        bl      __adddf3
        mov     r8, r0
        mov     r0, r9
        mov     r7, r1
        bl      __extendsfdf2
        mov     r6, r0
        mov     r5, r1
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp]
        mov     r11, r1
        mov     r0, r9
        mov     r1, r4
        bl      __gesf2
        cmp     r0, #0
        blt     LBBC1
        mov     r0, r6
        mov     r1, r5
        mov     r2, r8
        mov     r3, r7
        bl      __subdf3
        ldr     r2, [sp]
        mov     r3, r11
        bl      __divdf3
        ldr     r5, [pc, #0xD0]
        ldr     r6, [pc, #0xD0]
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r6
        bl      __subdf3
        bl      __truncdfsf2
        mov     r5, r0
        b       LBBC2
LBBC1:
        mov     r0, r8
        mov     r1, r7
        mov     r2, r6
        mov     r3, r5
        bl      __subdf3
        mov     r2, r0
        ldr     r0, [sp]
        mov     r3, r1
        mov     r1, r11
        bl      __divdf3
        ldr     r2, [pc, #0x74]
        ldr     r3, [pc, #0x74]
        bl      __muldf3
        ldr     r5, [pc, #0x70]
        ldr     r6, [pc, #0x70]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r6
        bl      __subdf3
        bl      __truncdfsf2
        mov     r5, r0
LBBC2:
        mov     r0, r10
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        bge     LBBC3
        eor     r0, r5, #2, 2
        ldmia   sp!, {r1, r4 - r11, pc}
LBBC3:
        mov     r0, r5
        ldmia   sp!, {r1, r4 - r11, pc}
LBBC4:
        mov     r0, r10
        mov     r1, r4
        bl      __eqsf2
        cmp     r0, #0
        bne     LBBC0
        mov     r0, r4
        ldmia   sp!, {r1, r4 - r11, pc}
        .long   LBBC__2il0floatpacket.1
        .long   0xd9d7bdbb
        .long   0x3ddb7cdf
        .long   0x54442d18
        .long   0x3fe921fb
        .long   0x7f3321d2
        .long   0x4002d97c


        .data
        .align  4


LBBC__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


