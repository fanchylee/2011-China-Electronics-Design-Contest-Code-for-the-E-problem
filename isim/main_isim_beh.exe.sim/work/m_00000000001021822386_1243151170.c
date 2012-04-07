/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x36e8438f */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Work/workspace/Xilinx/control_3/control_3/noise_m.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static int ng3[] = {1, 0};
static int ng4[] = {2, 0};
static int ng5[] = {3, 0};
static int ng6[] = {4, 0};
static int ng7[] = {5, 0};
static int ng8[] = {6, 0};
static int ng9[] = {7, 0};
static int ng10[] = {8, 0};
static int ng11[] = {9, 0};
static int ng12[] = {10, 0};
static int ng13[] = {11, 0};
static int ng14[] = {0, 0};



static void Always_28_0(char *t0)
{
    char t8[8];
    char t32[8];
    char t34[8];
    char t44[8];
    char t53[8];
    char t70[8];
    char t79[8];
    char t94[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    int t33;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    char *t42;
    char *t43;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    char *t58;
    char *t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    char *t68;
    char *t69;
    char *t71;
    char *t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    char *t83;
    char *t84;
    char *t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    char *t93;
    char *t95;
    char *t96;
    char *t97;
    char *t98;
    char *t99;
    unsigned int t100;

LAB0:    t1 = (t0 + 1444U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1784);
    *((int *)t2) = 1;
    t3 = (t0 + 1472);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(28, ng0);

LAB5:    xsi_set_current_line(29, ng0);
    t4 = (t0 + 920);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng1)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = (t13 | t16);
    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t10);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB9;

LAB6:    if (t20 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t8) = 1;

LAB9:    t24 = (t8 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t8);
    t28 = (t27 & t26);
    t29 = (t28 != 0);
    if (t29 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(31, ng0);

LAB13:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 920);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 0);
    t13 = (t12 & 1);
    *((unsigned int *)t8) = t13;
    t14 = *((unsigned int *)t6);
    t15 = (t14 >> 0);
    t16 = (t15 & 1);
    *((unsigned int *)t5) = t16;
    t7 = (t0 + 920);
    t9 = (t0 + 920);
    t10 = (t9 + 44U);
    t23 = *((char **)t10);
    t24 = ((char*)((ng3)));
    xsi_vlog_generic_convert_bit_index(t32, t23, 2, t24, 32, 1);
    t30 = (t32 + 4);
    t17 = *((unsigned int *)t30);
    t33 = (!(t17));
    if (t33 == 1)
        goto LAB14;

LAB15:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 920);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 1);
    t13 = (t12 & 1);
    *((unsigned int *)t8) = t13;
    t14 = *((unsigned int *)t6);
    t15 = (t14 >> 1);
    t16 = (t15 & 1);
    *((unsigned int *)t5) = t16;
    t7 = (t0 + 920);
    t9 = (t0 + 920);
    t10 = (t9 + 44U);
    t23 = *((char **)t10);
    t24 = ((char*)((ng4)));
    xsi_vlog_generic_convert_bit_index(t32, t23, 2, t24, 32, 1);
    t30 = (t32 + 4);
    t17 = *((unsigned int *)t30);
    t33 = (!(t17));
    if (t33 == 1)
        goto LAB16;

LAB17:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 920);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 2);
    t13 = (t12 & 1);
    *((unsigned int *)t8) = t13;
    t14 = *((unsigned int *)t6);
    t15 = (t14 >> 2);
    t16 = (t15 & 1);
    *((unsigned int *)t5) = t16;
    t7 = (t0 + 920);
    t9 = (t0 + 920);
    t10 = (t9 + 44U);
    t23 = *((char **)t10);
    t24 = ((char*)((ng5)));
    xsi_vlog_generic_convert_bit_index(t32, t23, 2, t24, 32, 1);
    t30 = (t32 + 4);
    t17 = *((unsigned int *)t30);
    t33 = (!(t17));
    if (t33 == 1)
        goto LAB18;

LAB19:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 920);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 3);
    t13 = (t12 & 1);
    *((unsigned int *)t8) = t13;
    t14 = *((unsigned int *)t6);
    t15 = (t14 >> 3);
    t16 = (t15 & 1);
    *((unsigned int *)t5) = t16;
    t7 = (t0 + 920);
    t9 = (t0 + 920);
    t10 = (t9 + 44U);
    t23 = *((char **)t10);
    t24 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t32, t23, 2, t24, 32, 1);
    t30 = (t32 + 4);
    t17 = *((unsigned int *)t30);
    t33 = (!(t17));
    if (t33 == 1)
        goto LAB20;

LAB21:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 920);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 4);
    t13 = (t12 & 1);
    *((unsigned int *)t8) = t13;
    t14 = *((unsigned int *)t6);
    t15 = (t14 >> 4);
    t16 = (t15 & 1);
    *((unsigned int *)t5) = t16;
    t7 = (t0 + 920);
    t9 = (t0 + 920);
    t10 = (t9 + 44U);
    t23 = *((char **)t10);
    t24 = ((char*)((ng7)));
    xsi_vlog_generic_convert_bit_index(t32, t23, 2, t24, 32, 1);
    t30 = (t32 + 4);
    t17 = *((unsigned int *)t30);
    t33 = (!(t17));
    if (t33 == 1)
        goto LAB22;

LAB23:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 920);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 5);
    t13 = (t12 & 1);
    *((unsigned int *)t8) = t13;
    t14 = *((unsigned int *)t6);
    t15 = (t14 >> 5);
    t16 = (t15 & 1);
    *((unsigned int *)t5) = t16;
    t7 = (t0 + 920);
    t9 = (t0 + 920);
    t10 = (t9 + 44U);
    t23 = *((char **)t10);
    t24 = ((char*)((ng8)));
    xsi_vlog_generic_convert_bit_index(t32, t23, 2, t24, 32, 1);
    t30 = (t32 + 4);
    t17 = *((unsigned int *)t30);
    t33 = (!(t17));
    if (t33 == 1)
        goto LAB24;

LAB25:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 920);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 6);
    t13 = (t12 & 1);
    *((unsigned int *)t8) = t13;
    t14 = *((unsigned int *)t6);
    t15 = (t14 >> 6);
    t16 = (t15 & 1);
    *((unsigned int *)t5) = t16;
    t7 = (t0 + 920);
    t9 = (t0 + 920);
    t10 = (t9 + 44U);
    t23 = *((char **)t10);
    t24 = ((char*)((ng9)));
    xsi_vlog_generic_convert_bit_index(t32, t23, 2, t24, 32, 1);
    t30 = (t32 + 4);
    t17 = *((unsigned int *)t30);
    t33 = (!(t17));
    if (t33 == 1)
        goto LAB26;

LAB27:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 920);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 7);
    t13 = (t12 & 1);
    *((unsigned int *)t8) = t13;
    t14 = *((unsigned int *)t6);
    t15 = (t14 >> 7);
    t16 = (t15 & 1);
    *((unsigned int *)t5) = t16;
    t7 = (t0 + 920);
    t9 = (t0 + 920);
    t10 = (t9 + 44U);
    t23 = *((char **)t10);
    t24 = ((char*)((ng10)));
    xsi_vlog_generic_convert_bit_index(t32, t23, 2, t24, 32, 1);
    t30 = (t32 + 4);
    t17 = *((unsigned int *)t30);
    t33 = (!(t17));
    if (t33 == 1)
        goto LAB28;

LAB29:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 920);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 8);
    t13 = (t12 & 1);
    *((unsigned int *)t8) = t13;
    t14 = *((unsigned int *)t6);
    t15 = (t14 >> 8);
    t16 = (t15 & 1);
    *((unsigned int *)t5) = t16;
    t7 = (t0 + 920);
    t9 = (t0 + 920);
    t10 = (t9 + 44U);
    t23 = *((char **)t10);
    t24 = ((char*)((ng11)));
    xsi_vlog_generic_convert_bit_index(t32, t23, 2, t24, 32, 1);
    t30 = (t32 + 4);
    t17 = *((unsigned int *)t30);
    t33 = (!(t17));
    if (t33 == 1)
        goto LAB30;

LAB31:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 920);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 9);
    t13 = (t12 & 1);
    *((unsigned int *)t8) = t13;
    t14 = *((unsigned int *)t6);
    t15 = (t14 >> 9);
    t16 = (t15 & 1);
    *((unsigned int *)t5) = t16;
    t7 = (t0 + 920);
    t9 = (t0 + 920);
    t10 = (t9 + 44U);
    t23 = *((char **)t10);
    t24 = ((char*)((ng12)));
    xsi_vlog_generic_convert_bit_index(t32, t23, 2, t24, 32, 1);
    t30 = (t32 + 4);
    t17 = *((unsigned int *)t30);
    t33 = (!(t17));
    if (t33 == 1)
        goto LAB32;

LAB33:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 920);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 10);
    t13 = (t12 & 1);
    *((unsigned int *)t8) = t13;
    t14 = *((unsigned int *)t6);
    t15 = (t14 >> 10);
    t16 = (t15 & 1);
    *((unsigned int *)t5) = t16;
    t7 = (t0 + 920);
    t9 = (t0 + 920);
    t10 = (t9 + 44U);
    t23 = *((char **)t10);
    t24 = ((char*)((ng13)));
    xsi_vlog_generic_convert_bit_index(t32, t23, 2, t24, 32, 1);
    t30 = (t32 + 4);
    t17 = *((unsigned int *)t30);
    t33 = (!(t17));
    if (t33 == 1)
        goto LAB34;

LAB35:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 920);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 0);
    t13 = (t12 & 1);
    *((unsigned int *)t8) = t13;
    t14 = *((unsigned int *)t6);
    t15 = (t14 >> 0);
    t16 = (t15 & 1);
    *((unsigned int *)t5) = t16;
    t7 = (t0 + 920);
    t9 = (t7 + 36U);
    t10 = *((char **)t9);
    memset(t32, 0, 8);
    t23 = (t32 + 4);
    t24 = (t10 + 4);
    t17 = *((unsigned int *)t10);
    t18 = (t17 >> 3);
    t19 = (t18 & 1);
    *((unsigned int *)t32) = t19;
    t20 = *((unsigned int *)t24);
    t21 = (t20 >> 3);
    t22 = (t21 & 1);
    *((unsigned int *)t23) = t22;
    t25 = *((unsigned int *)t8);
    t26 = *((unsigned int *)t32);
    t27 = (t25 ^ t26);
    *((unsigned int *)t34) = t27;
    t30 = (t8 + 4);
    t31 = (t32 + 4);
    t35 = (t34 + 4);
    t28 = *((unsigned int *)t30);
    t29 = *((unsigned int *)t31);
    t36 = (t28 | t29);
    *((unsigned int *)t35) = t36;
    t37 = *((unsigned int *)t35);
    t38 = (t37 != 0);
    if (t38 == 1)
        goto LAB36;

LAB37:
LAB38:    t41 = (t0 + 920);
    t42 = (t41 + 36U);
    t43 = *((char **)t42);
    memset(t44, 0, 8);
    t45 = (t44 + 4);
    t46 = (t43 + 4);
    t47 = *((unsigned int *)t43);
    t48 = (t47 >> 4);
    t49 = (t48 & 1);
    *((unsigned int *)t44) = t49;
    t50 = *((unsigned int *)t46);
    t51 = (t50 >> 4);
    t52 = (t51 & 1);
    *((unsigned int *)t45) = t52;
    t54 = *((unsigned int *)t34);
    t55 = *((unsigned int *)t44);
    t56 = (t54 ^ t55);
    *((unsigned int *)t53) = t56;
    t57 = (t34 + 4);
    t58 = (t44 + 4);
    t59 = (t53 + 4);
    t60 = *((unsigned int *)t57);
    t61 = *((unsigned int *)t58);
    t62 = (t60 | t61);
    *((unsigned int *)t59) = t62;
    t63 = *((unsigned int *)t59);
    t64 = (t63 != 0);
    if (t64 == 1)
        goto LAB39;

LAB40:
LAB41:    t67 = (t0 + 920);
    t68 = (t67 + 36U);
    t69 = *((char **)t68);
    memset(t70, 0, 8);
    t71 = (t70 + 4);
    t72 = (t69 + 4);
    t73 = *((unsigned int *)t69);
    t74 = (t73 >> 11);
    t75 = (t74 & 1);
    *((unsigned int *)t70) = t75;
    t76 = *((unsigned int *)t72);
    t77 = (t76 >> 11);
    t78 = (t77 & 1);
    *((unsigned int *)t71) = t78;
    t80 = *((unsigned int *)t53);
    t81 = *((unsigned int *)t70);
    t82 = (t80 ^ t81);
    *((unsigned int *)t79) = t82;
    t83 = (t53 + 4);
    t84 = (t70 + 4);
    t85 = (t79 + 4);
    t86 = *((unsigned int *)t83);
    t87 = *((unsigned int *)t84);
    t88 = (t86 | t87);
    *((unsigned int *)t85) = t88;
    t89 = *((unsigned int *)t85);
    t90 = (t89 != 0);
    if (t90 == 1)
        goto LAB42;

LAB43:
LAB44:    t93 = (t0 + 920);
    t95 = (t0 + 920);
    t96 = (t95 + 44U);
    t97 = *((char **)t96);
    t98 = ((char*)((ng14)));
    xsi_vlog_generic_convert_bit_index(t94, t97, 2, t98, 32, 1);
    t99 = (t94 + 4);
    t100 = *((unsigned int *)t99);
    t33 = (!(t100));
    if (t33 == 1)
        goto LAB45;

LAB46:
LAB12:    goto LAB2;

LAB8:    t23 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(30, ng0);
    t30 = ((char*)((ng2)));
    t31 = (t0 + 920);
    xsi_vlogvar_wait_assign_value(t31, t30, 0, 0, 12, 0LL);
    goto LAB12;

LAB14:    xsi_vlogvar_wait_assign_value(t7, t8, 0, *((unsigned int *)t32), 1, 0LL);
    goto LAB15;

LAB16:    xsi_vlogvar_wait_assign_value(t7, t8, 0, *((unsigned int *)t32), 1, 0LL);
    goto LAB17;

LAB18:    xsi_vlogvar_wait_assign_value(t7, t8, 0, *((unsigned int *)t32), 1, 0LL);
    goto LAB19;

LAB20:    xsi_vlogvar_wait_assign_value(t7, t8, 0, *((unsigned int *)t32), 1, 0LL);
    goto LAB21;

LAB22:    xsi_vlogvar_wait_assign_value(t7, t8, 0, *((unsigned int *)t32), 1, 0LL);
    goto LAB23;

LAB24:    xsi_vlogvar_wait_assign_value(t7, t8, 0, *((unsigned int *)t32), 1, 0LL);
    goto LAB25;

LAB26:    xsi_vlogvar_wait_assign_value(t7, t8, 0, *((unsigned int *)t32), 1, 0LL);
    goto LAB27;

LAB28:    xsi_vlogvar_wait_assign_value(t7, t8, 0, *((unsigned int *)t32), 1, 0LL);
    goto LAB29;

LAB30:    xsi_vlogvar_wait_assign_value(t7, t8, 0, *((unsigned int *)t32), 1, 0LL);
    goto LAB31;

LAB32:    xsi_vlogvar_wait_assign_value(t7, t8, 0, *((unsigned int *)t32), 1, 0LL);
    goto LAB33;

LAB34:    xsi_vlogvar_wait_assign_value(t7, t8, 0, *((unsigned int *)t32), 1, 0LL);
    goto LAB35;

LAB36:    t39 = *((unsigned int *)t34);
    t40 = *((unsigned int *)t35);
    *((unsigned int *)t34) = (t39 | t40);
    goto LAB38;

LAB39:    t65 = *((unsigned int *)t53);
    t66 = *((unsigned int *)t59);
    *((unsigned int *)t53) = (t65 | t66);
    goto LAB41;

LAB42:    t91 = *((unsigned int *)t79);
    t92 = *((unsigned int *)t85);
    *((unsigned int *)t79) = (t91 | t92);
    goto LAB44;

LAB45:    xsi_vlogvar_wait_assign_value(t93, t79, 0, *((unsigned int *)t94), 1, 0LL);
    goto LAB46;

}

static void Cont_47_1(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;

LAB0:    t1 = (t0 + 1588U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 920);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t5, 0, 8);
    t6 = (t5 + 4);
    t7 = (t4 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 0);
    t10 = (t9 & 1);
    *((unsigned int *)t5) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    t13 = (t12 & 1);
    *((unsigned int *)t6) = t13;
    t14 = (t0 + 1836);
    t15 = (t14 + 32U);
    t16 = *((char **)t15);
    t17 = (t16 + 40U);
    t18 = *((char **)t17);
    memset(t18, 0, 8);
    t19 = 1U;
    t20 = t19;
    t21 = (t5 + 4);
    t22 = *((unsigned int *)t5);
    t19 = (t19 & t22);
    t23 = *((unsigned int *)t21);
    t20 = (t20 & t23);
    t24 = (t18 + 4);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t25 | t19);
    t26 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t26 | t20);
    xsi_driver_vfirst_trans(t14, 0, 0);
    t27 = (t0 + 1792);
    *((int *)t27) = 1;

LAB1:    return;
}


extern void work_m_00000000001021822386_1243151170_init()
{
	static char *pe[] = {(void *)Always_28_0,(void *)Cont_47_1};
	xsi_register_didat("work_m_00000000001021822386_1243151170", "isim/main_isim_beh.exe.sim/work/m_00000000001021822386_1243151170.didat");
	xsi_register_executes(pe);
}
