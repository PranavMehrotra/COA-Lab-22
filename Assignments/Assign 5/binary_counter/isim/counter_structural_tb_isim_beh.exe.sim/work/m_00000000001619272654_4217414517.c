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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/KGP Semesters/SEM 5/COA LAB/COA-Lab-22/Assignments/Assign 5/binary_counter/clock_divider.v";
static unsigned int ng1[] = {1U, 0U};
static unsigned int ng2[] = {10U, 0U};
static unsigned int ng3[] = {0U, 0U};
static int ng4[] = {0, 0};



static void Always_69_0(char *t0)
{
    char t8[8];
    char t18[8];
    char t19[8];
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
    char *t16;
    char *t17;
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
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;

LAB0:    t1 = (t0 + 2664U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(69, ng0);
    t2 = (t0 + 2984);
    *((int *)t2) = 1;
    t3 = (t0 + 2696);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(69, ng0);

LAB5:    xsi_set_current_line(70, ng0);
    t4 = (t0 + 1744);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng1)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 8, t6, 8, t7, 8);
    t9 = (t0 + 1744);
    xsi_vlogvar_wait_assign_value(t9, t8, 0, 0, 8, 0LL);
    xsi_set_current_line(71, ng0);
    t2 = (t0 + 1744);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t8, 0, 8);
    t6 = (t4 + 4);
    if (*((unsigned int *)t6) != 0)
        goto LAB7;

LAB6:    t7 = (t5 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB7;

LAB10:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB9;

LAB8:    *((unsigned int *)t8) = 1;

LAB9:    t10 = (t8 + 4);
    t11 = *((unsigned int *)t10);
    t12 = (~(t11));
    t13 = *((unsigned int *)t8);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB11;

LAB12:
LAB13:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 1584);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t19, 0, 8);
    t6 = (t4 + 4);
    t7 = (t5 + 4);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t5);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t6);
    t15 = *((unsigned int *)t7);
    t20 = (t14 ^ t15);
    t21 = (t13 | t20);
    t22 = *((unsigned int *)t6);
    t23 = *((unsigned int *)t7);
    t24 = (t22 | t23);
    t25 = (~(t24));
    t26 = (t21 & t25);
    if (t26 != 0)
        goto LAB17;

LAB14:    if (t24 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t19) = 1;

LAB17:    memset(t18, 0, 8);
    t10 = (t19 + 4);
    t27 = *((unsigned int *)t10);
    t28 = (~(t27));
    t29 = *((unsigned int *)t19);
    t30 = (t29 & t28);
    t31 = (t30 & 1U);
    if (t31 != 0)
        goto LAB18;

LAB19:    if (*((unsigned int *)t10) != 0)
        goto LAB20;

LAB21:    t17 = (t18 + 4);
    t32 = *((unsigned int *)t18);
    t33 = *((unsigned int *)t17);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB22;

LAB23:    t36 = *((unsigned int *)t18);
    t37 = (~(t36));
    t38 = *((unsigned int *)t17);
    t39 = (t37 || t38);
    if (t39 > 0)
        goto LAB24;

LAB25:    if (*((unsigned int *)t17) > 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t18) > 0)
        goto LAB28;

LAB29:    memcpy(t8, t40, 8);

LAB30:    t41 = (t0 + 1584);
    xsi_vlogvar_wait_assign_value(t41, t8, 0, 0, 1, 0LL);
    goto LAB2;

LAB7:    t9 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB9;

LAB11:    xsi_set_current_line(72, ng0);
    t16 = ((char*)((ng3)));
    t17 = (t0 + 1744);
    xsi_vlogvar_wait_assign_value(t17, t16, 0, 0, 8, 0LL);
    goto LAB13;

LAB16:    t9 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB17;

LAB18:    *((unsigned int *)t18) = 1;
    goto LAB21;

LAB20:    t16 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB21;

LAB22:    t35 = ((char*)((ng1)));
    goto LAB23;

LAB24:    t40 = ((char*)((ng3)));
    goto LAB25;

LAB26:    xsi_vlog_unsigned_bit_combine(t8, 1, t35, 1, t40, 1);
    goto LAB30;

LAB28:    memcpy(t8, t35, 8);
    goto LAB30;

}


extern void work_m_00000000001619272654_4217414517_init()
{
	static char *pe[] = {(void *)Always_69_0};
	xsi_register_didat("work_m_00000000001619272654_4217414517", "isim/counter_structural_tb_isim_beh.exe.sim/work/m_00000000001619272654_4217414517.didat");
	xsi_register_executes(pe);
}
