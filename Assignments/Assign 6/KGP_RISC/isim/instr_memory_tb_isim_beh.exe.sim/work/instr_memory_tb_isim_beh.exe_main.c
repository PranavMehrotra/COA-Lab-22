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
    xilinxcorelib_ver_m_00000000001358910285_2232954754_init();
    xilinxcorelib_ver_m_00000000001687936702_1486898983_init();
    xilinxcorelib_ver_m_00000000000277421008_3570799909_init();
    xilinxcorelib_ver_m_00000000003435484244_3575272388_init();
    work_m_00000000002489990758_2274212787_init();
    work_m_00000000002664332311_3580823226_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002664332311_3580823226");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
