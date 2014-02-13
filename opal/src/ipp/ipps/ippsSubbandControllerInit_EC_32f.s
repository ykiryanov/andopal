        .text
        .align  4
        .globl  _ippsSubbandControllerInit_EC_32f


_ippsSubbandControllerInit_EC_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r4, [sp, #0x3C]
        mov     r9, r1
        cmp     r9, #0
        mov     r6, r2
        mov     r10, r3
        ble     LDLF1
        cmp     r6, #0
        ble     LDLF1
        cmp     r10, #0
        ble     LDLF1
        cmp     r4, #0x7D, 26
        beq     LDLF0
        cmp     r4, #0xFA, 26
        beq     LDLF0
        mvn     r0, #6
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LDLF0:
        cmp     r0, #0
        beq     LDLF2
        and     r12, r0, #0xF
        rsb     r12, r12, #0
        and     r12, r12, #0xF
        str     r9, [r12, +r0]
        add     r11, r0, r12
        mov     r1, r9, lsl #2
        str     r6, [r11, #4]
        str     r10, [r11, #8]
        str     r4, [r11, #0xC]
        add     r5, r11, #0x50
        mov     r0, r5
        bl      _ippsZero_32f
        str     r5, [r11, #0x10]
        add     r7, r5, r9, lsl #2
        str     r7, [r11, #0x14]
        add     r7, r7, r9, lsl #2
        str     r7, [r11, #0x18]
        add     r7, r7, r9, lsl #2
        str     r7, [r11, #0x1C]
        mov     r0, r4
        bl      __floatsidf
        ldr     r2, [pc, #0x300]
        ldr     r3, [pc, #0x300]
        mov     r4, r1
        mov     r5, r0
        bl      __muldf3
        str     r0, [sp]
        mov     r0, r6
        mov     r8, r1
        bl      __floatsidf
        mov     r7, r0
        ldr     r0, [sp]
        mov     r6, r1
        mov     r2, r7
        mov     r3, r6
        mov     r1, r8
        bl      __divdf3
        mov     r12, #0xFF, 12
        mov     r3, r1
        orr     r8, r12, #3, 4
        mov     r2, r0
        mov     r0, #0
        sub     r1, r8, #2, 2
        str     r1, [sp]
        bl      __divdf3
        str     r0, [sp, #4]
        ldr     r0, [sp, #4]
        str     r1, [sp, #8]
        ldr     r1, [sp, #8]
        mov     r2, #0
        mov     r3, r8
        bl      __adddf3
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        str     r0, [sp, #0xC]
        str     r1, [sp, #0x10]
        ldr     r1, [sp, #8]
        mov     r0, r2
        bl      __muldf3
        sub     r3, r8, #1, 12
        str     r3, [sp, #8]
        mov     r2, #0
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r2, [pc, #0x250]
        ldr     r3, [pc, #0x250]
        str     r0, [r11, #0x24]
        mov     r0, r5
        mov     r1, r4
        bl      __muldf3
        mov     r2, r7
        mov     r3, r6
        bl      __divdf3
        mov     r3, r1
        ldr     r1, [sp]
        mov     r2, r0
        mov     r0, #0
        bl      __divdf3
        str     r1, [sp, #0xC]
        ldr     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x10]
        mov     r2, #0
        mov     r3, r8
        bl      __adddf3
        ldr     r3, [sp, #0xC]
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x10]
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #0xC]
        mov     r2, r0
        bl      __muldf3
        ldr     r3, [sp, #8]
        mov     r2, #0
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x14]
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r12, [pc, #0x1CC]
        ldr     r2, [pc, #0x1CC]
        ldr     r12, [r12]
        str     r0, [r11, #0x28]
        mov     r0, r5
        str     r12, [r11, #0x38]
        str     r12, [r11, #0x34]
        str     r12, [r11, #0x3C]
        ldr     r12, [pc, #0x1B4]
        mov     r1, r4
        add     r3, r12, #1, 12
        bl      __muldf3
        mov     r2, r7
        mov     r3, r6
        bl      __divdf3
        mov     r2, r0
        mov     r3, r1
        ldr     r1, [sp]
        mov     r0, #0
        bl      __divdf3
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x10]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        mov     r2, #0
        mov     r3, r8
        bl      __adddf3
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        str     r1, [sp, #4]
        ldr     r1, [sp, #0x10]
        mov     r2, r0
        bl      __muldf3
        ldr     r3, [sp, #8]
        mov     r2, #0
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #4]
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r2, [pc, #0x12C]
        ldr     r3, [pc, #0x12C]
        str     r0, [r11, #0x2C]
        mov     r1, r4
        mov     r0, r5
        bl      __muldf3
        mov     r2, r7
        mov     r3, r6
        bl      __divdf3
        mov     r3, r1
        ldr     r1, [sp]
        mov     r2, r0
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
        mov     r2, r6
        mov     r1, r7
        mov     r3, r7
        bl      __muldf3
        ldr     r3, [sp, #8]
        mov     r2, #0
        bl      __muldf3
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r2, [pc, #0xB0]
        mov     r12, #0
        str     r12, [r11, #0x4C]
        ldr     r2, [r2]
        str     r0, [r11, #0x30]
        mov     r0, r9
        str     r2, [r11, #0x20]
        bl      __floatsidf
        ldr     r3, [pc, #0x94]
        mov     r2, #0
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        mov     r0, r10
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r11, #0x40]
        bl      __extendsfdf2
        ldr     r4, [pc, #0x64]
        ldr     r5, [pc, #0x64]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __divdf3
        bl      __truncdfsf2
        str     r0, [r11, #0x44]
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LDLF1:
        mvn     r0, #4
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LDLF2:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
        .long   0xeb851eb8
        .long   0x3f8eb851
        .long   0x8d4fdf3b
        .long   0x3f826e97
        .long   LDLF__2il0floatpacket.1
        .long   0x47ae147b
        .long   0x3f847ae1
        .long   LDLF__2il0floatpacket.2
        .long   0x40f86a00
        .long   0x9999999a
        .long   0x3fa99999


        .data
        .align  4


LDLF__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LDLF__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00


