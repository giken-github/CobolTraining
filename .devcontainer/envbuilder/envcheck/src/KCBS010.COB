       IDENTIFICATION         DIVISION.
       PROGRAM-ID.            KCBS010.
      ******************************************************************
      * �V�X�e����    �F���C
      * �T�u�V�X�e�����F����
      * �v���O������  �F������t�`�F�b�N
      * �쐬���^�쐬�ҁF�Q�O�P�R�N�S���R�O��  �V�X�e���Z��
      * �ύX���^�ύX�ҁF
      *       �ύX���e�F
      ******************************************************************
       ENVIRONMENT            DIVISION.
       INPUT-OUTPUT           SECTION.
      *
       DATA                   DIVISION.
       WORKING-STORAGE        SECTION.
       01  WK-AREA.
           03  WK-DD          PIC  9(02).
           03  WK-URU-FLG     PIC  X(01).
           03  WK-SHO         PIC S9(05) COMP-3.
           03  WK-AMARI       PIC S9(05) COMP-3.
      *
       LINKAGE                SECTION.
           COPY KCBS010P.
      ******************************************************************
      *    ������t�`�F�b�N
      ******************************************************************
       PROCEDURE              DIVISION
                              USING  KCBS010-P1.
      *    �߂�l��������
           MOVE  SPACE  TO  S010-RCD.
      *
           PERFORM  INPARM-CHK-RTN.
      *
           IF  (S010-RCD = SPACE)
             IF  (S010-P1-Y1 = ZERO)
               PERFORM  DATE8-CNV-RTN
             END-IF
             IF  (S010-D6-MM = 2) AND (S010-D8-DD = 29)
               PERFORM  URUDOSHI-CHK-RTN
             END-IF
           END-IF.
      *
           GOBACK.
      ******************************************************************
      *    ���̓p�����[�^�`�F�b�N����
      ******************************************************************
       INPARM-CHK-RTN         SECTION.
      *
      *    ���l�`�F�b�N
           IF  (S010-DATE NOT NUMERIC)
             MOVE  'E'  TO  S010-RCD
             GO TO EXT
           END-IF.
      *
      *    ���͈̓`�F�b�N
           IF  (S010-D6-MM < 1) OR (S010-D6-MM > 12)
             MOVE  'E'  TO  S010-RCD
             GO TO EXT
           END-IF.
      *
      *    ������l�Z�b�g
           EVALUATE TRUE
             WHEN  (S010-D6-MM = 2)
               MOVE  29  TO  WK-DD
             WHEN  (S010-D6-MM = 4 OR 6 OR 9 OR 11)
               MOVE  30  TO  WK-DD
             WHEN  OTHER
               MOVE  31  TO  WK-DD
           END-EVALUATE.
      *
      *    ���͈̓`�F�b�N
           IF  (S010-D6-DD < 1)  OR  (S010-D6-DD > WK-DD)
             MOVE  'E'  TO  S010-RCD
             GO TO EXT
           END-IF.
       EXT.
           EXIT.
      ******************************************************************
      *    ������t�W���ϊ�����
      ******************************************************************
       DATE8-CNV-RTN          SECTION.
           IF  (S010-P1-Y1 = ZERO)
             IF  (S010-D6-Y2 < 90)
                 MOVE  20  TO  S010-P1-Y1
             ELSE
                 MOVE  19  TO  S010-P1-Y1
             END-IF
           END-IF.
       EXT.
           EXIT.
      ******************************************************************
      *    �[�N�`�F�b�N����
      ******************************************************************
       URUDOSHI-CHK-RTN       SECTION.
           MOVE  'N'  TO  WK-URU-FLG.
           DIVIDE  S010-D8-YY  BY  400
                   GIVING  WK-SHO  REMAINDER  WK-AMARI.
      *
           IF  (WK-AMARI = 0)
             MOVE  'Y'  TO  WK-URU-FLG
           ELSE
             DIVIDE  S010-D8-YY  BY  100
                     GIVING  WK-SHO  REMAINDER  WK-AMARI
             IF  (WK-AMARI NOT = 0)
               DIVIDE  S010-D8-YY  BY  4
                       GIVING  WK-SHO  REMAINDER  WK-AMARI
               IF  (WK-AMARI = 0)
                 MOVE  'Y'  TO  WK-URU-FLG
               END-IF
             END-IF
           END-IF.
      *
           IF  (WK-URU-FLG = 'N')
             MOVE  'E'  TO  S010-RCD
           END-IF.
       EXT.
           EXIT.