        .text
        .align  4
        .globl  _ippsFullbandControllerInit_EC_32f


_ippsFullbandControllerInit_EC_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r4, r0
        cmp     r4, #0
        mov     r6, r1
        mov     r10, r2
        mov     r0, r3
        beq     LDLM2
        cmp     r6, #0
        ble     LDLM1
        cmp     r10, #0
        ble     LDLM1
        cmp     r0, #0x7D, 26
        beq     LDLM0
        cmp     r0, #0xFA, 26
        beq     LDLM0
        mvn     r0, #6
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDLM0:
        ldr     r12, [pc, #0x254]
        and     lr, r4, #0xF
        rsb     lr, lr, #0
        ldr     r12, [r12]
        and     lr, lr, #0xF
        add     r11, r4, lr
        str     r6, [r11, #0x20]
        str     r12, [lr, +r4]
        str     r12, [r11, #0x10]
        str     r12, [r11, #0xC]
        str     r12, [r11, #4]
        str     r12, [r11, #8]
        bl      __floatsidf
        ldr     r2, [pc, #0x224]
        ldr     r3, [pc, #0x224]
        mov     r4, r1
        mov     r5, r0
        bl      __muldf3
        mov     r8, r0
        mov     r0, r6
        mov     r9, r1
        bl      __floatsidf
        mov     r6, r0
        mov     r7, r1
        mov     r0, r8
        mov     r1, r9
        mov     r2, r6
        mov     r3, r7
        bl      __divdf3
        mov     r12, #0xFF, 12
        orr     r8, r12, #3, 4
        sub     r9, r8, #2, 2
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, r9
        bl      __divdf3
        str     r0, [sp]
        ldr     r0, [sp]
        str     r1, [sp, #4]
        mov     r2, #0
        mov     r3, r8
        bl      __adddf3
        ldr     r2, [sp]
        ldr     r3, [sp, #4]
        str     r0, [sp, #8]
        str     r1, [sp, #0xC]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        sub     r3, r8, #1, 12
        str     r3, [sp, #4]
        mov     r2, #0
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0xC]
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r12, [pc, #0x178]
        ldr     r2, [pc, #0x178]
        str     r0, [r11, #0x14]
        add     r3, r12, #1, 12
        str     r10, [r11, #0x24]
        mov     r1, r4
        mov     r0, r5
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __divdf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, r9
        bl      __divdf3
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0xC]
        str     r1, [sp, #8]
        ldr     r1, [sp, #8]
        mov     r2, #0
        mov     r3, r8
        bl      __adddf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        str     r1, [sp, #0x10]
        ldr     r1, [sp, #8]
        str     r0, [sp]
        mov     r0, r2
        bl      __muldf3
        ldr     r3, [sp, #4]
        mov     r2, #0
        bl      __muldf3
        ldr     r2, [sp]
        ldr     r3, [sp, #0x10]
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r2, [pc, #0xE8]
        ldr     r3, [pc, #0xE0]
        str     r0, [r11, #0x18]
        mov     r1, r4
        mov     r0, r5
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __divdf3
        mov     r2, r0
        mov     r3, r1
        mov     r1, r9
        mov     r0, #0
        bl      __divdf3
        mov     r6, r0
        mov     r7, r1
        mov     r3, r8
        mov     r2, #0
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        mov     r0, r6
        mov     r1, r7
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r3, [sp, #4]
        mov     r2, #0
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r3, [pc, #0x68]
        ldr     r1, [pc, #0x68]
        mul     r3, r10, r3
        str     r0, [r11, #0x1C]
        ldr     r4, [r1]
        mov     r0, r3
        str     r4, [r11, #0x28]
        str     r4, [r11, #0x2C]
        bl      __floatsisf
        mov     r1, r0
        str     r1, [r11, #0x30]
        mov     r0, r4
        bl      __divsf3
        str     r0, [r11, #0x34]
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDLM1:
        mvn     r0, #4
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDLM2:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   LDLM__2il0floatpacket.1
        .long   0x9999999a
        .long   0x3fa99999
        .long   0x3f847ae1
        .long   0x47ae147b
        .long   0x0016e360
        .long   LDLM__2il0floatpacket.2


        .data
        .align  4


LDLM__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LDLM__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F


