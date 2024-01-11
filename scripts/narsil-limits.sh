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

function narsil_limits()
{
    msg_info '\n%s\n' "[${STATS}] Config ulimit for high concurrency situations"

    if ! grep -qnri "# Narsil Limits Config" /etc/security/limits.conf; then
        sed -i 's/^# End of file*//' /etc/security/limits.conf
        {
            echo '# Narsil Limits Config'
            echo '* soft nofile 655350'
            echo '* hard nofile 655350'
            echo '* soft nproc  unlimited'
            echo '* hard nproc  unlimited'
            echo '* soft core   unlimited'
            echo '* hard core   unlimited'
        } > /etc/security/limits.conf
    fi

    if [[ ${VERIFY^^} == 'Y' ]]; then
        msg_notic '\n%s\n' "• File Content: /etc/security/limits.conf"
        grep -Ev '^#|^$' /etc/security/limits.conf | uniq
    else
        msg_succ '%s\n' "Complete!"
    fi

    sleep 1

    ((STATS++))
}
