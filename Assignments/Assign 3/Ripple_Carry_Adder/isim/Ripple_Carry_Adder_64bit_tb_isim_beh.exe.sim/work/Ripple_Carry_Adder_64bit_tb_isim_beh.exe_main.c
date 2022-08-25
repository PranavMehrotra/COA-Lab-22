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
    work_m_00000000001588918809_3190593924_init();
    work_m_00000000002350941514_1915007859_init();
    work_m_00000000001523519712_3343238048_init();
    work_m_00000000001523519712_0854001559_init();
    work_m_00000000001523519712_3748452155_init();
    work_m_00000000001929244233_2664991949_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001929244233_2664991949");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
