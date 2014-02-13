        .text
        .align  4
        .globl  _ippsConvert_32f24s_Sfs


_ippsConvert_32f24s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        mov     r5, r0
        cmp     r5, #0
        mov     r6, r2
        beq     LCXF13
        cmp     r1, #0
        beq     LCXF13
        cmp     r6, #0
        ble     LCXF12
        mov     r4, #0xFE, 12
        mvn     lr, #0xEA, 12
        orr     r7, r4, #0xB, 4
        mov     r12, #0xFE, 10
        bic     r4, lr, #0xB, 4
        cmp     r3, #0
        add     r9, sp, #0x14
        orr     r12, r12, #3, 2
        mvn     lr, #0
        mov     r8, #0
        bne     LCXF4
        cmp     r6, #0
        ble     LCXF10
        ldr     r10, [pc, #0x268]
        sub     r9, r1, #1
        str     r12, [sp, #8]
        str     lr, [sp, #0x10]
LCXF0:
        ldr     r0, [r5], #4
        str     r0, [sp, #0xC]
        bl      __extendsfdf2
        mov     r11, r0
        mov     r10, r1
        mov     r2, #3, 2
        mov     r3, r4
        bl      __gedf2
        cmp     r0, #0
        ldrge   r1, [sp, #8]
        mvnge   r11, r1
        bge     LCXF3
        mov     r0, r11
        add     r3, r7, #6, 10
        mov     r1, r10
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        movle   r11, r7, lsl #2
        ble     LCXF3
        ldr     r12, [pc, #0x208]
        ldr     r0, [sp, #0xC]
        ldr     r1, [r12]
        bl      __ltsf2
        cmp     r0, #0
        bge     LCXF1
        mov     r3, r7
        mov     r12, #1
        str     r12, [sp, #4]
        b       LCXF2
LCXF1:
        ldr     r12, [sp, #0x10]
        sub     r3, r7, #2, 2
        str     r12, [sp, #4]
LCXF2:
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        bl      __adddf3
        str     r1, [sp, #0xC]
        mov     r10, r0
        bl      __fixdfsi
        mov     r11, r0
        tst     r11, #1
        beq     LCXF3
        mov     r0, r11
        bl      __floatsidf
        ldr     r3, [sp, #0xC]
        mov     r2, r10
        bl      __eqdf2
        cmp     r0, #0
        ldreq   r1, [sp, #4]
        addeq   r11, r11, r1
LCXF3:
        mov     r1, r11, asr #8
        strb    r11, [r9, #1]
        mov     r11, r11, asr #16
        add     r8, r8, #1
        strb    r1, [r9, #2]
        strb    r11, [r9, #3]!
        cmp     r8, r6
        blt     LCXF0
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCXF4:
        cmp     r3, #0
        ble     LCXF11
        mov     r10, #0x7F
        cmp     r3, #0x7F
        movlt   r10, r3
LCXF5:
        rsb     r10, r10, #0x7F
        cmp     r6, #0
        mov     r10, r10, lsl #23
        str     r10, [r9]
        ble     LCXF10
        ldr     r10, [sp, #0x14]
        ldr     r9, [pc, #0x134]
        sub     r11, r1, #1
        str     r10, [sp]
        str     r12, [sp, #8]
        str     lr, [sp, #0x10]
LCXF6:
        ldr     r0, [r5], #4
        ldr     r1, [sp]
        str     r0, [sp, #4]
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r10, r0
        mov     r9, r1
        mov     r2, #3, 2
        mov     r3, r4
        bl      __gedf2
        cmp     r0, #0
        ldrge   r1, [sp, #8]
        mvnge   r10, r1
        bge     LCXF9
        mov     r0, r10
        add     r3, r7, #6, 10
        mov     r1, r9
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        movle   r10, r7, lsl #2
        ble     LCXF9
        ldr     r12, [pc, #0xC8]
        ldr     r0, [sp, #4]
        ldr     r1, [r12]
        bl      __ltsf2
        cmp     r0, #0
        bge     LCXF7
        mov     r3, r7
        mov     r12, #1
        str     r12, [sp, #4]
        b       LCXF8
LCXF7:
        ldr     r12, [sp, #0x10]
        sub     r3, r7, #2, 2
        str     r12, [sp, #4]
LCXF8:
        mov     r0, r10
        mov     r1, r9
        mov     r2, #0
        bl      __adddf3
        str     r1, [sp, #0xC]
        mov     r9, r0
        bl      __fixdfsi
        mov     r10, r0
        tst     r10, #1
        beq     LCXF9
        mov     r0, r10
        bl      __floatsidf
        ldr     r3, [sp, #0xC]
        mov     r2, r9
        bl      __eqdf2
        cmp     r0, #0
        ldreq   r1, [sp, #4]
        addeq   r10, r10, r1
LCXF9:
        mov     r1, r10, asr #8
        strb    r10, [r11, #1]
        mov     r10, r10, asr #16
        add     r8, r8, #1
        strb    r1, [r11, #2]
        strb    r10, [r11, #3]!
        cmp     r8, r6
        blt     LCXF6
LCXF10:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCXF11:
        mvn     r10, #0x7E
        cmp     r3, r10
        movgt   r10, r3
        b       LCXF5
LCXF12:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCXF13:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
        .long   LCXF__2il0floatpacket.1


        .data
        .align  4


LCXF__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


