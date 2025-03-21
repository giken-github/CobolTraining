#!/bin/bash
set -xEeuo pipefail

SCRIPTDIR=$(cd $(dirname $0); pwd)
BINDIR="${SCRIPTDIR}"
COPYLIBDIR=$(realpath "${SCRIPTDIR}/../../copylib")
DIRNAME=$(basename "${SCRIPTDIR}")

# �R���p�C��
SRCFILE="CALCYESTERDAY.cob"
SONAME=$(basename -s .cob $SRCFILE).so
cobc -m -o "${SCRIPTDIR}/${SONAME}" -I"${DIRNAME}" -I"${COPYLIBDIR}" "${SRCFILE}"

# �R���p�C��
SRCFILE="TEST-CALCYESTERDAY.COB"
BINNAME=$(basename -s .COB $SRCFILE)
cobc -x -o "${SCRIPTDIR}/${BINNAME}" -I"${DIRNAME}" -I"${COPYLIBDIR}" "${SRCFILE}"
