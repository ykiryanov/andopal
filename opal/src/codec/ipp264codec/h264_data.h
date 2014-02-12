#pragma once
#ifndef __h264_data_h
#define __h264_data_h

const static struct h264_level 
{
    unsigned        level_idc;
    unsigned        mbps;           // max macroblock processing rate (macroblocks/sec)
    unsigned        frame_size;     // max frame size (macroblocks)
    unsigned        dpb;            // max decoded picture buffer (bytes)
    long unsigned   bitrate;        // max bitrate (kbit/sec)
    unsigned        cpb;            // max vbv buffer (kbit)
    unsigned        mv_range;       // max vertical mv component range (pixels)
    unsigned        mvs_per_2mb;    // max mvs per 2 consecutive mbs.
    unsigned        slice_rate;
    unsigned        bipred8x8;      // limit bipred to >=8x8
    unsigned        direct8x8;      // limit b_direct to >=8x8
    unsigned        frame_only;     // forbid interlacing
} h264_levels[] = {
    { 10,   1485,    99,   152064,     64000,    175,  64, 64,  0, 0, 0, 1 },
    {  9,   1485,    99,   152064,    128000,    350,  64, 64,  0, 0, 0, 1 },
    { 11,   3000,   396,   345600,    192000,    500, 128, 64,  0, 0, 0, 1 },
    { 12,   6000,   396,   912384,    384000,   1000, 128, 64,  0, 0, 0, 1 },
    { 13,  11880,   396,   912384,    768000,   2000, 128, 64,  0, 0, 0, 1 },
    { 20,  11880,   396,   912384,   2000000,   2000, 128, 64,  0, 0, 0, 1 },
    { 21,  19800,   792,  1824768,   4000000,   4000, 256, 64,  0, 0, 0, 0 },
    { 22,  20250,  1620,  3110400,   4000000,   4000, 256, 64,  0, 0, 0, 0 },
    { 30,  40500,  1620,  3110400,  10000000,  10000, 256, 32, 22, 0, 1, 0 },
    { 31, 108000,  3600,  6912000,  14000000,  14000, 512, 16, 60, 1, 1, 0 },
    { 32, 216000,  5120,  7864320,  20000000,  20000, 512, 16, 60, 1, 1, 0 },
    { 40, 245760,  8192, 12582912,  20000000,  25000, 512, 16, 60, 1, 1, 0 },
    { 41, 245760,  8192, 12582912,  50000000,  62500, 512, 16, 24, 1, 1, 0 },
    { 42, 522240,  8704, 13369344,  50000000,  62500, 512, 16, 24, 1, 1, 1 },
    { 50, 589824, 22080, 42393600, 135000000, 135000, 512, 16, 24, 1, 1, 1 },
    { 51, 983040, 36864, 70778880, 240000000, 240000, 512, 16, 24, 1, 1, 1 },
    { 0 }
};

// This table is used in order to select a different resolution if the desired one
// consists of more macroblocks than the level limit
const static struct h264_resolution {
    unsigned width, height, macroblocks;
} h264_resolutions[] = {
    { 1920, 1088, 8160 },
    { 1600, 1200, 7500 },
    { 1408, 1152, 6336 },
    { 1280, 1024, 5120 },
    { 1280,  720, 3600 },
    { 1024,  768, 3072 },
    {  800,  600, 1900 },
    {  704,  576, 1584 },
    {  640,  480, 1200 },
    {  352,  288,  396 },
    {  320,  240,  300 },
    {  176,  144,   99 },
    {  128,   96,   48 },
    { 0 }
};

#endif //__h264_data_h