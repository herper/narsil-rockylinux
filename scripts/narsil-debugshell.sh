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

function narsil_debugshell()
{
    msg_info '\n%s\n' "[${STATS}] Disable debug-shell service"

    systemctl stop debug-shell.service
    systemctl mask -f debug-shell.service >/dev/null 2>&1

    if [[ ${VERIFY^^} == 'Y' ]]; then
        msg_notic '\n%s\n' "• Service Status"
        systemctl status debug-shell.service --no-pager
    else
        msg_succ '%s\n' "Complete!"
    fi

    sleep 1

    ((STATS++))
}
