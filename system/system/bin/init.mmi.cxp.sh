#!/system/bin/sh

# Copyright (c) 2021, Motorola Mobility LLC, All Rights Reserved.
#
# Date Created: 11/15/2021, Set CXP properties according to carrier channel
#

set_cxp_system_properties ()
{
    boot_carrier=`getprop ro.boot.carrier`
    optr=`getprop persist.vendor.operator.optr`
    if [ $optr ]; then
        return 0
    fi

    case $boot_carrier in
        att|attpre|cricket )
            setprop persist.vendor.mtk_uce_support 1
            setprop persist.vendor.mtk_rcs_support 0
            setprop persist.vendor.mtk_rtt_support 1
            setprop persist.vendor.vzw_device_type 0
        ;;
        tmo|boost|cc|fi|metropcs|tracfone|retus )
            setprop persist.vendor.mtk_uce_support 1
            setprop persist.vendor.mtk_rcs_support 0
            setprop persist.vendor.mtk_rtt_support 1
            setprop persist.vendor.vzw_device_type 0
        ;;
        usc )
            setprop persist.vendor.mtk_uce_support 0
            setprop persist.vendor.mtk_rcs_support 0
            setprop persist.vendor.mtk_rtt_support 0
            setprop persist.vendor.vzw_device_type 0
        ;;
        vzw|vzwpre|comcast|spectrum )
            setprop persist.vendor.mtk_uce_support 1
            setprop persist.vendor.mtk_rcs_support 0
            setprop persist.vendor.mtk_rtt_support 1
            setprop persist.vendor.vzw_device_type 3
        ;;
        *)
            setprop persist.vendor.mtk_uce_support 0
            setprop persist.vendor.mtk_rcs_support 0
            setprop persist.vendor.mtk_rtt_support 0
            setprop persist.vendor.vzw_device_type 0
        ;;
    esac
}

set_cxp_system_properties
return 0
