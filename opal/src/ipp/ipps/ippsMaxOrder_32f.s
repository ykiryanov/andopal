        .text
        .align  4
        .globl  _ippsMaxOrder_32f


_ippsMaxOrder_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r7, r1
        cmp     r7, #0
        mov     r6, r0
        mov     r11, r2
        ble     LBIE6
        cmp     r6, #0
        beq     LBIE5
        cmp     r11, #0
        beq     LBIE5
        ldr     r3, [pc, #0xFC]
        cmp     r7, #0
        mov     r10, #0
        ldr     r5, [r3]
        mov     r4, r5
        movle   r9, #0
        ble     LBIE4
        mvn     r3, #2, 10
        bic     r8, r3, #2, 2
        mov     r9, #0
        str     r11, [sp]
LBIE0:
        ldr     r12, [r6], #4
        str     r12, [sp, #4]
        mov     r12, r12, lsr #24
        and     r12, r12, #0x7F
        strb    r12, [sp, #7]
        ldr     r2, [sp, #4]
        cmp     r8, r2
        ldrcs   r11, [sp, #4]
        movcc   r11, r5
        movcc   r9, #2
        mov     r0, r11
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        movgt   r4, r11
        subs    r7, r7, #1
        bne     LBIE0
        ldr     r11, [sp]
        mov     r0, r4
        mov     r1, r5
        bl      __nesf2
        cmp     r0, #0
        beq     LBIE4
        ldr     r3, [pc, #0x78]
        mov     r0, r4
        ldr     r1, [r3]
        bl      __ltsf2
        cmp     r0, #0
        bge     LBIE1
        mvn     r0, #0x7D
        str     r0, [r11]
        mov     r0, #9
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBIE1:
        mov     r0, r4
        bl      __extendsfdf2
        mov     r2, r11
        bl      frexp
LBIE2:
        cmp     r9, #0
        bne     LBIE3
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBIE3:
        mov     r0, #9
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBIE4:
        str     r10, [r11]
        b       LBIE2
LBIE5:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBIE6:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   LBIE__2il0floatpacket.1
        .long   LBIE__2il0floatpacket.2


        .data
        .align  4


LBIE__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LBIE__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x00


