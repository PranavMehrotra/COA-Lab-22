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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000003172192061_0209709607_init();
    work_m_00000000001588918809_2648124674_init();
    work_m_00000000002694892414_2830143875_init();
    work_m_00000000002340850580_3673085417_init();
    work_m_00000000000385181808_1756712915_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000385181808_1756712915");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
