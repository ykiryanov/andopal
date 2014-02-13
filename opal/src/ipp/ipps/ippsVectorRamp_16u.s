        .text
        .align  4
        .globl  _ippsVectorRamp_16u


_ippsVectorRamp_16u:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r7, r0
        cmp     r7, #0
        mov     r9, r1
        mov     r5, r2
        mov     r4, r3
        beq     LBAB4
        cmp     r9, #0
        ble     LBAB3
        cmp     r9, #0
        ble     LBAB2
        ldr     r12, [pc, #0xC8]
        mov     lr, #0xFF
        mov     r6, #0xFE, 12
        orr     lr, lr, #0xFF, 24
        orr     r6, r6, #3, 4
        mov     r10, #0
        mov     r8, #0
        str     lr, [sp]
LBAB0:
        mov     r0, r8
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        bl      __extendsfdf2
        mov     r11, r0
        mov     r10, r1
        mov     r2, #0
        mov     r3, #0
        bl      __ledf2
        cmp     r0, #0
        movle   r12, #0
        strleh  r12, [r7]
        ble     LBAB1
        mov     r1, r6
        mov     r2, r11
        mov     r3, r10
        mov     r0, #0
        bl      __adddf3
        ldr     r3, [pc, #0x54]
        mov     r10, r0
        mov     r11, r1
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        ldrge   r12, [sp]
        strgeh  r12, [r7]
        bge     LBAB1
        mov     r0, r10
        mov     r1, r11
        bl      __fixunsdfsi
        strh    r0, [r7]
LBAB1:
        add     r8, r8, #1
        cmp     r8, r9
        add     r7, r7, #2
        blt     LBAB0
LBAB2:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBAB3:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LBAB4:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
        .long   0x40efffe0


