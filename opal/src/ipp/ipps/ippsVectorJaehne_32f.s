        .text
        .align  4
        .globl  _ippsVectorJaehne_32f


_ippsVectorJaehne_32f:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r9, r0
        cmp     r9, #0
        mov     r10, r1
        mov     r4, r2
        beq     LBME4
        cmp     r10, #0
        ble     LBME5
        ldr     r3, [pc, #0xE4]
        mov     r0, r4
        ldr     r5, [r3]
        mov     r1, r5
        bl      __ltsf2
        cmp     r0, #0
        blt     LBME2
        cmp     r10, #1
        beq     LBME3
        mov     r0, r10
        bl      __floatsidf
        ldr     r6, [pc, #0xBC]
        ldr     r5, [pc, #0xBC]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r6
        mov     r1, r5
        bl      __divdf3
        cmp     r10, #0
        mov     r7, r0
        mov     r6, r1
        ble     LBME1
        mov     r0, r4
        bl      __extendsfdf2
        mov     r5, r0
        mov     r4, r1
        mov     r8, #0
        str     r10, [sp]
LBME0:
        mov     r0, r8
        bl      __floatsidf
        mov     r11, r0
        mov     r10, r1
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        bl      sin
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9], #4
        ldr     r12, [sp]
        add     r8, r8, #1
        cmp     r8, r12
        blt     LBME0
LBME1:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBME2:
        mvn     r0, #0x25
        ldmia   sp!, {r1, r4 - r11, pc}
LBME3:
        str     r5, [r9]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBME4:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LBME5:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
        .long   LBME__2il0floatpacket.1
        .long   0x54442d18
        .long   0x3ff921fb


        .data
        .align  4


LBME__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


