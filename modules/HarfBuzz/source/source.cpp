#ifdef WIN32
#define __EXPORT __declspec(dllexport)
#else
#define __EXPORT
#endif

#define HB_EXTERN extern __EXPORT

#include "harfbuzz/src/harfbuzz-world.cc"