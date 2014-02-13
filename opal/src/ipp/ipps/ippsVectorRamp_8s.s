        .text
        .align  4
        .globl  _ippsVectorRamp_8s


_ippsVectorRamp_8s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        mov     r6, r0
        cmp     r6, #0
        mov     r9, r1
        mov     r5, r2
        mov     r4, r3
        beq     LAZW6
        cmp     r9, #0
        ble     LAZW5
        cmp     r9, #0
        ble     LAZW4
        ldr     r8, [pc, #0x124]
        mov     r12, #6, 12
        mov     lr, #0xFE, 12
        orr     r12, r12, #3, 2
        orr     lr, lr, #3, 4
        mvn     r10, #0x7F
        mov     r7, #0
        mov     r11, #0x7F
        str     r10, [sp]
        str     lr, [sp, #8]
        str     r12, [sp, #4]
LAZW0:
        mov     r0, r7
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
        bgt     LAZW1
        mov     r0, r11
        mov     r1, r10
        ldr     r3, [sp, #8]
        mov     r2, #0
        bl      __subdf3
        mov     r11, r0
        mov     r10, r1
        b       LAZW2
LAZW1:
        mov     r2, r11
        mov     r3, r10
        ldr     r1, [sp, #8]
        mov     r0, #0
        bl      __adddf3
        mov     r11, r0
        mov     r10, r1
LAZW2:
        mov     r3, r8
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        movge   r12, #0x7F
        strgeb  r12, [r6]
        bge     LAZW3
        ldr     r3, [sp, #4]
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        ldrle   r12, [sp]
        strleb  r12, [r6]
        ble     LAZW3
        mov     r0, r11
        mov     r1, r10
        bl      __fixdfsi
        strb    r0, [r6]
LAZW3:
        add     r7, r7, #1
        cmp     r7, r9
        add     r6, r6, #1
        blt     LAZW0
LAZW4:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LAZW5:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LAZW6:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   0x405fc000


