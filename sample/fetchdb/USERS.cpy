      * �A�N�Z�X����e�[�u���̏��(�C�ӁA�Ȃ��Ă��悢)
      * DB2�ł́A�f�[�^�^�̃`�F�b�N���s���Ă��āA�قȂ�ƌx�����o���B
       EXEC SQL 
           DECLARE USERINFO TABLE (
               USERID      CHAR(5)  NOT NULL,
               USERNAME    CHAR(32) NOT NULL,
               USERAGE     CHAR(5)  NOT NULL 
           )
       END-EXEC.
      
      * DB�̏����i�[���邽�߂̏W�c����
       01 USERINFO.
           03  USERID      PIC X(5).
           03  USERNAME    PIC X(32).
           03  USERAGE     PIC X(5).
           