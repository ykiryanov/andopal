typedef unsigned char   uchar;
typedef unsigned short  ushort;
typedef unsigned int    uint;

#define SCALEBITS 10
#define ONE_HALF  (1 << (SCALEBITS - 1))
#define FIX(x)    ((int) ((x) * (1<<SCALEBITS) + 0.5))

#define YUV_TO_RGB1(cb1, cr1)\
{\
    cb = (cb1) - 128;\
    cr = (cr1) - 128;\
    r_add = FIX(1.40200) * cr + ONE_HALF;\
    g_add = - FIX(0.34414) * cb - FIX(0.71414) * cr + ONE_HALF;\
    b_add = FIX(1.77200) * cb + ONE_HALF;\
}

#define YUV_TO_RGB2(r, g, b, y1)\
{\
    y = (uint(y1)) << SCALEBITS;\
    r = cm[(y + r_add) >> SCALEBITS];\
    g = cm[(y + g_add) >> SCALEBITS];\
    b = cm[(y + b_add) >> SCALEBITS];\
}


#define MAX_NEG_CROP 1024
static bool  s_bCropTblInit = false;
uchar cropTbl[256 + 2 * MAX_NEG_CROP] = {0};

#define RGB_OUT_555(d, r, g, b)\
{\
    ((ushort *)(d))[0] = ((r >> 3) << 10) | ((g >> 3) << 5) | (b >> 3);\
}


#define RGB_OUT_565(d, r, g, b)\
{\
    ((ushort *)(d))[0] = ((r >> 3) << 11) | ((g >> 2) << 5) | (b >> 3);\
}


void yuv420_to_rgb555(int width, int height,
    const  uchar* pY, int yLine,
    const  uchar* pU, int uLine,
    const  uchar* pV, int vLine,
    uchar* rgb, int rgbLine)
{
    if (!s_bCropTblInit) {
        int i;
        for (i=0;i<MAX_NEG_CROP;++i) {
            cropTbl[i] = 0;
            cropTbl[i+MAX_NEG_CROP+256] = 255;
        }
        for (i=0;i<256;++i) 
            cropTbl[i+MAX_NEG_CROP] = i;
        s_bCropTblInit = true;
    }
    int w, y, cb, cr, r_add, g_add, b_add;
    uchar*  cm = cropTbl + MAX_NEG_CROP;
    unsigned int r, g, b;

    int dx     = 2;
    int dy     = rgbLine;

    uchar* d = rgb;
    const uchar* y1_ptr = pY;
    const uchar* cb_ptr = pU;
    const uchar* cr_ptr = pV;
    int   width2 = (width + 1) >> 1;

    for(;height >= 2; height -= 2) {
        uchar* d1 = d;
        uchar* d2 = d + dy;
        const uchar* y2_ptr = y1_ptr + yLine;

        for(w = width; w >= 2; w -= 2) {
            YUV_TO_RGB1(cb_ptr[0], cr_ptr[0]);
            /* output 4 pixels */
            YUV_TO_RGB2(r, g, b, y1_ptr[0]);
            RGB_OUT_555(d1, r, g, b);

            YUV_TO_RGB2(r, g, b, y1_ptr[1]);
            RGB_OUT_555(d1 + dx, r, g, b);

            YUV_TO_RGB2(r, g, b, y2_ptr[0]);
            RGB_OUT_555(d2, r, g, b);

            YUV_TO_RGB2(r, g, b, y2_ptr[1]);
            RGB_OUT_555(d2 + dx, r, g, b);

            d1 += dx+dx;
            d2 += dx+dx;

            y1_ptr += 2;
            y2_ptr += 2;
            cb_ptr++;
            cr_ptr++;
        }

        // handle odd width
        if (w) {
            YUV_TO_RGB1(cb_ptr[0], cr_ptr[0]);
            YUV_TO_RGB2(r, g, b, y1_ptr[0]);
            RGB_OUT_555(d1, r, g, b);

            YUV_TO_RGB2(r, g, b, y2_ptr[0]);
            RGB_OUT_555(d2, r, g, b);
            d1 += dx;
            d2 += dx;
            y1_ptr++;
            y2_ptr++;
            cb_ptr++;
            cr_ptr++;
        }
        d += dy + dy;
        y1_ptr += 2 * yLine - width;
        cb_ptr += uLine - width2;
        cr_ptr += vLine - width2;
    }

    /* handle odd height */
    if (height) {
        uchar* d1 = d;
        for(w = width; w >= 2; w -= 2) {
            YUV_TO_RGB1(cb_ptr[0], cr_ptr[0]);
            /* output 2 pixels */
            YUV_TO_RGB2(r, g, b, y1_ptr[0]);
            RGB_OUT_555(d1, r, g, b);

            YUV_TO_RGB2(r, g, b, y1_ptr[1]);
            RGB_OUT_555(d1 + dx, r, g, b);

            d1 += dx+dx;

            y1_ptr += 2;
            cb_ptr++;
            cr_ptr++;
        }
        /* handle width */
        if (w) {
            YUV_TO_RGB1(cb_ptr[0], cr_ptr[0]);
            /* output 2 pixels */
            YUV_TO_RGB2(r, g, b, y1_ptr[0]);
            RGB_OUT_555(d1, r, g, b);
            d1 += dx;

            y1_ptr++;
            cb_ptr++;
            cr_ptr++;
        }
    }
}



void yuv420_to_rgb565(int width, int height,
    const  uchar* pY, int yLine,
    const  uchar* pU, int uLine,
    const  uchar* pV, int vLine,
    uchar* rgb, int rgbLine)
{
    if (!s_bCropTblInit) {
        int i;
        for (i=0;i<MAX_NEG_CROP;++i) {
            cropTbl[i] = 0;
            cropTbl[i+MAX_NEG_CROP+256] = 255;
        }
        for (i=0;i<256;++i) 
            cropTbl[i+MAX_NEG_CROP] = i;
        s_bCropTblInit = true;
    }
    int w, y, cb, cr, r_add, g_add, b_add;
    uchar*  cm = cropTbl + MAX_NEG_CROP;
    unsigned int r, g, b;

    int dx     = 2;
    int dy     = rgbLine;

    uchar* d = rgb;
    const uchar* y1_ptr = pY;
    const uchar* cb_ptr = pU;
    const uchar* cr_ptr = pV;
    int   width2 = (width + 1) >> 1;

    for(;height >= 2; height -= 2) {
        uchar* d1 = d;
        uchar* d2 = d + dy;
        const uchar* y2_ptr = y1_ptr + yLine;

        for(w = width; w >= 2; w -= 2) {
            YUV_TO_RGB1(cb_ptr[0], cr_ptr[0]);
            /* output 4 pixels */
            YUV_TO_RGB2(r, g, b, y1_ptr[0]);
            RGB_OUT_565(d1, r, g, b);

            YUV_TO_RGB2(r, g, b, y1_ptr[1]);
            RGB_OUT_565(d1 + dx, r, g, b);

            YUV_TO_RGB2(r, g, b, y2_ptr[0]);
            RGB_OUT_565(d2, r, g, b);

            YUV_TO_RGB2(r, g, b, y2_ptr[1]);
            RGB_OUT_565(d2 + dx, r, g, b);

            d1 += dx+dx;
            d2 += dx+dx;

            y1_ptr += 2;
            y2_ptr += 2;
            cb_ptr++;
            cr_ptr++;
        }

        // handle odd width
        if (w) {
            YUV_TO_RGB1(cb_ptr[0], cr_ptr[0]);
            YUV_TO_RGB2(r, g, b, y1_ptr[0]);
            RGB_OUT_565(d1, r, g, b);

            YUV_TO_RGB2(r, g, b, y2_ptr[0]);
            RGB_OUT_565(d2, r, g, b);
            d1 += dx;
            d2 += dx;
            y1_ptr++;
            y2_ptr++;
            cb_ptr++;
            cr_ptr++;
        }
        d += dy + dy;
        y1_ptr += 2 * yLine - width;
        cb_ptr += uLine - width2;
        cr_ptr += vLine - width2;
    }

    /* handle odd height */
    if (height) {
        uchar* d1 = d;
        for(w = width; w >= 2; w -= 2) {
            YUV_TO_RGB1(cb_ptr[0], cr_ptr[0]);
            /* output 2 pixels */
            YUV_TO_RGB2(r, g, b, y1_ptr[0]);
            RGB_OUT_565(d1, r, g, b);

            YUV_TO_RGB2(r, g, b, y1_ptr[1]);
            RGB_OUT_565(d1 + dx, r, g, b);

            d1 += dx+dx;

            y1_ptr += 2;
            cb_ptr++;
            cr_ptr++;
        }
        /* handle width */
        if (w) {
            YUV_TO_RGB1(cb_ptr[0], cr_ptr[0]);
            /* output 2 pixels */
            YUV_TO_RGB2(r, g, b, y1_ptr[0]);
            RGB_OUT_565(d1, r, g, b);
            d1 += dx;

            y1_ptr++;
            cb_ptr++;
            cr_ptr++;
        }
    }
}
