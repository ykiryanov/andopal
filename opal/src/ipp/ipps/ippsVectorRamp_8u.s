        .text
        .align  4
        .globl  _ippsVectorRamp_8u


_ippsVectorRamp_8u:
        stmdb   sp!, {r4 - r11, lr}
        mov     r7, r0
        cmp     r7, #0
        mov     r9, r1
        mov     r5, r2
        mov     r4, r3
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r11, pc}
        cmp     r9, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r9, #0
        ble     LAZV2
        ldr     r12, [pc, #0xB0]
        mov     lr, #0xFE, 12
        orr     r6, lr, #3, 4
        mov     r10, #0
        mov     r8, #0
        mov     lr, #0xFF
LAZV0:
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
        strleb  r12, [r7]
        ble     LAZV1
        mov     r1, r6
        mov     r2, r11
        mov     r3, r10
        mov     r0, #0
        bl      __adddf3
        ldr     r3, [pc, #0x44]
        mov     r10, r0
        mov     r11, r1
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        movge   r12, #0xFF
        strgeb  r12, [r7]
        bge     LAZV1
        mov     r0, r10
        mov     r1, r11
        bl      __fixunsdfsi
        strb    r0, [r7]
LAZV1:
        add     r8, r8, #1
        cmp     r8, r9
        add     r7, r7, #1
        blt     LAZV0
LAZV2:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
        .long   0x406fe000


