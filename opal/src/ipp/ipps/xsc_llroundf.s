        .text
        .align  4
        .globl  llroundf


llroundf:
        stmdb   sp!, {r4 - r6, lr}
        sub     sp, sp, #0xC
        mov     r3, r0
        str     r0, [sp, #8]
        mvn     r0, #2, 2
        and     r1, r3, r0
        bic     r5, r3, r0
        mov     r2, r1, asr #23
        cmp     r2, #0x7E
        mov     r0, #0
        bgt     LABX2
        cmp     r2, #0x7E
        beq     LABX0
        cmp     r2, #0x7E
        bge     LABX3
        mov     r0, #0
        mov     r1, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r6, pc}
LABX0:
        cmp     r5, #2, 2
        bne     LABX1
        mvn     r0, #0
        mvn     r1, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r6, pc}
LABX1:
        mov     r0, #1
        mov     r1, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r6, pc}
LABX2:
        cmp     r2, #0xBE
        blt     LABX6
LABX3:
        cmp     r1, #0xDF, 8
        mov     r4, #2, 2
        beq     LABX5
        mov     r3, r3, lsl #1
        cmp     r3, #0xFF, 8
        bls     LABX10
LABX4:
        mov     r1, r4
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r6, pc}
LABX5:
        mov     r0, #0
        mov     r1, #2, 2
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r6, pc}
LABX6:
        mov     r1, #0xFE, 10
        orr     r1, r1, #3, 2
        mvn     r1, r1
        and     r1, r3, r1
        sub     r4, r2, #0x7F
        sub     r0, r0, #2, 10
        orr     r6, r1, #2, 10
        mov     r3, r4, asr #31
        mvn     r1, #0
        mov     r2, r4
        bl      __ashrdi3
        mov     r3, #1, 10
        add     r6, r6, r3, asr r4
        cmp     r4, #0x17
        and     r0, r6, r0
        and     r1, r1, r6, asr #31
        ble     LABX7
        sub     r2, r4, #0x17
        mov     r3, r2, asr #31
        bl      __ashldi3
        b       LABX8
LABX7:
        rsb     r2, r4, #0x17
        mov     r3, r2, asr #31
        bl      __ashrdi3
LABX8:
        cmp     r5, #2, 2
        bne     LABX9
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
LABX9:
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r6, pc}
LABX10:
        str     r0, [sp]
        add     r3, sp, #8
        mov     r2, sp
        add     r1, sp, #8
        mov     r0, r3
        str     r4, [sp, #4]
        mov     r3, #0xC2
        bl      __libm_error_support
        ldr     r0, [sp]
        ldr     r4, [sp, #4]
        b       LABX4


