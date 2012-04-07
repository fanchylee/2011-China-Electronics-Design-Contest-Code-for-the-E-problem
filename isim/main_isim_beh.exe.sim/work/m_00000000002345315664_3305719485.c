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
static const char *ng0 = "C:/Work/workspace/Xilinx/control_3/control_3/bin2bcd.v";
static int ng1[] = {5, 0};
static int ng2[] = {3, 0};
static int ng3[] = {1, 0};
static int ng4[] = {0, 0, 0, 0};
static int ng5[] = {0, 0};
static int ng6[] = {4, 0};
static int ng7[] = {2, 0};



static int sp_CORRECT(char *t1, char *t2)
{
    char t3[8];
    char t4[8];
    char t9[8];
    char t28[8];
    char t36[8];
    int t0;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    char *t35;
    char *t37;

LAB0:    t0 = 1;
    xsi_set_current_line(45, ng0);

LAB2:    xsi_set_current_line(46, ng0);
    t5 = (t1 + 2244);
    t6 = (t5 + 36U);
    t7 = *((char **)t6);
    t8 = ((char*)((ng1)));
    memset(t9, 0, 8);
    t10 = (t7 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB4;

LAB3:    t11 = (t8 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB4;

LAB7:    if (*((unsigned int *)t7) < *((unsigned int *)t8))
        goto LAB6;

LAB5:    *((unsigned int *)t9) = 1;

LAB6:    memset(t4, 0, 8);
    t13 = (t9 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t9);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t13) != 0)
        goto LAB10;

LAB11:    t20 = (t4 + 4);
    t21 = *((unsigned int *)t4);
    t22 = *((unsigned int *)t20);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB12;

LAB13:    t29 = *((unsigned int *)t4);
    t30 = (~(t29));
    t31 = *((unsigned int *)t20);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t20) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t36, 8);

LAB20:    t37 = (t1 + 2152);
    xsi_vlogvar_assign_value(t37, t3, 0, 0, 4);
    t0 = 0;

LAB1:    return t0;
LAB4:    t12 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB6;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB11;

LAB12:    t24 = (t1 + 2244);
    t25 = (t24 + 36U);
    t26 = *((char **)t25);
    t27 = ((char*)((ng2)));
    memset(t28, 0, 8);
    xsi_vlog_unsigned_add(t28, 32, t26, 4, t27, 32);
    goto LAB13;

LAB14:    t33 = (t1 + 2244);
    t34 = (t33 + 36U);
    t35 = *((char **)t34);
    memcpy(t36, t35, 8);
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t28, 32, t36, 32);
    goto LAB20;

LAB18:    memcpy(t3, t28, 8);
    goto LAB20;

}

static void Always_50_0(char *t0)
{
    char t13[8];
    char t15[8];
    char t41[8];
    char t43[8];
    char t45[8];
    char t54[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t14;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t42;
    char *t44;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    char *t50;
    int t51;
    char *t52;
    char *t53;

LAB0:    t1 = (t0 + 2768U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 2964);
    *((int *)t2) = 1;
    t3 = (t0 + 2796);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(50, ng0);

LAB5:    xsi_set_current_line(51, ng0);
    t4 = (t0 + 1372U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(58, ng0);

LAB10:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 1280U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB11;

LAB12:
LAB13:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(51, ng0);

LAB9:    xsi_set_current_line(53, ng0);
    t11 = (t0 + 264);
    t12 = *((char **)t11);
    t11 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_signed_add(t13, 32, t12, 32, t11, 32);
    t14 = (t0 + 1876);
    xsi_vlogvar_assign_value(t14, t13, 0, 0, 7);
    xsi_set_current_line(54, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1784);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 40);
    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 2060);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB8;

LAB11:    xsi_set_current_line(59, ng0);

LAB14:    xsi_set_current_line(60, ng0);
    t4 = (t0 + 1876);
    t5 = (t4 + 36U);
    t11 = *((char **)t5);
    t12 = (t0 + 264);
    t14 = *((char **)t12);
    t12 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t14, 32, t12, 32);
    memset(t15, 0, 8);
    t16 = (t11 + 4);
    t17 = (t13 + 4);
    t18 = *((unsigned int *)t11);
    t19 = *((unsigned int *)t13);
    t20 = (t18 ^ t19);
    t21 = *((unsigned int *)t16);
    t22 = *((unsigned int *)t17);
    t23 = (t21 ^ t22);
    t24 = (t20 | t23);
    t25 = *((unsigned int *)t16);
    t26 = *((unsigned int *)t17);
    t27 = (t25 | t26);
    t28 = (~(t27));
    t29 = (t24 & t28);
    if (t29 != 0)
        goto LAB18;

LAB15:    if (t27 != 0)
        goto LAB17;

LAB16:    *((unsigned int *)t15) = 1;

LAB18:    t31 = (t15 + 4);
    t32 = *((unsigned int *)t31);
    t33 = (~(t32));
    t34 = *((unsigned int *)t15);
    t35 = (t34 & t33);
    t36 = (t35 != 0);
    if (t36 > 0)
        goto LAB19;

LAB20:    xsi_set_current_line(64, ng0);

LAB23:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 1876);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t13, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t18 = (t9 ^ t10);
    t19 = (t8 | t18);
    t20 = *((unsigned int *)t11);
    t21 = *((unsigned int *)t12);
    t22 = (t20 | t21);
    t23 = (~(t22));
    t24 = (t19 & t23);
    if (t24 != 0)
        goto LAB27;

LAB24:    if (t22 != 0)
        goto LAB26;

LAB25:    *((unsigned int *)t13) = 1;

LAB27:    t16 = (t13 + 4);
    t25 = *((unsigned int *)t16);
    t26 = (~(t25));
    t27 = *((unsigned int *)t13);
    t28 = (t27 & t26);
    t29 = (t28 != 0);
    if (t29 > 0)
        goto LAB28;

LAB29:    xsi_set_current_line(67, ng0);

LAB32:    xsi_set_current_line(68, ng0);
    xsi_set_current_line(68, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1600);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB33:    t2 = (t0 + 1600);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 344);
    t11 = *((char **)t5);
    memset(t13, 0, 8);
    xsi_vlog_signed_leq(t13, 32, t4, 32, t11, 32);
    t5 = (t13 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB34;

LAB35:    xsi_set_current_line(79, ng0);
    t2 = (t0 + 1876);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 32, t4, 7, t5, 32);
    t11 = (t0 + 1876);
    xsi_vlogvar_assign_value(t11, t13, 0, 0, 7);
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 1784);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    xsi_vlog_unsigned_lshift(t54, 40, t4, 40, t5, 32);
    t11 = (t0 + 1784);
    xsi_vlogvar_assign_value(t11, t54, 0, 0, 40);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 2060);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t13, 0, 8);
    t5 = (t13 + 4);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 31);
    t8 = (t7 & 1);
    *((unsigned int *)t13) = t8;
    t9 = *((unsigned int *)t11);
    t10 = (t9 >> 31);
    t18 = (t10 & 1);
    *((unsigned int *)t5) = t18;
    t12 = (t0 + 1784);
    t14 = (t0 + 1784);
    t16 = (t14 + 44U);
    t17 = *((char **)t16);
    t30 = ((char*)((ng5)));
    xsi_vlog_generic_convert_bit_index(t15, t17, 2, t30, 32, 1);
    t31 = (t15 + 4);
    t19 = *((unsigned int *)t31);
    t51 = (!(t19));
    if (t51 == 1)
        goto LAB56;

LAB57:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 2060);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_lshift(t13, 32, t4, 32, t5, 32);
    t11 = (t0 + 2060);
    xsi_vlogvar_assign_value(t11, t13, 0, 0, 32);

LAB30:
LAB21:    goto LAB13;

LAB17:    t30 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB18;

LAB19:    xsi_set_current_line(60, ng0);

LAB22:    xsi_set_current_line(62, ng0);
    t37 = (t0 + 1188U);
    t38 = *((char **)t37);
    t37 = (t0 + 2060);
    xsi_vlogvar_assign_value(t37, t38, 0, 0, 32);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1876);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 32, t4, 7, t5, 32);
    t11 = (t0 + 1876);
    xsi_vlogvar_assign_value(t11, t13, 0, 0, 7);
    goto LAB21;

LAB26:    t14 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB27;

LAB28:    xsi_set_current_line(65, ng0);

LAB31:    xsi_set_current_line(66, ng0);
    t17 = (t0 + 1784);
    t30 = (t17 + 36U);
    t31 = *((char **)t30);
    t37 = (t0 + 1692);
    xsi_vlogvar_assign_value(t37, t31, 0, 0, 40);
    goto LAB30;

LAB34:    xsi_set_current_line(68, ng0);

LAB36:    xsi_set_current_line(69, ng0);
    t12 = (t0 + 1784);
    t14 = (t12 + 36U);
    t16 = *((char **)t14);
    t17 = (t0 + 1784);
    t30 = (t17 + 44U);
    t31 = *((char **)t30);
    t37 = (t0 + 1600);
    t38 = (t37 + 36U);
    t39 = *((char **)t38);
    t40 = ((char*)((ng3)));
    memset(t41, 0, 8);
    xsi_vlog_signed_minus(t41, 32, t39, 32, t40, 32);
    t42 = ((char*)((ng6)));
    memset(t43, 0, 8);
    xsi_vlog_signed_multiply(t43, 32, t41, 32, t42, 32);
    xsi_vlog_generic_get_index_select_value(t15, 1, t16, t31, 2, t43, 32, 1);
    t44 = (t0 + 1968);
    t46 = (t0 + 1968);
    t47 = (t46 + 44U);
    t48 = *((char **)t47);
    t49 = ((char*)((ng5)));
    xsi_vlog_generic_convert_bit_index(t45, t48, 2, t49, 32, 1);
    t50 = (t45 + 4);
    t18 = *((unsigned int *)t50);
    t51 = (!(t18));
    if (t51 == 1)
        goto LAB37;

LAB38:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 1784);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 1784);
    t11 = (t5 + 44U);
    t12 = *((char **)t11);
    t14 = (t0 + 1600);
    t16 = (t14 + 36U);
    t17 = *((char **)t16);
    t30 = ((char*)((ng3)));
    memset(t15, 0, 8);
    xsi_vlog_signed_minus(t15, 32, t17, 32, t30, 32);
    t31 = ((char*)((ng6)));
    memset(t41, 0, 8);
    xsi_vlog_signed_multiply(t41, 32, t15, 32, t31, 32);
    t37 = ((char*)((ng3)));
    memset(t43, 0, 8);
    xsi_vlog_signed_add(t43, 32, t41, 32, t37, 32);
    xsi_vlog_generic_get_index_select_value(t13, 1, t4, t12, 2, t43, 32, 1);
    t38 = (t0 + 1968);
    t39 = (t0 + 1968);
    t40 = (t39 + 44U);
    t42 = *((char **)t40);
    t44 = ((char*)((ng3)));
    xsi_vlog_generic_convert_bit_index(t45, t42, 2, t44, 32, 1);
    t46 = (t45 + 4);
    t6 = *((unsigned int *)t46);
    t51 = (!(t6));
    if (t51 == 1)
        goto LAB39;

LAB40:    xsi_set_current_line(71, ng0);
    t2 = (t0 + 1784);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 1784);
    t11 = (t5 + 44U);
    t12 = *((char **)t11);
    t14 = (t0 + 1600);
    t16 = (t14 + 36U);
    t17 = *((char **)t16);
    t30 = ((char*)((ng3)));
    memset(t15, 0, 8);
    xsi_vlog_signed_minus(t15, 32, t17, 32, t30, 32);
    t31 = ((char*)((ng6)));
    memset(t41, 0, 8);
    xsi_vlog_signed_multiply(t41, 32, t15, 32, t31, 32);
    t37 = ((char*)((ng7)));
    memset(t43, 0, 8);
    xsi_vlog_signed_add(t43, 32, t41, 32, t37, 32);
    xsi_vlog_generic_get_index_select_value(t13, 1, t4, t12, 2, t43, 32, 1);
    t38 = (t0 + 1968);
    t39 = (t0 + 1968);
    t40 = (t39 + 44U);
    t42 = *((char **)t40);
    t44 = ((char*)((ng7)));
    xsi_vlog_generic_convert_bit_index(t45, t42, 2, t44, 32, 1);
    t46 = (t45 + 4);
    t6 = *((unsigned int *)t46);
    t51 = (!(t6));
    if (t51 == 1)
        goto LAB41;

LAB42:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 1784);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 1784);
    t11 = (t5 + 44U);
    t12 = *((char **)t11);
    t14 = (t0 + 1600);
    t16 = (t14 + 36U);
    t17 = *((char **)t16);
    t30 = ((char*)((ng3)));
    memset(t15, 0, 8);
    xsi_vlog_signed_minus(t15, 32, t17, 32, t30, 32);
    t31 = ((char*)((ng6)));
    memset(t41, 0, 8);
    xsi_vlog_signed_multiply(t41, 32, t15, 32, t31, 32);
    t37 = ((char*)((ng2)));
    memset(t43, 0, 8);
    xsi_vlog_signed_add(t43, 32, t41, 32, t37, 32);
    xsi_vlog_generic_get_index_select_value(t13, 1, t4, t12, 2, t43, 32, 1);
    t38 = (t0 + 1968);
    t39 = (t0 + 1968);
    t40 = (t39 + 44U);
    t42 = *((char **)t40);
    t44 = ((char*)((ng2)));
    xsi_vlog_generic_convert_bit_index(t45, t42, 2, t44, 32, 1);
    t46 = (t45 + 4);
    t6 = *((unsigned int *)t46);
    t51 = (!(t6));
    if (t51 == 1)
        goto LAB43;

LAB44:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 1968);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t13, 0, 8);
    t5 = (t13 + 4);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    *((unsigned int *)t13) = t7;
    t8 = *((unsigned int *)t11);
    t9 = (t8 >> 0);
    *((unsigned int *)t5) = t9;
    t10 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t10 & 15U);
    t18 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t18 & 15U);
    t12 = (t0 + 2668);
    t14 = (t0 + 724);
    t16 = xsi_create_subprogram_invocation(t12, 0, t0, t14, 0, 0);
    t17 = (t0 + 2244);
    xsi_vlogvar_assign_value(t17, t13, 0, 0, 4);

LAB45:    t30 = (t0 + 2720);
    t31 = *((char **)t30);
    t37 = (t31 + 44U);
    t38 = *((char **)t37);
    t39 = (t38 + 148U);
    t40 = *((char **)t39);
    t42 = (t40 + 0U);
    t44 = *((char **)t42);
    t51 = ((int  (*)(char *, char *))t44)(t0, t31);
    if (t51 != 0)
        goto LAB47;

LAB46:    t31 = (t0 + 2720);
    t46 = *((char **)t31);
    t31 = (t0 + 2152);
    t47 = (t31 + 36U);
    t48 = *((char **)t47);
    memcpy(t15, t48, 8);
    t49 = (t0 + 724);
    t50 = (t0 + 2668);
    t52 = 0;
    xsi_delete_subprogram_invocation(t49, t46, t0, t50, t52);
    t53 = (t0 + 1968);
    xsi_vlogvar_assign_value(t53, t15, 0, 0, 4);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 1968);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t13, 0, 8);
    t5 = (t13 + 4);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    t8 = (t7 & 1);
    *((unsigned int *)t13) = t8;
    t9 = *((unsigned int *)t11);
    t10 = (t9 >> 0);
    t18 = (t10 & 1);
    *((unsigned int *)t5) = t18;
    t12 = (t0 + 1784);
    t14 = (t0 + 1784);
    t16 = (t14 + 44U);
    t17 = *((char **)t16);
    t30 = (t0 + 1600);
    t31 = (t30 + 36U);
    t37 = *((char **)t31);
    t38 = ((char*)((ng3)));
    memset(t41, 0, 8);
    xsi_vlog_signed_minus(t41, 32, t37, 32, t38, 32);
    t39 = ((char*)((ng6)));
    memset(t43, 0, 8);
    xsi_vlog_signed_multiply(t43, 32, t41, 32, t39, 32);
    xsi_vlog_generic_convert_bit_index(t15, t17, 2, t43, 32, 1);
    t40 = (t15 + 4);
    t19 = *((unsigned int *)t40);
    t51 = (!(t19));
    if (t51 == 1)
        goto LAB48;

LAB49:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 1968);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t13, 0, 8);
    t5 = (t13 + 4);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 1);
    t8 = (t7 & 1);
    *((unsigned int *)t13) = t8;
    t9 = *((unsigned int *)t11);
    t10 = (t9 >> 1);
    t18 = (t10 & 1);
    *((unsigned int *)t5) = t18;
    t12 = (t0 + 1784);
    t14 = (t0 + 1784);
    t16 = (t14 + 44U);
    t17 = *((char **)t16);
    t30 = (t0 + 1600);
    t31 = (t30 + 36U);
    t37 = *((char **)t31);
    t38 = ((char*)((ng3)));
    memset(t41, 0, 8);
    xsi_vlog_signed_minus(t41, 32, t37, 32, t38, 32);
    t39 = ((char*)((ng6)));
    memset(t43, 0, 8);
    xsi_vlog_signed_multiply(t43, 32, t41, 32, t39, 32);
    t40 = ((char*)((ng3)));
    memset(t45, 0, 8);
    xsi_vlog_signed_add(t45, 32, t43, 32, t40, 32);
    xsi_vlog_generic_convert_bit_index(t15, t17, 2, t45, 32, 1);
    t42 = (t15 + 4);
    t19 = *((unsigned int *)t42);
    t51 = (!(t19));
    if (t51 == 1)
        goto LAB50;

LAB51:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 1968);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t13, 0, 8);
    t5 = (t13 + 4);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 2);
    t8 = (t7 & 1);
    *((unsigned int *)t13) = t8;
    t9 = *((unsigned int *)t11);
    t10 = (t9 >> 2);
    t18 = (t10 & 1);
    *((unsigned int *)t5) = t18;
    t12 = (t0 + 1784);
    t14 = (t0 + 1784);
    t16 = (t14 + 44U);
    t17 = *((char **)t16);
    t30 = (t0 + 1600);
    t31 = (t30 + 36U);
    t37 = *((char **)t31);
    t38 = ((char*)((ng3)));
    memset(t41, 0, 8);
    xsi_vlog_signed_minus(t41, 32, t37, 32, t38, 32);
    t39 = ((char*)((ng6)));
    memset(t43, 0, 8);
    xsi_vlog_signed_multiply(t43, 32, t41, 32, t39, 32);
    t40 = ((char*)((ng7)));
    memset(t45, 0, 8);
    xsi_vlog_signed_add(t45, 32, t43, 32, t40, 32);
    xsi_vlog_generic_convert_bit_index(t15, t17, 2, t45, 32, 1);
    t42 = (t15 + 4);
    t19 = *((unsigned int *)t42);
    t51 = (!(t19));
    if (t51 == 1)
        goto LAB52;

LAB53:    xsi_set_current_line(77, ng0);
    t2 = (t0 + 1968);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t13, 0, 8);
    t5 = (t13 + 4);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 3);
    t8 = (t7 & 1);
    *((unsigned int *)t13) = t8;
    t9 = *((unsigned int *)t11);
    t10 = (t9 >> 3);
    t18 = (t10 & 1);
    *((unsigned int *)t5) = t18;
    t12 = (t0 + 1784);
    t14 = (t0 + 1784);
    t16 = (t14 + 44U);
    t17 = *((char **)t16);
    t30 = (t0 + 1600);
    t31 = (t30 + 36U);
    t37 = *((char **)t31);
    t38 = ((char*)((ng3)));
    memset(t41, 0, 8);
    xsi_vlog_signed_minus(t41, 32, t37, 32, t38, 32);
    t39 = ((char*)((ng6)));
    memset(t43, 0, 8);
    xsi_vlog_signed_multiply(t43, 32, t41, 32, t39, 32);
    t40 = ((char*)((ng2)));
    memset(t45, 0, 8);
    xsi_vlog_signed_add(t45, 32, t43, 32, t40, 32);
    xsi_vlog_generic_convert_bit_index(t15, t17, 2, t45, 32, 1);
    t42 = (t15 + 4);
    t19 = *((unsigned int *)t42);
    t51 = (!(t19));
    if (t51 == 1)
        goto LAB54;

LAB55:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 1600);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_signed_add(t13, 32, t4, 32, t5, 32);
    t11 = (t0 + 1600);
    xsi_vlogvar_assign_value(t11, t13, 0, 0, 32);
    goto LAB33;

LAB37:    xsi_vlogvar_assign_value(t44, t15, 0, *((unsigned int *)t45), 1);
    goto LAB38;

LAB39:    xsi_vlogvar_assign_value(t38, t13, 0, *((unsigned int *)t45), 1);
    goto LAB40;

LAB41:    xsi_vlogvar_assign_value(t38, t13, 0, *((unsigned int *)t45), 1);
    goto LAB42;

LAB43:    xsi_vlogvar_assign_value(t38, t13, 0, *((unsigned int *)t45), 1);
    goto LAB44;

LAB47:    t30 = (t0 + 2768U);
    *((char **)t30) = &&LAB45;
    goto LAB1;

LAB48:    xsi_vlogvar_assign_value(t12, t13, 0, *((unsigned int *)t15), 1);
    goto LAB49;

LAB50:    xsi_vlogvar_assign_value(t12, t13, 0, *((unsigned int *)t15), 1);
    goto LAB51;

LAB52:    xsi_vlogvar_assign_value(t12, t13, 0, *((unsigned int *)t15), 1);
    goto LAB53;

LAB54:    xsi_vlogvar_assign_value(t12, t13, 0, *((unsigned int *)t15), 1);
    goto LAB55;

LAB56:    xsi_vlogvar_assign_value(t12, t13, 0, *((unsigned int *)t15), 1);
    goto LAB57;

}


extern void work_m_00000000002345315664_3305719485_init()
{
	static char *pe[] = {(void *)Always_50_0};
	static char *se[] = {(void *)sp_CORRECT};
	xsi_register_didat("work_m_00000000002345315664_3305719485", "isim/main_isim_beh.exe.sim/work/m_00000000002345315664_3305719485.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
