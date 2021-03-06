#ifndef _CHS_CONF_H_
#define _CHS_CONF_H_

/*****************************************************************************/
/*  #includes                                                                */
/*****************************************************************************/

#include <curses.h>

/*****************************************************************************/
/*  #defines                                                                 */
/*****************************************************************************/

#define  MAXPROGLEN   10000                 /* max length of Mouse program   */
#define  STACKSIZE     1024                 /* maximum depth of calc stack   */
#define  ENVSTACKSIZE  1024                 /* maximum depth of env stack    */
#define  LOCSIZE         26                 /* size of local variable space  */
#define  MAXADDR       1300                 /* 10 local variable spaces      */

#define  CHEESE_PTR    int                  /* Type internally used as pointers by the interpreter */
#define  CHEESE_WORD   int                  /* Type used for the variables                         */

typedef struct _chs_extra_data {
    WINDOW *imgwin;
    WINDOW *textwin;
} chs_extra_data;

#define ENVYRO_EXTRA(envyro) ((chs_extra_data *)((envyro).extra))

#endif /*_CHS_CONF_H_*/
