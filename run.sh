#!/bin/bash
BASEDIR="$(pwd)"
cd "$(dirname "$0")" || exit $?
SCRIPTDIR="$(pwd)"
cd "${BASEDIR}" || exit $?

SERDEV="${1:-/dev/ttyUSB0}"
POWERSOCKET="${2:-1}"

target_power_on()
{
	sudo sispmctl -o "${POWERSOCKET}"
	RV=$?
	if [ ${RV} -ne 0 ]; then
		echo "Please connect Zyxel WSR30 MultyU AC2100 via serial line ${SERDEV} and power on and press return"
		read
	fi
}

target_power_off()
{
	sudo sispmctl -f "${POWERSOCKET}"
}

target_power_on

"${SCRIPTDIR}/sendscript.exp" "${SERDEV}" hello-run-script.txt

target_power_off
