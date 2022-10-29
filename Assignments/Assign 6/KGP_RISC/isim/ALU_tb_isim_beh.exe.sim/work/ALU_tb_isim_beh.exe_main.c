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
    work_m_00000000002537611916_3973547862_init();
    work_m_00000000000564937326_2653968789_init();
    work_m_00000000003204634048_1355564958_init();
    work_m_00000000002818690875_3537066767_init();
    work_m_00000000003444956865_3929479938_init();
    work_m_00000000001643825161_1470988916_init();
    work_m_00000000001399567660_2890531111_init();
    work_m_00000000000261324287_0886308060_init();
    work_m_00000000002214836694_4236420359_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002214836694_4236420359");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
