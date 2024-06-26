#!/usr/bin/env bash
#
# Narsil (Rocky Linux) - Security hardening tool
# Seaton Jiang <hi@seatonjiang.com>
#
# The latest version of Narsil can be found at:
# https://github.com/seatonjiang/narsil-rockylinux
#
# Licensed under the MIT license:
# https://github.com/seatonjiang/narsil-rockylinux/blob/main/LICENSE
#

function narsil_timezone()
{
    msg_info '\n%s\n' "[${STATS}] Config system time zone"

    TIME_ZONE=${TIME_ZONE:-'Asia/Shanghai'}
    VERIFY=${VERIFY:-'Y'}

    timedatectl set-timezone "${TIME_ZONE}"
    timedatectl set-local-rtc 0

    if [[ ${VERIFY^^} == 'Y' ]]; then
        msg_notic '\n%s\n' "• Check time zone"
        ls -la /etc/localtime
    else
        msg_succ '%s\n' "Complete!"
    fi

    sleep 1

    ((STATS++))
}
