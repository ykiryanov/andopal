        .text
        .align  4
        .globl  _ippsConvert_64f32f


_ippsConvert_64f32f:
        stmdb   sp!, {r4 - r11, lr}
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        mov     r9, r2
        beq     LCWX3
        cmp     r7, #0
        beq     LCWX3
        cmp     r9, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r9, #0
        ble     LCWX2
        ldr     r11, [pc, #0x88]
        ldr     r10, [pc, #0x88]
        mvn     r3, #0x81, 12
        bic     r6, r3, #0xB, 4
LCWX0:
        ldr     r4, [r8]
        ldr     r5, [r8, #4]
        sub     r3, r6, #2, 2
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0xE, 4
        bl      __ledf2
        cmp     r0, #0
        ldrle   r12, [r11]
        strle   r12, [r7]
        ble     LCWX1
        mov     r0, r4
        mov     r1, r5
        mov     r3, r6
        mov     r2, #0xE, 4
        bl      __gedf2
        cmp     r0, #0
        ldrge   r12, [r10]
        strge   r12, [r7]
        bge     LCWX1
        mov     r0, r4
        mov     r1, r5
        bl      __truncdfsf2
        str     r0, [r7]
LCWX1:
        subs    r9, r9, #1
        add     r8, r8, #8
        add     r7, r7, #4
        bne     LCWX0
LCWX2:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LCWX3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}
        .long   LCWX__2il0floatpacket.2
        .long   LCWX__2il0floatpacket.1


        .data
        .align  4


LCWX__2il0floatpacket.1:
        .byte   0xFF,0xFF,0x7F,0x7F
LCWX__2il0floatpacket.2:
        .byte   0xFF,0xFF,0x7F,0xFF


