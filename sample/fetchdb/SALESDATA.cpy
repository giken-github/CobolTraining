      * �A�N�Z�X����e�[�u���̏��(�C�ӁA�Ȃ��Ă��悢)
      * DB2�ł́A�f�[�^�^�̃`�F�b�N���s���Ă��āA�قȂ�ƌx�����o���B
       EXEC SQL 
           DECLARE TABLE SalesData (
               DATA_KBN CHAR(1),
               JUCHU_NO NUMERIC(4),
               JUCHU_YY NUMERIC(2),
               JUCHU_MM NUMERIC(2),
               JUCHU_DD NUMERIC(2),
               TOKU_COD CHAR(4),
               SHOHIN_NO CHAR(5),
               SURYO NUMERIC(5)
           )
       END-EXEC.
      
      * DB�̏����i�[���邽�߂̏W�c����
       01 SALESDATA.
         03  SALES-DATA-KBN   PIC X(1).
         03  SALES-JUCHU-NO   PIC 9(4).
         03  SALES-JUCHU-YY   PIC 9(2).
         03  SALES-JUCHU-MM   PIC 9(2).
         03  SALES-JUCHU-DD   PIC 9(2).
         03  SALES-TOKU-COD   PIC X(4).
         03  SALES-SHOHIN-NO  PIC X(5).
         03  SALES-SURYO      PIC 9(5).
           