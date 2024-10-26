#!/bin/bash
BASEDIR="$(pwd)"
cd "$(dirname "$0")" || exit $?
SCRIPTDIR="$(pwd)"
cd "${BASEDIR}" || exit $?

ADDRESS="${1:-0xa0500000}"
BINFILE="${2:-hello.bin}"
RUNSCRIPTFILE="${3:-hello-run-script.txt}"
CROSSCOMPILE="${4:-mips-linux-gnu-}"

"${SCRIPTDIR}/realtekbin2ew.py" 0xa0500000 "${BINFILE}" "${RUNSCRIPTFILE}"
export LANG=C
STARTADDRESS="$(${CROSSCOMPILE}objdump -f "${BINFILE%%.bin}.elf" | grep -e "start address" | grep -oe "0x[0-9a-fA-F]*")"
echo "j ${STARTADDRESS:2}" >>"${RUNSCRIPTFILE}"
