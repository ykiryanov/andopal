        .text
        .align  4
        .globl  _ippsFixedCodebookSearch_G729A_16s


_ippsFixedCodebookSearch_G729A_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x6D, 30
        sub     sp, sp, #2, 22
        mov     lr, sp
        and     lr, lr, #0xF
        rsb     lr, lr, #0
        mov     r7, r0
        mov     r12, sp
        and     lr, lr, #0xF
        cmp     r7, #0
        add     r4, r12, lr
        mov     r5, r1
        mov     r8, r2
        mov     r6, r3
        beq     LDPP3
        cmp     r5, #0
        beq     LDPP3
        cmp     r8, #0
        beq     LDPP3
        cmp     r6, #0
        beq     LDPP3
        mov     r1, r4
        mov     r0, r5
        mov     r2, #0x9A, 30
        bl      _ippsCopy_16s32s
        add     r3, sp, #0x9B, 28
        mov     r2, r8
        mov     r0, r7
        mov     r1, r4
        bl      ownFixedCodebookSearch_G729A_32s16s
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mov     r9, #0
        mov     r8, #0
        mvn     r7, r2
        mov     lr, r4
        mov     r12, r5
LDPP0:
        ldr     r10, [lr], #8
        cmp     r7, r10
        mvnlt   r10, r2
        blt     LDPP1
        cmn     r10, #2, 18
        movge   r10, r10, lsl #16
        movge   r10, r10, asr #16
        sublt   r10, r9, #2, 18
LDPP1:
        strh    r10, [r12], #4
        add     r10, r8, #1
        ldr     r11, [r4, +r10, lsl #2]
        cmp     r7, r11
        sublt   r11, r9, #2, 18
        mvnlt   r11, r11
        blt     LDPP2
        cmn     r11, #2, 18
        movge   r11, r11, lsl #16
        movge   r11, r11, asr #16
        movlt   r11, r2
LDPP2:
        add     r8, r8, #2
        mov     r10, r10, lsl #1
        cmp     r8, #0x9A, 30
        strh    r11, [r5, +r10]
        blt     LDPP0
        add     r0, sp, #0x9B, 28
        add     r2, sp, #0x9B, 28
        ldrsh   r1, [r0]
        ldrsh   r2, [r2, #2]
        add     sp, sp, #0x6D, 30
        mov     r0, #0
        strh    r1, [r6]
        strh    r2, [r6, #2]
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r11, pc}
LDPP3:
        add     sp, sp, #0x6D, 30
        mvn     r0, #7
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r11, pc}


