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
    work_m_00000000002648590157_4217414517_init();
    work_m_00000000002340850580_3673085417_init();
    work_m_00000000001611080844_3997768443_init();
    work_m_00000000000563881816_0190280620_init();
    work_m_00000000000759554637_3348568382_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000759554637_3348568382");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}