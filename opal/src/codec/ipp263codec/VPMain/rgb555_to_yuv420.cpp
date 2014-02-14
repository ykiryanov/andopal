// rgb565_to_yuv420.cpp : Defines the entry point for the console application.
//

typedef unsigned int uint;
typedef unsigned short ushort;
typedef unsigned char  uchar;

#define SCALEBITS 10
#define ONE_HALF  (1 << (SCALEBITS - 1))
#define FIX(x)    ((int) ((x) * (1<<SCALEBITS) + 0.5))


#define RGB_TO_Y_CCIR(r, g, b) \
((FIX(0.29900*219.0/255.0) * (r) + FIX(0.58700*219.0/255.0) * (g) + \
  FIX(0.11400*219.0/255.0) * (b) + (ONE_HALF + (16 << SCALEBITS))) >> SCALEBITS)

#define RGB_TO_U_CCIR(r1, g1, b1, shift)\
(((- FIX(0.16874*224.0/255.0) * r1 - FIX(0.33126*224.0/255.0) * g1 +         \
     FIX(0.50000*224.0/255.0) * b1 + (ONE_HALF << shift) - 1) >> (SCALEBITS + shift)) + 128)

#define RGB_TO_V_CCIR(r1, g1, b1, shift)\
(((FIX(0.50000*224.0/255.0) * r1 - FIX(0.41869*224.0/255.0) * g1 -           \
   FIX(0.08131*224.0/255.0) * b1 + (ONE_HALF << shift) - 1) >> (SCALEBITS + shift)) + 128)


#define RGB_IN(r, g, b, s)\
{\
    uint v = ((const ushort*)(s))[0];\
    r = (v>>8) & 0x0f8;\
    g = (v>>3) & 0x0fc;\
    b = (v<<3) & 0x0f8;\
}

#define BPP 2


void rgb565_to_yuv420(
    uint width, uint height,
    uchar* rgb, int rgbPitch,
    uchar* y, int yPitch,
    uchar* u, int uPitch,
    uchar* v, int vPitch)
{
    int r, g, b, r1, g1, b1, w;

    uint width2 = (width + 1) >> 1;

    for(;height >=2; height -= 2) {
        for (w = width; w >= 2; w -= 2) {
            RGB_IN(r, g, b, rgb);
            r1 = r; g1 = g; b1 = b;

            y[0] = RGB_TO_Y_CCIR(r, g, b);

            RGB_IN(r, g, b, rgb + BPP);
            r1 += r; g1 += g; b1 += b;
            y[1] = RGB_TO_Y_CCIR(r, g, b);

            rgb += rgbPitch;
            y   += yPitch;

            RGB_IN(r, g, b, rgb);
            r1 += r;
            g1 += g;
            b1 += b;
            y[0] = RGB_TO_Y_CCIR(r, g, b);

            RGB_IN(r, g, b, rgb + BPP);
            r1 += r;
            g1 += g;
            b1 += b;
            y[1] = RGB_TO_Y_CCIR(r, g, b);

            *u ++ = RGB_TO_U_CCIR(r1, g1, b1, 2);
            *v ++ = RGB_TO_V_CCIR(r1, g1, b1, 2);

            rgb += -rgbPitch + 2*BPP;
            y   += -yPitch + 2;
        }

        if (w) {
            RGB_IN(r, g, b, rgb);
            r1 = r;  g1 = g;  b1 = b;
            y[0] = RGB_TO_Y_CCIR(r, g, b);

            rgb  += rgbPitch;
            y    += yPitch;

            RGB_IN(r, g, b, rgb);
            r1 += r; g1 += g; b1 += b;
            y[0] = RGB_TO_Y_CCIR(r, g, b);

            *u ++ = RGB_TO_U_CCIR(r1, g1, b1, 2);
            *v ++ = RGB_TO_V_CCIR(r1, g1, b1, 2);

            rgb += -rgbPitch + BPP;
            y += -yPitch + 1;
        }

        rgb += rgbPitch + (rgbPitch - width * BPP);
        y += yPitch + (yPitch - width);
        u += uPitch - width2;
        v += vPitch - width2;
    }

    /* handle odd height */
    if (height) {
        for (w = width; w >= 2; w -= 2) {
            RGB_IN(r, g, b, rgb);
            r1 = r; g1 = g;  b1 = b;
            y[0] = RGB_TO_Y_CCIR(r, g, b);

            RGB_IN(r, g, b, rgb + BPP);
            r1 += r; g1 += g; b1 += b;

            y[1] = RGB_TO_Y_CCIR(r, g, b);
            u[0] = RGB_TO_U_CCIR(r1, g1, b1, 1);
            v[0] = RGB_TO_V_CCIR(r1, g1, b1, 1);
            u++;
            v++;
            rgb += 2 * BPP;
            y += 2;
        }

        if (w) {
            RGB_IN(r, g, b, rgb);
            y[0] = RGB_TO_Y_CCIR(r, g, b);
            u[0] = RGB_TO_U_CCIR(r, g, b, 0);
            v[0] = RGB_TO_V_CCIR(r, g, b, 0);
        }
    }
}
