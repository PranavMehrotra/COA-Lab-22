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
    work_m_00000000001516115935_1351276808_init();
    work_m_00000000002537611916_3973547862_init();
    work_m_00000000000992227667_3577313837_init();
    work_m_00000000000644564447_1443931736_init();
    work_m_00000000001643058574_0278921292_init();
    work_m_00000000000564937326_2653968789_init();
    work_m_00000000003204634048_1355564958_init();
    work_m_00000000002818690875_3537066767_init();
    work_m_00000000003444956865_3929479938_init();
    work_m_00000000001643825161_1470988916_init();
    work_m_00000000001399567660_2890531111_init();
    work_m_00000000000261324287_0886308060_init();
    work_m_00000000003141693905_3673085417_init();
    work_m_00000000003939717945_3381898454_init();
    work_m_00000000000432624543_2370168646_init();
    work_m_00000000000169328403_1476650907_init();
    work_m_00000000002341031869_2323471207_init();
    xilinxcorelib_ver_m_00000000001358910285_1934194090_init();
    xilinxcorelib_ver_m_00000000001358910285_3433753417_init();
    xilinxcorelib_ver_m_00000000001687936702_4190540447_init();
    xilinxcorelib_ver_m_00000000000277421008_1662285289_init();
    xilinxcorelib_ver_m_00000000001603977570_0022973509_init();
    work_m_00000000003869038185_4069808678_init();
    xilinxcorelib_ver_m_00000000001358910285_2232954754_init();
    xilinxcorelib_ver_m_00000000001687936702_1486898983_init();
    xilinxcorelib_ver_m_00000000000277421008_1231803429_init();
    xilinxcorelib_ver_m_00000000001603977570_1205040500_init();
    work_m_00000000002489990758_2274212787_init();
    work_m_00000000001596925606_4205961752_init();
    work_m_00000000000200822873_4034900431_init();
    work_m_00000000003232838704_2977599955_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003232838704_2977599955");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
