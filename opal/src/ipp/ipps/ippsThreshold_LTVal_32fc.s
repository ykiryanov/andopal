        .text
        .align  4
        .globl  _ippsThreshold_LTVal_32fc


_ippsThreshold_LTVal_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r7, r0
        cmp     r7, #0
        mov     r4, r1
        mov     r6, r2
        mov     r5, r3
        beq     LAPD5
        cmp     r4, #0
        beq     LAPD5
        cmp     r6, #0
        ble     LAPD4
        ldr     r12, [pc, #0x104]
        mov     r0, r5
        ldr     r1, [r12]
        bl      __ltsf2
        cmp     r0, #0
        blt     LAPD3
        mov     r0, r5
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        cmp     r6, #0
        ble     LAPD2
        sub     r9, r4, #4
        str     r1, [sp]
        str     r0, [sp, #4]
LAPD0:
        ldr     r8, [r7]
        mov     r0, r8
        bl      __extendsfdf2
        ldr     r2, [r7, #4]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r5, r0
        mov     r4, r1
        mov     r0, r10
        mov     r2, r10
        mov     r1, r11
        mov     r3, r11
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r5
        mov     r2, r5
        mov     r1, r4
        mov     r3, r4
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        bl      __gedf2
        cmp     r0, #0
        strge   r8, [r9, #4]
        ldrge   r3, [r7, #4]
        bge     LAPD1
        ldr     r1, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        str     r1, [r9, #4]
LAPD1:
        str     r3, [r9, #8]!
        subs    r6, r6, #1
        add     r7, r7, #8
        bne     LAPD0
LAPD2:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAPD3:
        mvn     r0, #0x12
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAPD4:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAPD5:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   LAPD__2il0floatpacket.1


        .data
        .align  4


LAPD__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00

