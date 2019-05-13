#include <inttypes.h>

#include <stdio.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>

#define INLINE                    inline

#define MEM_TYPE                  PROGMEM
#define MEM_ACCESS_METHOD(a)      pgm_read_byte( &a )
#define ENTER_CRITICAL_SECTION()  cli()
#define EXIT_CRITICAL_SECTION()   sei()

#define assert( x )

#define TRUE     1
#define FALSE    0

typedef uint8_t  BOOL;

typedef uint8_t  UCHAR;
typedef int8_t   CHAR;

typedef uint16_t USHORT;
typedef int16_t  SHORT;

typedef uint32_t ULONG;
typedef int32_t  LONG;
