        .text
        .align  4
        .globl  _ippsSBADPCMEncodeInit_G722_16s


_ippsSBADPCMEncodeInit_G722_16s:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        and     r1, r0, #0xF
        rsb     r1, r1, #0
        and     r3, r1, #0xF
        add     r2, r0, r3
        mov     r1, #0
        strh    r1, [r3, +r0]
        mov     r0, #0x20
        strh    r0, [r2, #0x20]
        mov     r0, #8
        strh    r0, [r2, #0x22]
        mov     r0, #0
        strh    r1, [r2, #8]
        str     r1, [r2, #0x28]
        strh    r1, [r2, #0xA]
        str     r1, [r2, #0x2C]
        strh    r1, [r2, #0xC]
        str     r1, [r2, #0x30]
        strh    r1, [r2, #0xE]
        str     r1, [r2, #0x34]
        strh    r1, [r2, #0x10]
        str     r1, [r2, #0x38]
        strh    r1, [r2, #0x12]
        str     r1, [r2, #0x3C]
        strh    r1, [r2, #0x14]
        str     r1, [r2, #0x40]
        strh    r1, [r2, #0x16]
        str     r1, [r2, #0x44]
        strh    r1, [r2, #0x18]
        str     r1, [r2, #0x48]
        strh    r1, [r2, #0x1A]
        str     r1, [r2, #0x4C]
        strh    r1, [r2, #0x1C]
        str     r1, [r2, #0x50]
        strh    r1, [r2, #0x1E]
        str     r1, [r2, #0x54]
        strh    r1, [r2, #0x60]
        strh    r1, [r2, #0x68]
        strh    r1, [r2, #2]
        strh    r1, [r2, #0x62]
        strh    r1, [r2, #0x6A]
        strh    r1, [r2, #4]
        strh    r1, [r2, #0x64]
        strh    r1, [r2, #0x6C]
        strh    r1, [r2, #6]
        strh    r1, [r2, #0x66]
        strh    r1, [r2, #0x6E]
        strh    r1, [r2, #0x72]
        strh    r1, [r2, #0x70]
        strh    r1, [r2, #0x5A]
        strh    r1, [r2, #0x58]
        strh    r1, [r2, #0x5E]
        strh    r1, [r2, #0x5C]
        strh    r1, [r2, #0x26]
        strh    r1, [r2, #0x24]
        strh    r1, [r2, #0x76]
        strh    r1, [r2, #0x74]
        strh    r1, [r2, #0x7A]
        strh    r1, [r2, #0x78]
        strh    r1, [r2, #0x7E]
        strh    r1, [r2, #0x7C]
        bx      lr


