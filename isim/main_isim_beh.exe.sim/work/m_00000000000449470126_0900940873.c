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
static const char *ng0 = "C:/Work/workspace/Xilinx/control_3/control_3/keyboard.v";
static unsigned int ng1[] = {1U, 0U};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {4U, 0U};
static unsigned int ng5[] = {8U, 0U};
static unsigned int ng6[] = {3U, 0U};
static unsigned int ng7[] = {15U, 15U};
static unsigned int ng8[] = {5U, 0U};
static unsigned int ng9[] = {6U, 0U};
static unsigned int ng10[] = {7U, 0U};
static unsigned int ng11[] = {9U, 0U};
static unsigned int ng12[] = {10U, 0U};
static unsigned int ng13[] = {11U, 0U};
static unsigned int ng14[] = {12U, 0U};
static unsigned int ng15[] = {13U, 0U};
static unsigned int ng16[] = {14U, 0U};
static unsigned int ng17[] = {15U, 0U};
static int ng18[] = {1, 0};
static int ng19[] = {0, 0};



static int sp_to_KEYCODE(char *t1, char *t2)
{
    char t3[8];
    char t17[8];
    char t33[8];
    char t34[8];
    char t35[8];
    int t0;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    int t16;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    int t30;
    char *t31;
    char *t32;

LAB0:    t0 = 1;
    xsi_set_current_line(48, ng0);

LAB2:    xsi_set_current_line(49, ng0);
    t4 = (t1 + 2048);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t3 + 4);
    t8 = (t6 + 4);
    t9 = *((unsigned int *)t6);
    t10 = (t9 >> 4);
    *((unsigned int *)t3) = t10;
    t11 = *((unsigned int *)t8);
    t12 = (t11 >> 4);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 15U);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 & 15U);

LAB3:    t15 = ((char*)((ng1)));
    t16 = xsi_vlog_unsigned_case_compare(t3, 4, t15, 4);
    if (t16 == 1)
        goto LAB4;

LAB5:    t4 = ((char*)((ng3)));
    t16 = xsi_vlog_unsigned_case_compare(t3, 4, t4, 4);
    if (t16 == 1)
        goto LAB6;

LAB7:    t4 = ((char*)((ng4)));
    t16 = xsi_vlog_unsigned_case_compare(t3, 4, t4, 4);
    if (t16 == 1)
        goto LAB8;

LAB9:    t4 = ((char*)((ng5)));
    t16 = xsi_vlog_unsigned_case_compare(t3, 4, t4, 4);
    if (t16 == 1)
        goto LAB10;

LAB11:
LAB13:
LAB12:    xsi_set_current_line(86, ng0);
    t4 = ((char*)((ng7)));
    t5 = (t1 + 1956);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 4);

LAB14:    t0 = 0;

LAB1:    return t0;
LAB4:    xsi_set_current_line(50, ng0);

LAB15:    xsi_set_current_line(51, ng0);
    t18 = (t1 + 2048);
    t19 = (t18 + 36U);
    t20 = *((char **)t19);
    memset(t17, 0, 8);
    t21 = (t17 + 4);
    t22 = (t20 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (t23 >> 0);
    *((unsigned int *)t17) = t24;
    t25 = *((unsigned int *)t22);
    t26 = (t25 >> 0);
    *((unsigned int *)t21) = t26;
    t27 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t27 & 15U);
    t28 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t28 & 15U);

LAB16:    t29 = ((char*)((ng1)));
    t30 = xsi_vlog_unsigned_case_compare(t17, 4, t29, 4);
    if (t30 == 1)
        goto LAB17;

LAB18:    t4 = ((char*)((ng3)));
    t16 = xsi_vlog_unsigned_case_compare(t17, 4, t4, 4);
    if (t16 == 1)
        goto LAB19;

LAB20:    t4 = ((char*)((ng4)));
    t16 = xsi_vlog_unsigned_case_compare(t17, 4, t4, 4);
    if (t16 == 1)
        goto LAB21;

LAB22:    t4 = ((char*)((ng5)));
    t16 = xsi_vlog_unsigned_case_compare(t17, 4, t4, 4);
    if (t16 == 1)
        goto LAB23;

LAB24:
LAB26:
LAB25:    xsi_set_current_line(56, ng0);
    t4 = ((char*)((ng7)));
    t5 = (t1 + 1956);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 4);

LAB27:    goto LAB14;

LAB6:    xsi_set_current_line(59, ng0);

LAB28:    xsi_set_current_line(60, ng0);
    t5 = (t1 + 2048);
    t6 = (t5 + 36U);
    t7 = *((char **)t6);
    memset(t33, 0, 8);
    t8 = (t33 + 4);
    t15 = (t7 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 0);
    *((unsigned int *)t33) = t10;
    t11 = *((unsigned int *)t15);
    t12 = (t11 >> 0);
    *((unsigned int *)t8) = t12;
    t13 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t13 & 15U);
    t14 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t14 & 15U);

LAB29:    t18 = ((char*)((ng1)));
    t30 = xsi_vlog_unsigned_case_compare(t33, 4, t18, 4);
    if (t30 == 1)
        goto LAB30;

LAB31:    t4 = ((char*)((ng3)));
    t16 = xsi_vlog_unsigned_case_compare(t33, 4, t4, 4);
    if (t16 == 1)
        goto LAB32;

LAB33:    t4 = ((char*)((ng4)));
    t16 = xsi_vlog_unsigned_case_compare(t33, 4, t4, 4);
    if (t16 == 1)
        goto LAB34;

LAB35:    t4 = ((char*)((ng5)));
    t16 = xsi_vlog_unsigned_case_compare(t33, 4, t4, 4);
    if (t16 == 1)
        goto LAB36;

LAB37:
LAB39:
LAB38:    xsi_set_current_line(65, ng0);
    t4 = ((char*)((ng7)));
    t5 = (t1 + 1956);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 4);

LAB40:    goto LAB14;

LAB8:    xsi_set_current_line(68, ng0);

LAB41:    xsi_set_current_line(69, ng0);
    t5 = (t1 + 2048);
    t6 = (t5 + 36U);
    t7 = *((char **)t6);
    memset(t34, 0, 8);
    t8 = (t34 + 4);
    t15 = (t7 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 0);
    *((unsigned int *)t34) = t10;
    t11 = *((unsigned int *)t15);
    t12 = (t11 >> 0);
    *((unsigned int *)t8) = t12;
    t13 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t13 & 15U);
    t14 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t14 & 15U);

LAB42:    t18 = ((char*)((ng1)));
    t30 = xsi_vlog_unsigned_case_compare(t34, 4, t18, 4);
    if (t30 == 1)
        goto LAB43;

LAB44:    t4 = ((char*)((ng3)));
    t16 = xsi_vlog_unsigned_case_compare(t34, 4, t4, 4);
    if (t16 == 1)
        goto LAB45;

LAB46:    t4 = ((char*)((ng4)));
    t16 = xsi_vlog_unsigned_case_compare(t34, 4, t4, 4);
    if (t16 == 1)
        goto LAB47;

LAB48:    t4 = ((char*)((ng5)));
    t16 = xsi_vlog_unsigned_case_compare(t34, 4, t4, 4);
    if (t16 == 1)
        goto LAB49;

LAB50:
LAB52:
LAB51:    xsi_set_current_line(74, ng0);
    t4 = ((char*)((ng7)));
    t5 = (t1 + 1956);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 4);

LAB53:    goto LAB14;

LAB10:    xsi_set_current_line(77, ng0);

LAB54:    xsi_set_current_line(78, ng0);
    t5 = (t1 + 2048);
    t6 = (t5 + 36U);
    t7 = *((char **)t6);
    memset(t35, 0, 8);
    t8 = (t35 + 4);
    t15 = (t7 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 0);
    *((unsigned int *)t35) = t10;
    t11 = *((unsigned int *)t15);
    t12 = (t11 >> 0);
    *((unsigned int *)t8) = t12;
    t13 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t13 & 15U);
    t14 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t14 & 15U);

LAB55:    t18 = ((char*)((ng1)));
    t30 = xsi_vlog_unsigned_case_compare(t35, 4, t18, 4);
    if (t30 == 1)
        goto LAB56;

LAB57:    t4 = ((char*)((ng3)));
    t16 = xsi_vlog_unsigned_case_compare(t35, 4, t4, 4);
    if (t16 == 1)
        goto LAB58;

LAB59:    t4 = ((char*)((ng4)));
    t16 = xsi_vlog_unsigned_case_compare(t35, 4, t4, 4);
    if (t16 == 1)
        goto LAB60;

LAB61:    t4 = ((char*)((ng5)));
    t16 = xsi_vlog_unsigned_case_compare(t35, 4, t4, 4);
    if (t16 == 1)
        goto LAB62;

LAB63:
LAB65:
LAB64:    xsi_set_current_line(83, ng0);
    t4 = ((char*)((ng7)));
    t5 = (t1 + 1956);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 4);

LAB66:    goto LAB14;

LAB17:    xsi_set_current_line(52, ng0);
    t31 = ((char*)((ng2)));
    t32 = (t1 + 1956);
    xsi_vlogvar_assign_value(t32, t31, 0, 0, 4);
    goto LAB27;

LAB19:    xsi_set_current_line(53, ng0);
    t5 = ((char*)((ng1)));
    t6 = (t1 + 1956);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 4);
    goto LAB27;

LAB21:    xsi_set_current_line(54, ng0);
    t5 = ((char*)((ng3)));
    t6 = (t1 + 1956);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 4);
    goto LAB27;

LAB23:    xsi_set_current_line(55, ng0);
    t5 = ((char*)((ng6)));
    t6 = (t1 + 1956);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 4);
    goto LAB27;

LAB30:    xsi_set_current_line(61, ng0);
    t19 = ((char*)((ng4)));
    t20 = (t1 + 1956);
    xsi_vlogvar_assign_value(t20, t19, 0, 0, 4);
    goto LAB40;

LAB32:    xsi_set_current_line(62, ng0);
    t5 = ((char*)((ng8)));
    t6 = (t1 + 1956);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 4);
    goto LAB40;

LAB34:    xsi_set_current_line(63, ng0);
    t5 = ((char*)((ng9)));
    t6 = (t1 + 1956);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 4);
    goto LAB40;

LAB36:    xsi_set_current_line(64, ng0);
    t5 = ((char*)((ng10)));
    t6 = (t1 + 1956);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 4);
    goto LAB40;

LAB43:    xsi_set_current_line(70, ng0);
    t19 = ((char*)((ng5)));
    t20 = (t1 + 1956);
    xsi_vlogvar_assign_value(t20, t19, 0, 0, 4);
    goto LAB53;

LAB45:    xsi_set_current_line(71, ng0);
    t5 = ((char*)((ng11)));
    t6 = (t1 + 1956);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 4);
    goto LAB53;

LAB47:    xsi_set_current_line(72, ng0);
    t5 = ((char*)((ng12)));
    t6 = (t1 + 1956);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 4);
    goto LAB53;

LAB49:    xsi_set_current_line(73, ng0);
    t5 = ((char*)((ng13)));
    t6 = (t1 + 1956);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 4);
    goto LAB53;

LAB56:    xsi_set_current_line(79, ng0);
    t19 = ((char*)((ng14)));
    t20 = (t1 + 1956);
    xsi_vlogvar_assign_value(t20, t19, 0, 0, 4);
    goto LAB66;

LAB58:    xsi_set_current_line(80, ng0);
    t5 = ((char*)((ng15)));
    t6 = (t1 + 1956);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 4);
    goto LAB66;

LAB60:    xsi_set_current_line(81, ng0);
    t5 = ((char*)((ng16)));
    t6 = (t1 + 1956);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 4);
    goto LAB66;

LAB62:    xsi_set_current_line(82, ng0);
    t5 = ((char*)((ng17)));
    t6 = (t1 + 1956);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 4);
    goto LAB66;

}

static void Always_91_0(char *t0)
{
    char t13[8];
    char t15[8];
    char t44[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t14;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t61;
    char *t62;
    char *t63;
    char *t64;
    char *t65;
    char *t66;
    char *t67;
    char *t68;
    char *t69;
    char *t70;
    char *t71;
    char *t72;

LAB0:    t1 = (t0 + 2572U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 2768);
    *((int *)t2) = 1;
    t3 = (t0 + 2600);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(91, ng0);

LAB5:    xsi_set_current_line(92, ng0);
    t4 = (t0 + 1496);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t7, 4);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng4)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB11;

LAB12:
LAB14:
LAB13:    xsi_set_current_line(96, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1496);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB15:    xsi_set_current_line(99, ng0);
    t2 = (t0 + 1268U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t13 + 4);
    t4 = (t3 + 4);
    t16 = *((unsigned int *)t3);
    t17 = (t16 >> 0);
    t18 = (t17 & 1);
    *((unsigned int *)t13) = t18;
    t22 = *((unsigned int *)t4);
    t23 = (t22 >> 0);
    t24 = (t23 & 1);
    *((unsigned int *)t2) = t24;
    t5 = ((char*)((ng2)));
    memset(t15, 0, 8);
    t7 = (t5 + 4);
    t25 = *((unsigned int *)t7);
    t26 = (~(t25));
    t27 = *((unsigned int *)t5);
    t28 = (t27 & t26);
    t31 = (t28 & 1U);
    if (t31 != 0)
        goto LAB28;

LAB26:    if (*((unsigned int *)t7) == 0)
        goto LAB25;

LAB27:    t9 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t9) = 1;

LAB28:    t10 = (t15 + 4);
    t11 = (t5 + 4);
    t32 = *((unsigned int *)t5);
    t33 = (~(t32));
    *((unsigned int *)t15) = t33;
    *((unsigned int *)t10) = 0;
    if (*((unsigned int *)t11) != 0)
        goto LAB30;

LAB29:    t40 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t40 & 1U);
    t41 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t41 & 1U);
    memset(t44, 0, 8);
    t12 = (t13 + 4);
    t14 = (t15 + 4);
    t42 = *((unsigned int *)t13);
    t45 = *((unsigned int *)t15);
    t46 = (t42 ^ t45);
    t47 = *((unsigned int *)t12);
    t48 = *((unsigned int *)t14);
    t49 = (t47 ^ t48);
    t50 = (t46 | t49);
    t51 = *((unsigned int *)t12);
    t52 = *((unsigned int *)t14);
    t53 = (t51 | t52);
    t54 = (~(t53));
    t55 = (t50 & t54);
    if (t55 != 0)
        goto LAB34;

LAB31:    if (t53 != 0)
        goto LAB33;

LAB32:    *((unsigned int *)t44) = 1;

LAB34:    t20 = (t44 + 4);
    t56 = *((unsigned int *)t20);
    t57 = (~(t56));
    t58 = *((unsigned int *)t44);
    t59 = (t58 & t57);
    t60 = (t59 != 0);
    if (t60 > 0)
        goto LAB35;

LAB36:    xsi_set_current_line(115, ng0);
    t2 = (t0 + 1268U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t13 + 4);
    t5 = (t3 + 4);
    t16 = *((unsigned int *)t3);
    t17 = (t16 >> 1);
    t18 = (t17 & 1);
    *((unsigned int *)t13) = t18;
    t22 = *((unsigned int *)t5);
    t23 = (t22 >> 1);
    t24 = (t23 & 1);
    *((unsigned int *)t2) = t24;
    t7 = ((char*)((ng2)));
    memset(t15, 0, 8);
    t9 = (t7 + 4);
    t25 = *((unsigned int *)t9);
    t26 = (~(t25));
    t27 = *((unsigned int *)t7);
    t28 = (t27 & t26);
    t31 = (t28 & 1U);
    if (t31 != 0)
        goto LAB62;

LAB60:    if (*((unsigned int *)t9) == 0)
        goto LAB59;

LAB61:    t10 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t10) = 1;

LAB62:    t11 = (t15 + 4);
    t12 = (t7 + 4);
    t32 = *((unsigned int *)t7);
    t33 = (~(t32));
    *((unsigned int *)t15) = t33;
    *((unsigned int *)t11) = 0;
    if (*((unsigned int *)t12) != 0)
        goto LAB64;

LAB63:    t40 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t40 & 1U);
    t41 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t41 & 1U);
    memset(t44, 0, 8);
    t14 = (t13 + 4);
    t19 = (t15 + 4);
    t42 = *((unsigned int *)t13);
    t45 = *((unsigned int *)t15);
    t46 = (t42 ^ t45);
    t47 = *((unsigned int *)t14);
    t48 = *((unsigned int *)t19);
    t49 = (t47 ^ t48);
    t50 = (t46 | t49);
    t51 = *((unsigned int *)t14);
    t52 = *((unsigned int *)t19);
    t53 = (t51 | t52);
    t54 = (~(t53));
    t55 = (t50 & t54);
    if (t55 != 0)
        goto LAB68;

LAB65:    if (t53 != 0)
        goto LAB67;

LAB66:    *((unsigned int *)t44) = 1;

LAB68:    t21 = (t44 + 4);
    t56 = *((unsigned int *)t21);
    t57 = (~(t56));
    t58 = *((unsigned int *)t44);
    t59 = (t58 & t57);
    t60 = (t59 != 0);
    if (t60 > 0)
        goto LAB69;

LAB70:    xsi_set_current_line(131, ng0);
    t2 = (t0 + 1268U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t13 + 4);
    t7 = (t3 + 4);
    t16 = *((unsigned int *)t3);
    t17 = (t16 >> 2);
    t18 = (t17 & 1);
    *((unsigned int *)t13) = t18;
    t22 = *((unsigned int *)t7);
    t23 = (t22 >> 2);
    t24 = (t23 & 1);
    *((unsigned int *)t2) = t24;
    t9 = ((char*)((ng2)));
    memset(t15, 0, 8);
    t10 = (t9 + 4);
    t25 = *((unsigned int *)t10);
    t26 = (~(t25));
    t27 = *((unsigned int *)t9);
    t28 = (t27 & t26);
    t31 = (t28 & 1U);
    if (t31 != 0)
        goto LAB96;

LAB94:    if (*((unsigned int *)t10) == 0)
        goto LAB93;

LAB95:    t11 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t11) = 1;

LAB96:    t12 = (t15 + 4);
    t14 = (t9 + 4);
    t32 = *((unsigned int *)t9);
    t33 = (~(t32));
    *((unsigned int *)t15) = t33;
    *((unsigned int *)t12) = 0;
    if (*((unsigned int *)t14) != 0)
        goto LAB98;

LAB97:    t40 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t40 & 1U);
    t41 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t41 & 1U);
    memset(t44, 0, 8);
    t19 = (t13 + 4);
    t20 = (t15 + 4);
    t42 = *((unsigned int *)t13);
    t45 = *((unsigned int *)t15);
    t46 = (t42 ^ t45);
    t47 = *((unsigned int *)t19);
    t48 = *((unsigned int *)t20);
    t49 = (t47 ^ t48);
    t50 = (t46 | t49);
    t51 = *((unsigned int *)t19);
    t52 = *((unsigned int *)t20);
    t53 = (t51 | t52);
    t54 = (~(t53));
    t55 = (t50 & t54);
    if (t55 != 0)
        goto LAB102;

LAB99:    if (t53 != 0)
        goto LAB101;

LAB100:    *((unsigned int *)t44) = 1;

LAB102:    t29 = (t44 + 4);
    t56 = *((unsigned int *)t29);
    t57 = (~(t56));
    t58 = *((unsigned int *)t44);
    t59 = (t58 & t57);
    t60 = (t59 != 0);
    if (t60 > 0)
        goto LAB103;

LAB104:    xsi_set_current_line(147, ng0);
    t2 = (t0 + 1268U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t13 + 4);
    t9 = (t3 + 4);
    t16 = *((unsigned int *)t3);
    t17 = (t16 >> 3);
    t18 = (t17 & 1);
    *((unsigned int *)t13) = t18;
    t22 = *((unsigned int *)t9);
    t23 = (t22 >> 3);
    t24 = (t23 & 1);
    *((unsigned int *)t2) = t24;
    t10 = ((char*)((ng2)));
    memset(t15, 0, 8);
    t11 = (t10 + 4);
    t25 = *((unsigned int *)t11);
    t26 = (~(t25));
    t27 = *((unsigned int *)t10);
    t28 = (t27 & t26);
    t31 = (t28 & 1U);
    if (t31 != 0)
        goto LAB130;

LAB128:    if (*((unsigned int *)t11) == 0)
        goto LAB127;

LAB129:    t12 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t12) = 1;

LAB130:    t14 = (t15 + 4);
    t19 = (t10 + 4);
    t32 = *((unsigned int *)t10);
    t33 = (~(t32));
    *((unsigned int *)t15) = t33;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t19) != 0)
        goto LAB132;

LAB131:    t40 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t40 & 1U);
    t41 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t41 & 1U);
    memset(t44, 0, 8);
    t20 = (t13 + 4);
    t21 = (t15 + 4);
    t42 = *((unsigned int *)t13);
    t45 = *((unsigned int *)t15);
    t46 = (t42 ^ t45);
    t47 = *((unsigned int *)t20);
    t48 = *((unsigned int *)t21);
    t49 = (t47 ^ t48);
    t50 = (t46 | t49);
    t51 = *((unsigned int *)t20);
    t52 = *((unsigned int *)t21);
    t53 = (t51 | t52);
    t54 = (~(t53));
    t55 = (t50 & t54);
    if (t55 != 0)
        goto LAB136;

LAB133:    if (t53 != 0)
        goto LAB135;

LAB134:    *((unsigned int *)t44) = 1;

LAB136:    t30 = (t44 + 4);
    t56 = *((unsigned int *)t30);
    t57 = (~(t56));
    t58 = *((unsigned int *)t44);
    t59 = (t58 & t57);
    t60 = (t59 != 0);
    if (t60 > 0)
        goto LAB137;

LAB138:    xsi_set_current_line(162, ng0);

LAB161:    xsi_set_current_line(163, ng0);
    t2 = (t0 + 1496);
    t3 = (t2 + 36U);
    t10 = *((char **)t3);
    t11 = (t0 + 1864);
    t12 = (t11 + 36U);
    t14 = *((char **)t12);
    memset(t13, 0, 8);
    t19 = (t10 + 4);
    t20 = (t14 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t14);
    t18 = (t16 ^ t17);
    t22 = *((unsigned int *)t19);
    t23 = *((unsigned int *)t20);
    t24 = (t22 ^ t23);
    t25 = (t18 | t24);
    t26 = *((unsigned int *)t19);
    t27 = *((unsigned int *)t20);
    t28 = (t26 | t27);
    t31 = (~(t28));
    t32 = (t25 & t31);
    if (t32 != 0)
        goto LAB165;

LAB162:    if (t28 != 0)
        goto LAB164;

LAB163:    *((unsigned int *)t13) = 1;

LAB165:    t29 = (t13 + 4);
    t33 = *((unsigned int *)t29);
    t35 = (~(t33));
    t36 = *((unsigned int *)t13);
    t37 = (t36 & t35);
    t39 = (t37 != 0);
    if (t39 > 0)
        goto LAB166;

LAB167:
LAB168:
LAB139:
LAB105:
LAB71:
LAB37:    goto LAB2;

LAB7:    xsi_set_current_line(93, ng0);
    t9 = (t0 + 1496);
    t10 = (t9 + 36U);
    t11 = *((char **)t10);
    t12 = ((char*)((ng18)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_lshift(t13, 4, t11, 4, t12, 32);
    t14 = ((char*)((ng2)));
    t16 = *((unsigned int *)t13);
    t17 = *((unsigned int *)t14);
    t18 = (t16 | t17);
    *((unsigned int *)t15) = t18;
    t19 = (t13 + 4);
    t20 = (t14 + 4);
    t21 = (t15 + 4);
    t22 = *((unsigned int *)t19);
    t23 = *((unsigned int *)t20);
    t24 = (t22 | t23);
    *((unsigned int *)t21) = t24;
    t25 = *((unsigned int *)t21);
    t26 = (t25 != 0);
    if (t26 == 1)
        goto LAB16;

LAB17:
LAB18:    t43 = (t0 + 1496);
    xsi_vlogvar_wait_assign_value(t43, t15, 0, 0, 4, 0LL);
    goto LAB15;

LAB9:    xsi_set_current_line(94, ng0);
    t3 = (t0 + 1496);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng18)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_lshift(t13, 4, t5, 4, t7, 32);
    t9 = ((char*)((ng2)));
    t16 = *((unsigned int *)t13);
    t17 = *((unsigned int *)t9);
    t18 = (t16 | t17);
    *((unsigned int *)t15) = t18;
    t10 = (t13 + 4);
    t11 = (t9 + 4);
    t12 = (t15 + 4);
    t22 = *((unsigned int *)t10);
    t23 = *((unsigned int *)t11);
    t24 = (t22 | t23);
    *((unsigned int *)t12) = t24;
    t25 = *((unsigned int *)t12);
    t26 = (t25 != 0);
    if (t26 == 1)
        goto LAB19;

LAB20:
LAB21:    t20 = (t0 + 1496);
    xsi_vlogvar_wait_assign_value(t20, t15, 0, 0, 4, 0LL);
    goto LAB15;

LAB11:    xsi_set_current_line(95, ng0);
    t3 = (t0 + 1496);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng18)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_lshift(t13, 4, t5, 4, t7, 32);
    t9 = ((char*)((ng2)));
    t16 = *((unsigned int *)t13);
    t17 = *((unsigned int *)t9);
    t18 = (t16 | t17);
    *((unsigned int *)t15) = t18;
    t10 = (t13 + 4);
    t11 = (t9 + 4);
    t12 = (t15 + 4);
    t22 = *((unsigned int *)t10);
    t23 = *((unsigned int *)t11);
    t24 = (t22 | t23);
    *((unsigned int *)t12) = t24;
    t25 = *((unsigned int *)t12);
    t26 = (t25 != 0);
    if (t26 == 1)
        goto LAB22;

LAB23:
LAB24:    t20 = (t0 + 1496);
    xsi_vlogvar_wait_assign_value(t20, t15, 0, 0, 4, 0LL);
    goto LAB15;

LAB16:    t27 = *((unsigned int *)t15);
    t28 = *((unsigned int *)t21);
    *((unsigned int *)t15) = (t27 | t28);
    t29 = (t13 + 4);
    t30 = (t14 + 4);
    t31 = *((unsigned int *)t29);
    t32 = (~(t31));
    t33 = *((unsigned int *)t13);
    t34 = (t33 & t32);
    t35 = *((unsigned int *)t30);
    t36 = (~(t35));
    t37 = *((unsigned int *)t14);
    t38 = (t37 & t36);
    t39 = (~(t34));
    t40 = (~(t38));
    t41 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t41 & t39);
    t42 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t42 & t40);
    goto LAB18;

LAB19:    t27 = *((unsigned int *)t15);
    t28 = *((unsigned int *)t12);
    *((unsigned int *)t15) = (t27 | t28);
    t14 = (t13 + 4);
    t19 = (t9 + 4);
    t31 = *((unsigned int *)t14);
    t32 = (~(t31));
    t33 = *((unsigned int *)t13);
    t34 = (t33 & t32);
    t35 = *((unsigned int *)t19);
    t36 = (~(t35));
    t37 = *((unsigned int *)t9);
    t38 = (t37 & t36);
    t39 = (~(t34));
    t40 = (~(t38));
    t41 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t41 & t39);
    t42 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t42 & t40);
    goto LAB21;

LAB22:    t27 = *((unsigned int *)t15);
    t28 = *((unsigned int *)t12);
    *((unsigned int *)t15) = (t27 | t28);
    t14 = (t13 + 4);
    t19 = (t9 + 4);
    t31 = *((unsigned int *)t14);
    t32 = (~(t31));
    t33 = *((unsigned int *)t13);
    t34 = (t33 & t32);
    t35 = *((unsigned int *)t19);
    t36 = (~(t35));
    t37 = *((unsigned int *)t9);
    t38 = (t37 & t36);
    t39 = (~(t34));
    t40 = (~(t38));
    t41 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t41 & t39);
    t42 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t42 & t40);
    goto LAB24;

LAB25:    *((unsigned int *)t15) = 1;
    goto LAB28;

LAB30:    t35 = *((unsigned int *)t15);
    t36 = *((unsigned int *)t11);
    *((unsigned int *)t15) = (t35 | t36);
    t37 = *((unsigned int *)t10);
    t39 = *((unsigned int *)t11);
    *((unsigned int *)t10) = (t37 | t39);
    goto LAB29;

LAB33:    t19 = (t44 + 4);
    *((unsigned int *)t44) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB34;

LAB35:    xsi_set_current_line(99, ng0);

LAB38:    xsi_set_current_line(100, ng0);
    t21 = (t0 + 1496);
    t29 = (t21 + 36U);
    t30 = *((char **)t29);
    t43 = (t0 + 1864);
    xsi_vlogvar_wait_assign_value(t43, t30, 0, 0, 4, 0LL);
    xsi_set_current_line(101, ng0);
    t2 = (t0 + 1772);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng18)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t4, 20, t5, 32);
    t7 = (t0 + 1772);
    xsi_vlogvar_wait_assign_value(t7, t13, 0, 0, 20, 0LL);
    xsi_set_current_line(102, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1864);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    memset(t15, 0, 8);
    t7 = (t15 + 4);
    t9 = (t5 + 4);
    t16 = *((unsigned int *)t5);
    t17 = (t16 >> 0);
    *((unsigned int *)t15) = t17;
    t18 = *((unsigned int *)t9);
    t22 = (t18 >> 0);
    *((unsigned int *)t7) = t22;
    t23 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t23 & 15U);
    t24 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t24 & 15U);
    xsi_vlogtype_concat(t13, 8, 8, 2U, t15, 4, t2, 4);
    t10 = (t0 + 2472);
    t11 = (t0 + 804);
    t12 = xsi_create_subprogram_invocation(t10, 0, t0, t11, 0, 0);
    t14 = (t0 + 2048);
    xsi_vlogvar_assign_value(t14, t13, 0, 0, 8);

LAB39:    t19 = (t0 + 2524);
    t20 = *((char **)t19);
    t21 = (t20 + 44U);
    t29 = *((char **)t21);
    t30 = (t29 + 148U);
    t43 = *((char **)t30);
    t61 = (t43 + 0U);
    t62 = *((char **)t61);
    t8 = ((int  (*)(char *, char *))t62)(t0, t20);
    if (t8 != 0)
        goto LAB41;

LAB40:    t20 = (t0 + 2524);
    t63 = *((char **)t20);
    t20 = (t0 + 1956);
    t64 = (t20 + 36U);
    t65 = *((char **)t64);
    memcpy(t44, t65, 8);
    t66 = (t0 + 804);
    t67 = (t0 + 2472);
    t68 = 0;
    xsi_delete_subprogram_invocation(t66, t63, t0, t67, t68);
    t69 = (t0 + 1588);
    xsi_vlogvar_wait_assign_value(t69, t44, 0, 0, 4, 0LL);
    xsi_set_current_line(103, ng0);
    t2 = (t0 + 1772);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);

LAB42:    t5 = (t0 + 344);
    t7 = *((char **)t5);
    t5 = (t0 + 424);
    t9 = *((char **)t5);
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t7, 32, t9, 32);
    t8 = xsi_vlog_unsigned_case_compare(t4, 20, t13, 32);
    if (t8 == 1)
        goto LAB43;

LAB44:    t2 = (t0 + 344);
    t3 = *((char **)t2);
    t8 = xsi_vlog_unsigned_case_compare(t4, 20, t3, 32);
    if (t8 == 1)
        goto LAB45;

LAB46:
LAB48:
LAB47:    xsi_set_current_line(110, ng0);

LAB58:    xsi_set_current_line(111, ng0);
    t2 = (t0 + 1680);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t7 = (t0 + 1680);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 1, 0LL);

LAB49:    goto LAB37;

LAB41:    t19 = (t0 + 2572U);
    *((char **)t19) = &&LAB39;
    goto LAB1;

LAB43:    xsi_set_current_line(104, ng0);

LAB50:    xsi_set_current_line(105, ng0);
    t5 = ((char*)((ng2)));
    t10 = (t0 + 1680);
    xsi_vlogvar_wait_assign_value(t10, t5, 0, 0, 1, 0LL);
    goto LAB49;

LAB45:    xsi_set_current_line(107, ng0);

LAB51:    xsi_set_current_line(108, ng0);
    t2 = ((char*)((ng2)));
    memset(t13, 0, 8);
    t5 = (t2 + 4);
    t16 = *((unsigned int *)t5);
    t17 = (~(t16));
    t18 = *((unsigned int *)t2);
    t22 = (t18 & t17);
    t23 = (t22 & 1U);
    if (t23 != 0)
        goto LAB55;

LAB53:    if (*((unsigned int *)t5) == 0)
        goto LAB52;

LAB54:    t7 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t7) = 1;

LAB55:    t9 = (t13 + 4);
    t10 = (t2 + 4);
    t24 = *((unsigned int *)t2);
    t25 = (~(t24));
    *((unsigned int *)t13) = t25;
    *((unsigned int *)t9) = 0;
    if (*((unsigned int *)t10) != 0)
        goto LAB57;

LAB56:    t32 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t32 & 1U);
    t33 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t33 & 1U);
    t11 = (t0 + 1680);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 1, 0LL);
    goto LAB49;

LAB52:    *((unsigned int *)t13) = 1;
    goto LAB55;

LAB57:    t26 = *((unsigned int *)t13);
    t27 = *((unsigned int *)t10);
    *((unsigned int *)t13) = (t26 | t27);
    t28 = *((unsigned int *)t9);
    t31 = *((unsigned int *)t10);
    *((unsigned int *)t9) = (t28 | t31);
    goto LAB56;

LAB59:    *((unsigned int *)t15) = 1;
    goto LAB62;

LAB64:    t35 = *((unsigned int *)t15);
    t36 = *((unsigned int *)t12);
    *((unsigned int *)t15) = (t35 | t36);
    t37 = *((unsigned int *)t11);
    t39 = *((unsigned int *)t12);
    *((unsigned int *)t11) = (t37 | t39);
    goto LAB63;

LAB67:    t20 = (t44 + 4);
    *((unsigned int *)t44) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB68;

LAB69:    xsi_set_current_line(115, ng0);

LAB72:    xsi_set_current_line(116, ng0);
    t29 = (t0 + 1496);
    t30 = (t29 + 36U);
    t43 = *((char **)t30);
    t61 = (t0 + 1864);
    xsi_vlogvar_wait_assign_value(t61, t43, 0, 0, 4, 0LL);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 1772);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t7 = ((char*)((ng18)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t5, 20, t7, 32);
    t9 = (t0 + 1772);
    xsi_vlogvar_wait_assign_value(t9, t13, 0, 0, 20, 0LL);
    xsi_set_current_line(118, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1864);
    t5 = (t3 + 36U);
    t7 = *((char **)t5);
    memset(t15, 0, 8);
    t9 = (t15 + 4);
    t10 = (t7 + 4);
    t16 = *((unsigned int *)t7);
    t17 = (t16 >> 0);
    *((unsigned int *)t15) = t17;
    t18 = *((unsigned int *)t10);
    t22 = (t18 >> 0);
    *((unsigned int *)t9) = t22;
    t23 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t23 & 15U);
    t24 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t24 & 15U);
    xsi_vlogtype_concat(t13, 8, 8, 2U, t15, 4, t2, 4);
    t11 = (t0 + 2472);
    t12 = (t0 + 804);
    t14 = xsi_create_subprogram_invocation(t11, 0, t0, t12, 0, 0);
    t19 = (t0 + 2048);
    xsi_vlogvar_assign_value(t19, t13, 0, 0, 8);

LAB73:    t20 = (t0 + 2524);
    t21 = *((char **)t20);
    t29 = (t21 + 44U);
    t30 = *((char **)t29);
    t43 = (t30 + 148U);
    t61 = *((char **)t43);
    t62 = (t61 + 0U);
    t63 = *((char **)t62);
    t8 = ((int  (*)(char *, char *))t63)(t0, t21);
    if (t8 != 0)
        goto LAB75;

LAB74:    t21 = (t0 + 2524);
    t64 = *((char **)t21);
    t21 = (t0 + 1956);
    t65 = (t21 + 36U);
    t66 = *((char **)t65);
    memcpy(t44, t66, 8);
    t67 = (t0 + 804);
    t68 = (t0 + 2472);
    t69 = 0;
    xsi_delete_subprogram_invocation(t67, t64, t0, t68, t69);
    t70 = (t0 + 1588);
    xsi_vlogvar_wait_assign_value(t70, t44, 0, 0, 4, 0LL);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 1772);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);

LAB76:    t7 = (t0 + 344);
    t9 = *((char **)t7);
    t7 = (t0 + 424);
    t10 = *((char **)t7);
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t9, 32, t10, 32);
    t8 = xsi_vlog_unsigned_case_compare(t5, 20, t13, 32);
    if (t8 == 1)
        goto LAB77;

LAB78:    t2 = (t0 + 344);
    t3 = *((char **)t2);
    t8 = xsi_vlog_unsigned_case_compare(t5, 20, t3, 32);
    if (t8 == 1)
        goto LAB79;

LAB80:
LAB82:
LAB81:    xsi_set_current_line(126, ng0);

LAB92:    xsi_set_current_line(127, ng0);
    t2 = (t0 + 1680);
    t3 = (t2 + 36U);
    t7 = *((char **)t3);
    t9 = (t0 + 1680);
    xsi_vlogvar_wait_assign_value(t9, t7, 0, 0, 1, 0LL);

LAB83:    goto LAB71;

LAB75:    t20 = (t0 + 2572U);
    *((char **)t20) = &&LAB73;
    goto LAB1;

LAB77:    xsi_set_current_line(120, ng0);

LAB84:    xsi_set_current_line(121, ng0);
    t7 = ((char*)((ng2)));
    t11 = (t0 + 1680);
    xsi_vlogvar_wait_assign_value(t11, t7, 0, 0, 1, 0LL);
    goto LAB83;

LAB79:    xsi_set_current_line(123, ng0);

LAB85:    xsi_set_current_line(124, ng0);
    t2 = ((char*)((ng2)));
    memset(t13, 0, 8);
    t7 = (t2 + 4);
    t16 = *((unsigned int *)t7);
    t17 = (~(t16));
    t18 = *((unsigned int *)t2);
    t22 = (t18 & t17);
    t23 = (t22 & 1U);
    if (t23 != 0)
        goto LAB89;

LAB87:    if (*((unsigned int *)t7) == 0)
        goto LAB86;

LAB88:    t9 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t9) = 1;

LAB89:    t10 = (t13 + 4);
    t11 = (t2 + 4);
    t24 = *((unsigned int *)t2);
    t25 = (~(t24));
    *((unsigned int *)t13) = t25;
    *((unsigned int *)t10) = 0;
    if (*((unsigned int *)t11) != 0)
        goto LAB91;

LAB90:    t32 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t32 & 1U);
    t33 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t33 & 1U);
    t12 = (t0 + 1680);
    xsi_vlogvar_wait_assign_value(t12, t13, 0, 0, 1, 0LL);
    goto LAB83;

LAB86:    *((unsigned int *)t13) = 1;
    goto LAB89;

LAB91:    t26 = *((unsigned int *)t13);
    t27 = *((unsigned int *)t11);
    *((unsigned int *)t13) = (t26 | t27);
    t28 = *((unsigned int *)t10);
    t31 = *((unsigned int *)t11);
    *((unsigned int *)t10) = (t28 | t31);
    goto LAB90;

LAB93:    *((unsigned int *)t15) = 1;
    goto LAB96;

LAB98:    t35 = *((unsigned int *)t15);
    t36 = *((unsigned int *)t14);
    *((unsigned int *)t15) = (t35 | t36);
    t37 = *((unsigned int *)t12);
    t39 = *((unsigned int *)t14);
    *((unsigned int *)t12) = (t37 | t39);
    goto LAB97;

LAB101:    t21 = (t44 + 4);
    *((unsigned int *)t44) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB102;

LAB103:    xsi_set_current_line(131, ng0);

LAB106:    xsi_set_current_line(132, ng0);
    t30 = (t0 + 1496);
    t43 = (t30 + 36U);
    t61 = *((char **)t43);
    t62 = (t0 + 1864);
    xsi_vlogvar_wait_assign_value(t62, t61, 0, 0, 4, 0LL);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 1772);
    t3 = (t2 + 36U);
    t7 = *((char **)t3);
    t9 = ((char*)((ng18)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t7, 20, t9, 32);
    t10 = (t0 + 1772);
    xsi_vlogvar_wait_assign_value(t10, t13, 0, 0, 20, 0LL);
    xsi_set_current_line(134, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1864);
    t7 = (t3 + 36U);
    t9 = *((char **)t7);
    memset(t15, 0, 8);
    t10 = (t15 + 4);
    t11 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    t17 = (t16 >> 0);
    *((unsigned int *)t15) = t17;
    t18 = *((unsigned int *)t11);
    t22 = (t18 >> 0);
    *((unsigned int *)t10) = t22;
    t23 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t23 & 15U);
    t24 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t24 & 15U);
    xsi_vlogtype_concat(t13, 8, 8, 2U, t15, 4, t2, 4);
    t12 = (t0 + 2472);
    t14 = (t0 + 804);
    t19 = xsi_create_subprogram_invocation(t12, 0, t0, t14, 0, 0);
    t20 = (t0 + 2048);
    xsi_vlogvar_assign_value(t20, t13, 0, 0, 8);

LAB107:    t21 = (t0 + 2524);
    t29 = *((char **)t21);
    t30 = (t29 + 44U);
    t43 = *((char **)t30);
    t61 = (t43 + 148U);
    t62 = *((char **)t61);
    t63 = (t62 + 0U);
    t64 = *((char **)t63);
    t8 = ((int  (*)(char *, char *))t64)(t0, t29);
    if (t8 != 0)
        goto LAB109;

LAB108:    t29 = (t0 + 2524);
    t65 = *((char **)t29);
    t29 = (t0 + 1956);
    t66 = (t29 + 36U);
    t67 = *((char **)t66);
    memcpy(t44, t67, 8);
    t68 = (t0 + 804);
    t69 = (t0 + 2472);
    t70 = 0;
    xsi_delete_subprogram_invocation(t68, t65, t0, t69, t70);
    t71 = (t0 + 1588);
    xsi_vlogvar_wait_assign_value(t71, t44, 0, 0, 4, 0LL);
    xsi_set_current_line(135, ng0);
    t2 = (t0 + 1772);
    t3 = (t2 + 36U);
    t7 = *((char **)t3);

LAB110:    t9 = (t0 + 344);
    t10 = *((char **)t9);
    t9 = (t0 + 424);
    t11 = *((char **)t9);
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t10, 32, t11, 32);
    t8 = xsi_vlog_unsigned_case_compare(t7, 20, t13, 32);
    if (t8 == 1)
        goto LAB111;

LAB112:    t2 = (t0 + 344);
    t3 = *((char **)t2);
    t8 = xsi_vlog_unsigned_case_compare(t7, 20, t3, 32);
    if (t8 == 1)
        goto LAB113;

LAB114:
LAB116:
LAB115:    xsi_set_current_line(142, ng0);

LAB126:    xsi_set_current_line(143, ng0);
    t2 = (t0 + 1680);
    t3 = (t2 + 36U);
    t9 = *((char **)t3);
    t10 = (t0 + 1680);
    xsi_vlogvar_wait_assign_value(t10, t9, 0, 0, 1, 0LL);

LAB117:    goto LAB105;

LAB109:    t21 = (t0 + 2572U);
    *((char **)t21) = &&LAB107;
    goto LAB1;

LAB111:    xsi_set_current_line(136, ng0);

LAB118:    xsi_set_current_line(137, ng0);
    t9 = ((char*)((ng2)));
    t12 = (t0 + 1680);
    xsi_vlogvar_wait_assign_value(t12, t9, 0, 0, 1, 0LL);
    goto LAB117;

LAB113:    xsi_set_current_line(139, ng0);

LAB119:    xsi_set_current_line(140, ng0);
    t2 = ((char*)((ng2)));
    memset(t13, 0, 8);
    t9 = (t2 + 4);
    t16 = *((unsigned int *)t9);
    t17 = (~(t16));
    t18 = *((unsigned int *)t2);
    t22 = (t18 & t17);
    t23 = (t22 & 1U);
    if (t23 != 0)
        goto LAB123;

LAB121:    if (*((unsigned int *)t9) == 0)
        goto LAB120;

LAB122:    t10 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t10) = 1;

LAB123:    t11 = (t13 + 4);
    t12 = (t2 + 4);
    t24 = *((unsigned int *)t2);
    t25 = (~(t24));
    *((unsigned int *)t13) = t25;
    *((unsigned int *)t11) = 0;
    if (*((unsigned int *)t12) != 0)
        goto LAB125;

LAB124:    t32 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t32 & 1U);
    t33 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t33 & 1U);
    t14 = (t0 + 1680);
    xsi_vlogvar_wait_assign_value(t14, t13, 0, 0, 1, 0LL);
    goto LAB117;

LAB120:    *((unsigned int *)t13) = 1;
    goto LAB123;

LAB125:    t26 = *((unsigned int *)t13);
    t27 = *((unsigned int *)t12);
    *((unsigned int *)t13) = (t26 | t27);
    t28 = *((unsigned int *)t11);
    t31 = *((unsigned int *)t12);
    *((unsigned int *)t11) = (t28 | t31);
    goto LAB124;

LAB127:    *((unsigned int *)t15) = 1;
    goto LAB130;

LAB132:    t35 = *((unsigned int *)t15);
    t36 = *((unsigned int *)t19);
    *((unsigned int *)t15) = (t35 | t36);
    t37 = *((unsigned int *)t14);
    t39 = *((unsigned int *)t19);
    *((unsigned int *)t14) = (t37 | t39);
    goto LAB131;

LAB135:    t29 = (t44 + 4);
    *((unsigned int *)t44) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB136;

LAB137:    xsi_set_current_line(147, ng0);

LAB140:    xsi_set_current_line(148, ng0);
    t43 = (t0 + 1496);
    t61 = (t43 + 36U);
    t62 = *((char **)t61);
    t63 = (t0 + 1864);
    xsi_vlogvar_wait_assign_value(t63, t62, 0, 0, 4, 0LL);
    xsi_set_current_line(149, ng0);
    t2 = (t0 + 1772);
    t3 = (t2 + 36U);
    t9 = *((char **)t3);
    t10 = ((char*)((ng18)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t9, 20, t10, 32);
    t11 = (t0 + 1772);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 20, 0LL);
    xsi_set_current_line(150, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 1864);
    t9 = (t3 + 36U);
    t10 = *((char **)t9);
    memset(t15, 0, 8);
    t11 = (t15 + 4);
    t12 = (t10 + 4);
    t16 = *((unsigned int *)t10);
    t17 = (t16 >> 0);
    *((unsigned int *)t15) = t17;
    t18 = *((unsigned int *)t12);
    t22 = (t18 >> 0);
    *((unsigned int *)t11) = t22;
    t23 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t23 & 15U);
    t24 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t24 & 15U);
    xsi_vlogtype_concat(t13, 8, 8, 2U, t15, 4, t2, 4);
    t14 = (t0 + 2472);
    t19 = (t0 + 804);
    t20 = xsi_create_subprogram_invocation(t14, 0, t0, t19, 0, 0);
    t21 = (t0 + 2048);
    xsi_vlogvar_assign_value(t21, t13, 0, 0, 8);

LAB141:    t29 = (t0 + 2524);
    t30 = *((char **)t29);
    t43 = (t30 + 44U);
    t61 = *((char **)t43);
    t62 = (t61 + 148U);
    t63 = *((char **)t62);
    t64 = (t63 + 0U);
    t65 = *((char **)t64);
    t8 = ((int  (*)(char *, char *))t65)(t0, t30);
    if (t8 != 0)
        goto LAB143;

LAB142:    t30 = (t0 + 2524);
    t66 = *((char **)t30);
    t30 = (t0 + 1956);
    t67 = (t30 + 36U);
    t68 = *((char **)t67);
    memcpy(t44, t68, 8);
    t69 = (t0 + 804);
    t70 = (t0 + 2472);
    t71 = 0;
    xsi_delete_subprogram_invocation(t69, t66, t0, t70, t71);
    t72 = (t0 + 1588);
    xsi_vlogvar_wait_assign_value(t72, t44, 0, 0, 4, 0LL);
    xsi_set_current_line(151, ng0);
    t2 = (t0 + 1772);
    t3 = (t2 + 36U);
    t9 = *((char **)t3);

LAB144:    t10 = (t0 + 344);
    t11 = *((char **)t10);
    t10 = (t0 + 424);
    t12 = *((char **)t10);
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t11, 32, t12, 32);
    t8 = xsi_vlog_unsigned_case_compare(t9, 20, t13, 32);
    if (t8 == 1)
        goto LAB145;

LAB146:    t2 = (t0 + 344);
    t3 = *((char **)t2);
    t8 = xsi_vlog_unsigned_case_compare(t9, 20, t3, 32);
    if (t8 == 1)
        goto LAB147;

LAB148:
LAB150:
LAB149:    xsi_set_current_line(158, ng0);

LAB160:    xsi_set_current_line(159, ng0);
    t2 = (t0 + 1680);
    t3 = (t2 + 36U);
    t10 = *((char **)t3);
    t11 = (t0 + 1680);
    xsi_vlogvar_wait_assign_value(t11, t10, 0, 0, 1, 0LL);

LAB151:    goto LAB139;

LAB143:    t29 = (t0 + 2572U);
    *((char **)t29) = &&LAB141;
    goto LAB1;

LAB145:    xsi_set_current_line(152, ng0);

LAB152:    xsi_set_current_line(153, ng0);
    t10 = ((char*)((ng2)));
    t14 = (t0 + 1680);
    xsi_vlogvar_wait_assign_value(t14, t10, 0, 0, 1, 0LL);
    goto LAB151;

LAB147:    xsi_set_current_line(155, ng0);

LAB153:    xsi_set_current_line(156, ng0);
    t2 = ((char*)((ng2)));
    memset(t13, 0, 8);
    t10 = (t2 + 4);
    t16 = *((unsigned int *)t10);
    t17 = (~(t16));
    t18 = *((unsigned int *)t2);
    t22 = (t18 & t17);
    t23 = (t22 & 1U);
    if (t23 != 0)
        goto LAB157;

LAB155:    if (*((unsigned int *)t10) == 0)
        goto LAB154;

LAB156:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;

LAB157:    t12 = (t13 + 4);
    t14 = (t2 + 4);
    t24 = *((unsigned int *)t2);
    t25 = (~(t24));
    *((unsigned int *)t13) = t25;
    *((unsigned int *)t12) = 0;
    if (*((unsigned int *)t14) != 0)
        goto LAB159;

LAB158:    t32 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t32 & 1U);
    t33 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t33 & 1U);
    t19 = (t0 + 1680);
    xsi_vlogvar_wait_assign_value(t19, t13, 0, 0, 1, 0LL);
    goto LAB151;

LAB154:    *((unsigned int *)t13) = 1;
    goto LAB157;

LAB159:    t26 = *((unsigned int *)t13);
    t27 = *((unsigned int *)t14);
    *((unsigned int *)t13) = (t26 | t27);
    t28 = *((unsigned int *)t12);
    t31 = *((unsigned int *)t14);
    *((unsigned int *)t12) = (t28 | t31);
    goto LAB158;

LAB164:    t21 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB165;

LAB166:    xsi_set_current_line(163, ng0);

LAB169:    xsi_set_current_line(164, ng0);
    t30 = ((char*)((ng19)));
    t43 = (t0 + 1772);
    xsi_vlogvar_wait_assign_value(t43, t30, 0, 0, 20, 0LL);
    xsi_set_current_line(165, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(166, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 1588);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    goto LAB168;

}


extern void work_m_00000000000449470126_0900940873_init()
{
	static char *pe[] = {(void *)Always_91_0};
	static char *se[] = {(void *)sp_to_KEYCODE};
	xsi_register_didat("work_m_00000000000449470126_0900940873", "isim/main_isim_beh.exe.sim/work/m_00000000000449470126_0900940873.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
