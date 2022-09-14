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
static int ng1[] = {4, 0};
static int ng2[] = {1, 0};
static int ng3[] = {0, 0};



static void Always_23_0(char *t0)
{
    char t8[8];
    char t9[8];
    char t26[8];
    char t42[8];
    char t50[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    char *t55;
    char *t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;
    char *t85;

LAB0:    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(23, ng0);
    t2 = (t0 + 2848);
    *((int *)t2) = 1;
    t3 = (t0 + 2560);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(23, ng0);

LAB5:    xsi_set_current_line(24, ng0);
    t4 = (t0 + 1608);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng1)));
    memset(t8, 0, 8);
    xsi_vlog_signed_greatereq(t8, 32, t6, 32, t7, 32);
    memset(t9, 0, 8);
    t10 = (t8 + 4);
    t11 = *((unsigned int *)t10);
    t12 = (~(t11));
    t13 = *((unsigned int *)t8);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB6;

LAB7:    if (*((unsigned int *)t10) != 0)
        goto LAB8;

LAB9:    t17 = (t9 + 4);
    t18 = *((unsigned int *)t9);
    t19 = (!(t18));
    t20 = *((unsigned int *)t17);
    t21 = (t19 || t20);
    if (t21 > 0)
        goto LAB10;

LAB11:    memcpy(t50, t9, 8);

LAB12:    t78 = (t50 + 4);
    t79 = *((unsigned int *)t78);
    t80 = (~(t79));
    t81 = *((unsigned int *)t50);
    t82 = (t81 & t80);
    t83 = (t82 != 0);
    if (t83 > 0)
        goto LAB24;

LAB25:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 1608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t8, 0, 8);
    xsi_vlog_signed_add(t8, 32, t4, 32, t5, 32);
    t6 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t6, t8, 0, 0, 32, 0LL);

LAB26:    goto LAB2;

LAB6:    *((unsigned int *)t9) = 1;
    goto LAB9;

LAB8:    t16 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB9;

LAB10:    t22 = (t0 + 1448);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = ((char*)((ng2)));
    memset(t26, 0, 8);
    t27 = (t24 + 4);
    t28 = (t25 + 4);
    t29 = *((unsigned int *)t24);
    t30 = *((unsigned int *)t25);
    t31 = (t29 ^ t30);
    t32 = *((unsigned int *)t27);
    t33 = *((unsigned int *)t28);
    t34 = (t32 ^ t33);
    t35 = (t31 | t34);
    t36 = *((unsigned int *)t27);
    t37 = *((unsigned int *)t28);
    t38 = (t36 | t37);
    t39 = (~(t38));
    t40 = (t35 & t39);
    if (t40 != 0)
        goto LAB16;

LAB13:    if (t38 != 0)
        goto LAB15;

LAB14:    *((unsigned int *)t26) = 1;

LAB16:    memset(t42, 0, 8);
    t43 = (t26 + 4);
    t44 = *((unsigned int *)t43);
    t45 = (~(t44));
    t46 = *((unsigned int *)t26);
    t47 = (t46 & t45);
    t48 = (t47 & 1U);
    if (t48 != 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t43) != 0)
        goto LAB19;

LAB20:    t51 = *((unsigned int *)t9);
    t52 = *((unsigned int *)t42);
    t53 = (t51 | t52);
    *((unsigned int *)t50) = t53;
    t54 = (t9 + 4);
    t55 = (t42 + 4);
    t56 = (t50 + 4);
    t57 = *((unsigned int *)t54);
    t58 = *((unsigned int *)t55);
    t59 = (t57 | t58);
    *((unsigned int *)t56) = t59;
    t60 = *((unsigned int *)t56);
    t61 = (t60 != 0);
    if (t61 == 1)
        goto LAB21;

LAB22:
LAB23:    goto LAB12;

LAB15:    t41 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t41) = 1;
    goto LAB16;

LAB17:    *((unsigned int *)t42) = 1;
    goto LAB20;

LAB19:    t49 = (t42 + 4);
    *((unsigned int *)t42) = 1;
    *((unsigned int *)t49) = 1;
    goto LAB20;

LAB21:    t62 = *((unsigned int *)t50);
    t63 = *((unsigned int *)t56);
    *((unsigned int *)t50) = (t62 | t63);
    t64 = (t9 + 4);
    t65 = (t42 + 4);
    t66 = *((unsigned int *)t64);
    t67 = (~(t66));
    t68 = *((unsigned int *)t9);
    t69 = (t68 & t67);
    t70 = *((unsigned int *)t65);
    t71 = (~(t70));
    t72 = *((unsigned int *)t42);
    t73 = (t72 & t71);
    t74 = (~(t69));
    t75 = (~(t73));
    t76 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t76 & t74);
    t77 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t77 & t75);
    goto LAB23;

LAB24:    xsi_set_current_line(24, ng0);

LAB27:    xsi_set_current_line(25, ng0);
    t84 = ((char*)((ng3)));
    t85 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t85, t84, 0, 0, 32, 0LL);
    xsi_set_current_line(26, ng0);
    t2 = (t0 + 1448);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t4 + 4);
    t11 = *((unsigned int *)t5);
    t12 = (~(t11));
    t13 = *((unsigned int *)t4);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB31;

LAB29:    if (*((unsigned int *)t5) == 0)
        goto LAB28;

LAB30:    t6 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t6) = 1;

LAB31:    t7 = (t8 + 4);
    t10 = (t4 + 4);
    t18 = *((unsigned int *)t4);
    t19 = (~(t18));
    *((unsigned int *)t8) = t19;
    *((unsigned int *)t7) = 0;
    if (*((unsigned int *)t10) != 0)
        goto LAB33;

LAB32:    t31 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t31 & 1U);
    t32 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t32 & 1U);
    t16 = (t0 + 1448);
    xsi_vlogvar_wait_assign_value(t16, t8, 0, 0, 1, 0LL);
    goto LAB26;

LAB28:    *((unsigned int *)t8) = 1;
    goto LAB31;

LAB33:    t20 = *((unsigned int *)t8);
    t21 = *((unsigned int *)t10);
    *((unsigned int *)t8) = (t20 | t21);
    t29 = *((unsigned int *)t7);
    t30 = *((unsigned int *)t10);
    *((unsigned int *)t7) = (t29 | t30);
    goto LAB32;

}


extern void work_m_00000000000046660249_4217414517_init()
{
	static char *pe[] = {(void *)Always_23_0};
	xsi_register_didat("work_m_00000000000046660249_4217414517", "isim/counter_structural_tb_isim_beh.exe.sim/work/m_00000000000046660249_4217414517.didat");
	xsi_register_executes(pe);
}
