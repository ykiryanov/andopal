        .text
        .align  4
        .globl  _ippscGetLibVersion


_ippscGetLibVersion:
        ldr     r0, [pc]
        bx      lr
        .long   LDGQ_s_LibVer


        .data
        .align  4


LDGQ_s_LibVer:
        .byte   0x05,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x6C,0x00,0x00,0x00,0x7F,0x01,0x00,0x00
        .byte   0x73,0x78,0x00,0x00
        .long   ??_C@_0N@A@ippscsxl?4lib?$AA@
        .long   ??_C@_03A@5?42?$AA@
        .long   ??_C@_0M@A@Apr?5?54?52007?$AA@


        .data
        .align  4
        .globl  ??_C@_0N@A@ippscsxl?4lib?$AA@ (`string')


??_C@_0N@A@ippscsxl?4lib?$AA@ (`string'):
        .byte   0x69,0x70,0x70,0x73,0x63,0x73,0x78,0x6C,0x2E,0x6C,0x69,0x62,0x00


        .data
        .align  4
        .globl  ??_C@_03A@5?42?$AA@ (`string')


??_C@_03A@5?42?$AA@ (`string'):
        .byte   0x35,0x2E,0x32,0x00


        .data
        .align  4
        .globl  ??_C@_0M@A@Apr?5?54?52007?$AA@ (`string')


??_C@_0M@A@Apr?5?54?52007?$AA@ (`string'):
        .byte   0x41,0x70,0x72,0x20,0x20,0x34,0x20,0x32,0x30,0x30,0x37,0x00


