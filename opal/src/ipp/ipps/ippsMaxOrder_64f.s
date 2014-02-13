        .text
        .align  4
        .globl  _ippsMaxOrder_64f


_ippsMaxOrder_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        mov     r7, r1
        cmp     r7, #0
        mov     r6, r0
        mov     r10, r2
        ble     LBIC7
        cmp     r6, #0
        beq     LBIC6
        cmp     r10, #0
        beq     LBIC6
        ldr     lr, [pc, #0x148]
        ldr     r3, [pc, #0x148]
        cmp     r7, #0
        ldr     lr, [lr]
        mov     r11, #0
        ldr     r3, [r3]
        str     lr, [sp, #4]
        movle   r9, #0
        ble     LBIC5
        str     r3, [sp, #8]
        mov     r9, #0
        mov     r5, r9
        mvn     r3, #1, 12
        bic     r8, r3, #2, 2
        mov     r4, r5
        str     r10, [sp]
LBIC0:
        ldr     lr, [r6]
        ldr     r12, [r6, #4]
        str     lr, [sp, #4]
        str     r12, [sp, #8]
        mov     r12, r12, lsr #24
        and     r12, r12, #0x7F
        strb    r12, [sp, #0xB]
        ldr     r12, [sp, #8]
        cmp     r8, r12
        ldrcs   r10, [sp, #4]
        ldrcs   r11, [sp, #8]
        bcs     LBIC1
        mov     r10, #0
        mov     r11, r10
        mov     r9, #2
LBIC1:
        mov     r0, r10
        mov     r2, r5
        mov     r3, r4
        mov     r1, r11
        bl      __gtdf2
        cmp     r0, #0
        add     r6, r6, #8
        movgt   r5, r10
        movgt   r4, r11
        subs    r7, r7, #1
        bne     LBIC0
        ldr     r10, [sp]
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        mov     r11, #0
        beq     LBIC5
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #1, 12
        bl      __ltdf2
        cmp     r0, #0
        bge     LBIC2
        sub     r11, r11, #3, 24
        sub     r0, r11, #0xFE
        str     r0, [r10]
        mov     r0, #9
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBIC2:
        mov     r1, r4
        mov     r2, r10
        mov     r0, r5
        bl      frexp
LBIC3:
        cmp     r9, #0
        bne     LBIC4
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBIC4:
        mov     r0, #9
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBIC5:
        str     r11, [r10]
        b       LBIC3
LBIC6:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBIC7:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   LBIC_tmp.3624.0.0.0
        .long   LBIC_tmp.3624.0.0.0


        .data
        .align  4


LBIC_tmp.3624.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00


