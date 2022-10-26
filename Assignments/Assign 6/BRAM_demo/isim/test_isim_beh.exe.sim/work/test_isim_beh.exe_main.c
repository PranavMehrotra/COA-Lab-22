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
    xilinxcorelib_ver_m_00000000001358910285_1903773085_init();
    xilinxcorelib_ver_m_00000000001358910285_1116123310_init();
    xilinxcorelib_ver_m_00000000001687936702_0045554083_init();
    xilinxcorelib_ver_m_00000000000277421008_4117967870_init();
    xilinxcorelib_ver_m_00000000001603977570_2854323877_init();
    work_m_00000000003869038185_0115168226_init();
    work_m_00000000003480174773_2787836504_init();
    work_m_00000000000587264752_1985558087_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000587264752_1985558087");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
