        .text
        .align  4
        .globl  _ippsThreshold_GTAbs_32f


_ippsThreshold_GTAbs_32f:
        stmdb   sp!, {r4 - r11, lr}
        mov     r9, r0
        cmp     r9, #0
        mov     r11, r1
        mov     r10, r2
        mov     r4, r3
        beq     LARF3
        cmp     r11, #0
        beq     LARF3
        cmp     r10, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        ldr     r12, [pc, #0x90]
        mov     r0, r4
        ldr     r5, [r12]
        mov     r1, r5
        bl      __ltsf2
        cmp     r0, #0
        mvnlt   r0, #0x12
        ldmltia sp!, {r4 - r11, pc}
        cmp     r10, #0
        ble     LARF2
        mov     r0, r4
        bl      __extendsfdf2
        mov     r7, r0
        mov     r6, r1
LARF0:
        ldr     r8, [r9], #4
        mov     r0, r8
        bl      __extendsfdf2
        bic     r1, r1, #2, 2
        mov     r2, r7
        mov     r3, r6
        bl      __ledf2
        cmp     r0, #0
        strle   r8, [r11]
        ble     LARF1
        mov     r0, r8
        mov     r1, r5
        bl      __gesf2
        cmp     r0, #0
        eorlt   r12, r4, #2, 2
        movge   r12, r4
        str     r12, [r11]
LARF1:
        subs    r10, r10, #1
        add     r11, r11, #4
        bne     LARF0
LARF2:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LARF3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}
        .long   LARF__2il0floatpacket.1


        .data
        .align  4


LARF__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


