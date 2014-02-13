        .text
        .align  4
        .globl  _ippsVectorRamp_16s


_ippsVectorRamp_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r7, r0
        cmp     r7, #0
        mov     r9, r1
        mov     r6, r2
        mov     r5, r3
        beq     LBAC6
        cmp     r9, #0
        ble     LBAC5
        cmp     r9, #0
        ble     LBAC4
        ldr     r12, [pc, #0x11C]
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mov     r4, #0xFE, 12
        mvn     r10, lr
        orr     r4, r4, #3, 4
        mov     r8, #0
        str     r10, [sp, #4]
        str     lr, [sp]
LBAC0:
        mov     r0, r8
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        bl      __extendsfdf2
        mov     r11, r0
        mov     r10, r1
        mov     r2, #0
        mov     r3, #0
        bl      __ledf2
        cmp     r0, #0
        bgt     LBAC1
        mov     r0, r11
        mov     r1, r10
        mov     r3, r4
        mov     r2, #0
        bl      __subdf3
        mov     r11, r0
        mov     r10, r1
        b       LBAC2
LBAC1:
        mov     r2, r11
        mov     r3, r10
        mov     r1, r4
        mov     r0, #0
        bl      __adddf3
        mov     r11, r0
        mov     r10, r1
LBAC2:
        ldr     r3, [pc, #0x84]
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        ldrge   r12, [sp, #4]
        strgeh  r12, [r7]
        bge     LBAC3
        mov     r0, r11
        sub     r3, r4, #0x7F, 8
        mov     r1, r10
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        ldrle   r12, [sp]
        strleh  r12, [r7]
        ble     LBAC3
        mov     r0, r11
        mov     r1, r10
        bl      __fixdfsi
        strh    r0, [r7]
LBAC3:
        add     r8, r8, #1
        cmp     r8, r9
        add     r7, r7, #2
        blt     LBAC0
LBAC4:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBAC5:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBAC6:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   0x40dfffc0


