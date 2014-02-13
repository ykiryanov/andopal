        .text
        .align  4
        .globl  _ippiScanInv_16s_C1


_ippiScanInv_16s_C1:
        stmdb   sp!, {r4, lr}
        cmp     r0, #0
        beq     LEFX7
        cmp     r1, #0
        beq     LEFX7
        cmp     r2, #0
        blt     LEFX0
        cmp     r2, #0x3F
        ble     LEFX1
LEFX0:
        mvn     r0, #0xA
        ldmia   sp!, {r4, pc}
LEFX1:
        tst     r1, #3
        mov     r12, #0
        bne     LEFX2
        str     r12, [r1]
        str     r12, [r1, #4]
        str     r12, [r1, #8]
        str     r12, [r1, #0xC]
        str     r12, [r1, #0x10]
        str     r12, [r1, #0x14]
        str     r12, [r1, #0x18]
        str     r12, [r1, #0x1C]
        str     r12, [r1, #0x20]
        str     r12, [r1, #0x24]
        str     r12, [r1, #0x28]
        str     r12, [r1, #0x2C]
        str     r12, [r1, #0x30]
        str     r12, [r1, #0x34]
        str     r12, [r1, #0x38]
        str     r12, [r1, #0x3C]
        str     r12, [r1, #0x40]
        str     r12, [r1, #0x44]
        str     r12, [r1, #0x48]
        str     r12, [r1, #0x4C]
        str     r12, [r1, #0x50]
        str     r12, [r1, #0x54]
        str     r12, [r1, #0x58]
        str     r12, [r1, #0x5C]
        str     r12, [r1, #0x60]
        str     r12, [r1, #0x64]
        str     r12, [r1, #0x68]
        str     r12, [r1, #0x6C]
        str     r12, [r1, #0x70]
        str     r12, [r1, #0x74]
        str     r12, [r1, #0x78]
        str     r12, [r1, #0x7C]
        b       LEFX3
LEFX2:
        strh    r12, [r1]
        strh    r12, [r1, #2]
        strh    r12, [r1, #4]
        strh    r12, [r1, #6]
        strh    r12, [r1, #8]
        strh    r12, [r1, #0xA]
        strh    r12, [r1, #0xC]
        strh    r12, [r1, #0xE]
        strh    r12, [r1, #0x10]
        strh    r12, [r1, #0x12]
        strh    r12, [r1, #0x14]
        strh    r12, [r1, #0x16]
        strh    r12, [r1, #0x18]
        strh    r12, [r1, #0x1A]
        strh    r12, [r1, #0x1C]
        strh    r12, [r1, #0x1E]
        strh    r12, [r1, #0x20]
        strh    r12, [r1, #0x22]
        strh    r12, [r1, #0x24]
        strh    r12, [r1, #0x26]
        strh    r12, [r1, #0x28]
        strh    r12, [r1, #0x2A]
        strh    r12, [r1, #0x2C]
        strh    r12, [r1, #0x2E]
        strh    r12, [r1, #0x30]
        strh    r12, [r1, #0x32]
        strh    r12, [r1, #0x34]
        strh    r12, [r1, #0x36]
        strh    r12, [r1, #0x38]
        strh    r12, [r1, #0x3A]
        strh    r12, [r1, #0x3C]
        strh    r12, [r1, #0x3E]
        strh    r12, [r1, #0x40]
        strh    r12, [r1, #0x42]
        strh    r12, [r1, #0x44]
        strh    r12, [r1, #0x46]
        strh    r12, [r1, #0x48]
        strh    r12, [r1, #0x4A]
        strh    r12, [r1, #0x4C]
        strh    r12, [r1, #0x4E]
        strh    r12, [r1, #0x50]
        strh    r12, [r1, #0x52]
        strh    r12, [r1, #0x54]
        strh    r12, [r1, #0x56]
        strh    r12, [r1, #0x58]
        strh    r12, [r1, #0x5A]
        strh    r12, [r1, #0x5C]
        strh    r12, [r1, #0x5E]
        strh    r12, [r1, #0x60]
        strh    r12, [r1, #0x62]
        strh    r12, [r1, #0x64]
        strh    r12, [r1, #0x66]
        strh    r12, [r1, #0x68]
        strh    r12, [r1, #0x6A]
        strh    r12, [r1, #0x6C]
        strh    r12, [r1, #0x6E]
        strh    r12, [r1, #0x70]
        strh    r12, [r1, #0x72]
        strh    r12, [r1, #0x74]
        strh    r12, [r1, #0x76]
        strh    r12, [r1, #0x78]
        strh    r12, [r1, #0x7A]
        strh    r12, [r1, #0x7C]
        strh    r12, [r1, #0x7E]
LEFX3:
        ldrsh   r12, [r0]
        cmp     r2, #0
        strh    r12, [r1]
        beq     LEFX6
        ldr     r12, [pc, #0x4C]
        cmp     r3, #2
        ldreq   r12, [pc, #0x48]
        beq     LEFX4
        cmp     r3, #1
        ldreq   r12, [pc, #0x40]
LEFX4:
        cmp     r2, #1
        blt     LEFX6
        add     r0, r0, #2
        mov     r3, #1
LEFX5:
        ldrb    r4, [r3, +r12]
        ldrsh   lr, [r0], #2
        add     r3, r3, #1
        mov     r4, r4, lsl #1
        cmp     r3, r2
        strh    lr, [r1, +r4]
        ble     LEFX5
LEFX6:
        mov     r0, #0
        ldmia   sp!, {r4, pc}
LEFX7:
        mvn     r0, #7
        ldmia   sp!, {r4, pc}
        .long   ownvc_Zigzag
        .long   ownvc_AltScanH
        .long   ownvc_AltScanV


