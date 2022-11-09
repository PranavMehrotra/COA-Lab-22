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
static const char *ng0 = "D:/KGP Semesters/SEM 5/COA LAB/COA-Lab-22/Assignments/Assign 6/KGP_RISC/bit_extend_unit.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {16, 0};
static int ng3[] = {6, 0};



static void Always_30_0(char *t0)
{
    char t4[8];
    char t8[8];
    char t9[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;

LAB0:    t1 = (t0 + 3328U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 3648);
    *((int *)t2) = 1;
    t3 = (t0 + 3360);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(30, ng0);

LAB5:    xsi_set_current_line(31, ng0);
    t5 = (t0 + 1048U);
    t6 = *((char **)t5);
    t5 = ((char*)((ng1)));
    xsi_vlogtype_concat(t4, 32, 32, 2U, t5, 27, t6, 5);
    t7 = (t0 + 1768);
    xsi_vlogvar_assign_value(t7, t4, 0, 0, 32);
    xsi_set_current_line(32, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    t5 = (t0 + 1208U);
    t6 = *((char **)t5);
    memset(t9, 0, 8);
    t5 = (t9 + 4);
    t7 = (t6 + 4);
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 15);
    t12 = (t11 & 1);
    *((unsigned int *)t9) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 15);
    t15 = (t14 & 1);
    *((unsigned int *)t5) = t15;
    xsi_vlog_mul_concat(t8, 16, 1, t2, 1U, t9, 1);
    xsi_vlogtype_concat(t4, 32, 32, 2U, t8, 16, t3, 16);
    t16 = (t0 + 2248);
    xsi_vlogvar_assign_value(t16, t4, 0, 0, 32);
    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    t5 = (t0 + 1368U);
    t6 = *((char **)t5);
    memset(t9, 0, 8);
    t5 = (t9 + 4);
    t7 = (t6 + 4);
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 25);
    t12 = (t11 & 1);
    *((unsigned int *)t9) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 25);
    t15 = (t14 & 1);
    *((unsigned int *)t5) = t15;
    xsi_vlog_mul_concat(t8, 6, 1, t2, 1U, t9, 1);
    xsi_vlogtype_concat(t4, 32, 32, 2U, t8, 6, t3, 26);
    t16 = (t0 + 2408);
    xsi_vlogvar_assign_value(t16, t4, 0, 0, 32);
    xsi_set_current_line(34, ng0);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 1928);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 32);
    xsi_set_current_line(35, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 2088);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 32);
    goto LAB2;

}


extern void work_m_00000000000644564447_1443931736_init()
{
	static char *pe[] = {(void *)Always_30_0};
	xsi_register_didat("work_m_00000000000644564447_1443931736", "isim/KGP_RISC_tb_isim_beh.exe.sim/work/m_00000000000644564447_1443931736.didat");
	xsi_register_executes(pe);
}
