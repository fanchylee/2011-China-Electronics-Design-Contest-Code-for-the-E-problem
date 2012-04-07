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

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_m_00000000002345315664_3305719485_init();
    work_m_00000000000449470126_0900940873_init();
    work_m_00000000003216960377_2687071804_init();
    work_m_00000000000389281381_0660703249_init();
    work_m_00000000001021822386_1243151170_init();
    work_m_00000000003908602863_0277908578_init();
    unisims_ver_m_00000000000089702190_2593380106_init();
    unisims_ver_m_00000000002788958794_2297623829_init();
    unisims_ver_m_00000000002903279103_2282143210_init();
    unisims_ver_m_00000000001637623177_3897995058_init();
    unisims_ver_m_00000000001637623177_1625843133_init();
    unisims_ver_m_00000000002110918531_0225263307_init();
    unisims_ver_m_00000000003221451496_3478880894_init();
    work_m_00000000003633117262_0017658509_init();
    unisims_ver_m_00000000003221451496_2856106296_init();
    work_m_00000000001271221961_0013572282_init();
    unisims_ver_m_00000000003221451496_3601058073_init();
    work_m_00000000001271221961_0194207623_init();
    unisims_ver_m_00000000003221451496_3016028767_init();
    work_m_00000000001271221961_0173094320_init();
    work_m_00000000003489625274_0286164271_init();
    work_m_00000000002013452923_2073120511_init();
    work_a_0567304414_3212880686_init();


    xsi_register_tops("work_m_00000000003489625274_0286164271");
    xsi_register_tops("work_m_00000000002013452923_2073120511");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");

    return xsi_run_simulation(argc, argv);

}
