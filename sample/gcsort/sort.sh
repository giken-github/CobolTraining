#!/usr/bin/env bash
set -Eeuo pipefail

#######################################################
##   GCSORT �c�[���𗘗p�����f�[�^�̃\�[�g
##   ������ɂ���Ē񋟂����c�[�����قȂ�̂ŁA���ꂼ��̃h�L�������g��
##     �T���v���A���p���Ă���t�@�C�����Q�Ƃ��āA�g�������K�����邱��
#######################################################

SOURCE=$(realpath ../../data/KJBM030i.txt)
DEST=$(realpath ./rersult.txt)

CTRLFILE=$(mktemp)

# trap "rm -f $CTRLFILE" EXIT

cat <<_EOF_ >>$CTRLFILE
SORT FIELDS=(2, 4, ZD, A) 
    USE  $SOURCE RECORD F,100 ORG SQ
    GIVE $DEST   RECORD F,100 ORG SQ
_EOF_
# �� �\�[�g����
# SORT FIELDS=(�\�[�g�ΏۊJ�n�ʒu, ����, �f�[�^�^�C�v, ���~��[, �\�[�g�ΏۊJ�n�ʒu, ����, �f�[�^�^�C�v, ���~��[, ...]])
#     USE  �\�[�g�Ώۂ̃t�@�C���p�X RECORD �Œ蒷,1���R�[�h�̌��� ORG SQ(���t�@�C��)
#     GIVE �\�[�g���ʂ̃t�@�C���p�X RECORD �Œ蒷,1���R�[�h�̌��� ORG SQ(���t�@�C��)

gcsort TAKE $CTRLFILE