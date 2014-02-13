        .text
        .align  4
        .globl  _ippsThreshold_32fc


_ippsThreshold_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r9, [sp, #0x30]
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r1
        mov     r8, r2
        mov     r10, r3
        beq     LARN8
        cmp     r6, #0
        beq     LARN8
        cmp     r8, #0
        ble     LARN9
        ldr     r12, [pc, #0x240]
        mov     r0, r10
        ldr     r11, [r12]
        mov     r1, r11
        bl      __ltsf2
        cmp     r0, #0
        blt     LARN3
        mov     r0, r10
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        cmp     r9, #4
        mov     r5, r0
        mov     r4, r1
        mov     r9, #0
        beq     LARN5
        str     r11, [sp, #8]
        str     r10, [sp, #4]
        str     r8, [sp]
LARN0:
        ldr     r0, [r7, #4]
        mov     r1, r0
        bl      __mulsf3
        ldr     r8, [r7]
        mov     r10, r0
        mov     r0, r8
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        bl      __extendsfdf2
        mov     r11, r0
        mov     r10, r1
        mov     r2, r5
        mov     r3, r4
        bl      __gedf2
        cmp     r0, #0
        blt     LARN1
        str     r8, [r6]
        ldr     r12, [r7, #4]
        str     r12, [r6, #4]
        b       LARN2
LARN1:
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LARN4
        mov     r2, r11
        mov     r3, r10
        mov     r0, r5
        mov     r1, r4
        bl      __divdf3
        bl      sqrt
        mov     r10, r0
        mov     r0, r8
        mov     r8, r1
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r8
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r6]
        ldr     r0, [r7, #4]
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r8
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r6, #4]
LARN2:
        ldr     r12, [sp]
        add     r9, r9, #1
        add     r7, r7, #8
        cmp     r9, r12
        add     r6, r6, #8
        blt     LARN0
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LARN3:
        mvn     r0, #0x12
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LARN4:
        ldr     r12, [sp, #8]
        str     r12, [r6, #4]
        ldr     r12, [sp, #4]
        str     r12, [r6]
        b       LARN2
LARN5:
        sub     r6, r6, #4
        str     r8, [sp]
LARN6:
        ldr     r0, [r7, #4]
        mov     r1, r0
        bl      __mulsf3
        ldr     r8, [r7]
        mov     r10, r0
        mov     r0, r8
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        bl      __extendsfdf2
        mov     r11, r0
        mov     r10, r1
        mov     r2, r5
        mov     r3, r4
        bl      __ledf2
        cmp     r0, #0
        strle   r8, [r6, #4]
        ldrle   r0, [r7, #4]
        ble     LARN7
        mov     r2, r11
        mov     r3, r10
        mov     r0, r5
        mov     r1, r4
        bl      __divdf3
        bl      sqrt
        mov     r11, r0
        mov     r0, r8
        mov     r10, r1
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r6, #4]
        ldr     r0, [r7, #4]
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        bl      __truncdfsf2
LARN7:
        str     r0, [r6, #8]!
        ldr     r12, [sp]
        add     r9, r9, #1
        add     r7, r7, #8
        cmp     r9, r12
        blt     LARN6
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LARN8:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LARN9:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   LARN__2il0floatpacket.1


        .data
        .align  4


LARN__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


