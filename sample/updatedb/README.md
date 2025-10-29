# UPDATEDB - SQL UPDATE Sample Program

PostgreSQL�e�[�u�����X�V����COBOL�v���O�����̃T���v���ł��B

## �T�v

���̃v���O�����́ASALESDATA �e�[�u���̃��R�[�h��Θb�I�ɍX�V����T���v���ł��B
`FETCHDB` �v���O������SELECT/FETCH�̗�ł���̂ɑ΂��A���̃v���O������UPDATE���̎g�p��������܂��B

## �@�\

- �󒍔ԍ��iJUCHU_NO�j���w�肵�ă��R�[�h������
- ���݂̃f�[�^��\��
- ���ʁiSURYO�j���X�V
- �X�V��̃f�[�^��\��
- �g�����U�N�V�����̃R�~�b�g/���[���o�b�N����

## �r���h���@

```bash
make
```

## ���s���@

```bash
make run
# �܂���
./UPDATEDB
```

## �g�p��

```
*** UPDATEDB START ***

DB connected.

JUCHU-NO (0=END):
1                          # �󒍔ԍ������
--------------------------------------
JUCHU-NO  : 0001
JUCHU-DATE: 24-01-15
TOKU-COD  : T001
SHOHIN-NO : S0001
SURYO     : 00100
--------------------------------------

NEW SURYO:
150                        # �V�������ʂ����

UPDATED (COUNT: 000000001)

--------------------------------------
JUCHU-NO  : 0001
JUCHU-DATE: 24-01-15
TOKU-COD  : T001
SHOHIN-NO : S0001
SURYO     : 00150         # �X�V���ꂽ���Ƃ��m�F
--------------------------------------

JUCHU-NO (0=END):
0                          # �I��
END PROCESS.

TRANSACTION COMMITTED.
TOTAL UPDATES=000000001
*** UPDATEDB END ***
```

## �f�[�^�x�[�X�\��

SALESDATA �e�[�u��:
- DATA_KBN (CHAR(1)) - �f�[�^�敪
- JUCHU_NO (NUMERIC(4)) - �󒍔ԍ��i��L�[�j
- JUCHU_YY (NUMERIC(2)) - �󒍔N
- JUCHU_MM (NUMERIC(2)) - �󒍌�
- JUCHU_DD (NUMERIC(2)) - �󒍓�
- TOKU_COD (CHAR(4)) - ���Ӑ�R�[�h
- SHOHIN_NO (CHAR(5)) - ���i�ԍ�
- SURYO (NUMERIC(5)) - ����

## �v���O�����̓���

### ���͌���

���[�U�[���͂ɑ΂��� `IS NUMERIC` �`�F�b�N�����{���Ă��܂��F
```cobol
IF USER-INPUT IS NOT NUMERIC
  DISPLAY "ERROR: NUMERIC INPUT REQUIRED."
  PERFORM UPDATE-PROCESS-RTN
END-IF.
```

�p�������ڂ��琔�l���ڂւ̓]�L�͒��� `MOVE` ���g�p���Ă��܂��B
`NUMVAL` �֐��͎g�p���Ă��܂���i�񐔒l�f�[�^��ABEND���郊�X�N�����邽�߁j�B

### ����SQL (Embedded SQL)

- `EXEC SQL ... END-EXEC` �ň͂��SQL�����L�q
- esqlOC�v���v���Z�b�T��SQL����������
- `:�ϐ���` ��COBOL�ϐ���SQL�ԂŃf�[�^�������

### DECLARE SECTION

SQL���Ŏg�p����ϐ��͑S�� `EXEC SQL BEGIN DECLARE SECTION` �� `EXEC SQL END DECLARE SECTION` �̊ԂŐ錾����K�v������܂��B

### �g�����U�N�V��������

- ����I����: `EXEC SQL COMMIT END-EXEC`
- �G���[������: `EXEC SQL ROLLBACK END-EXEC`

### �G���[����

- `SQLCODE`: SQL���̎��s���ʃR�[�h
  - 0: ����
  - 100: �f�[�^�Ȃ� (NOT FOUND)
  - ���̑�: �G���[
- `SQLERRMC`: �G���[���b�Z�[�W

## �N���[���A�b�v

```bash
make clean
```

## �Q�l

- `../fetchdb/FETCHDB.CBL` - SELECT/FETCH�̗�
- `../fetchdb/SALESDATA.cpy` - �e�[�u����`
