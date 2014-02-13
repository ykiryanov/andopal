        .text
        .align  4
        .globl  _ippsNormalize_16s_Sfs


_ippsNormalize_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r10, [sp, #0x2C]
        ldr     r12, [sp, #0x30]
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r7, r2
        mov     r6, r3
        beq     LBBV7
        cmp     r4, #0
        beq     LBBV7
        cmp     r7, #1
        blt     LBBV5
        cmp     r10, #0
        bne     LBBV0
        mvn     r0, #9
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBBV0:
        ldr     r8, [pc, #0xF4]
        cmp     r12, #0
        ldr     r8, [r8]
        str     r8, [sp, #4]
        andge   r12, r12, #0x7F
        subge   r9, r8, r12, lsl #23
        blt     LBBV6
LBBV1:
        mov     r0, r10
        str     r9, [sp, #4]
        bl      __floatsisf
        mov     r1, r0
        mov     r0, r8
        bl      __divsf3
        cmp     r7, #0
        ble     LBBV4
        mov     r1, r9
        bl      __mulsf3
        ldr     r8, [pc, #0xB4]
        ldr     r12, [pc, #0xB4]
        mvn     lr, #0xFF
        ldr     r10, [r8]
        bic     lr, lr, #0x7F, 24
        mov     r9, r0
        mvn     r11, lr
        str     lr, [sp]
LBBV2:
        ldrsh   r12, [r5], #2
        sub     r0, r12, r6
        bl      __floatsisf
        mov     r1, r9
        bl      __mulsf3
        mov     r8, r0
        mov     r1, r10
        bl      __gtsf2
        cmp     r0, #0
        strgth  r11, [r4]
        bgt     LBBV3
        ldr     r12, [pc, #0x6C]
        mov     r0, r8
        ldr     r1, [r12]
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r12, [sp]
        strlth  r12, [r4]
        blt     LBBV3
        mov     r0, r8
        bl      __fixsfsi
        strh    r0, [r4]
LBBV3:
        subs    r7, r7, #1
        add     r4, r4, #2
        bne     LBBV2
LBBV4:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBBV5:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBBV6:
        rsb     r12, r12, #0
        and     r12, r12, #0x7F
        add     r9, r8, r12, lsl #23
        b       LBBV1
LBBV7:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   LBBV__2il0floatpacket.1
        .long   LBBV__2il0floatpacket.2
        .long   LBBV__2il0floatpacket.3


        .data
        .align  4


LBBV__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LBBV__2il0floatpacket.2:
        .byte   0x00,0xFE,0xFF,0x46
LBBV__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0xC7


