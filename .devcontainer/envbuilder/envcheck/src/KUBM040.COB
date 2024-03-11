       IDENTIFICATION                  DIVISION.
       PROGRAM-ID.                     KUBM040.
      ******************************************************************
      *    �V�X�e�����@�@�F���C
      *    �T�u�V�X�e�����F����
      *    �v���O�������@�F���㖾�׃��X�g�쐬
      *    �쐬��/�쐬�� �F�Q�O�Q�R�N�O�P���O�U���@�r���@���
      *    �ύX��/�ύX�� �F
      *    �ύX���e    �@�F
      ******************************************************************
      *
       ENVIRONMENT                     DIVISION.
       INPUT-OUTPUT                    SECTION.
       FILE-CONTROL.
           SELECT ITF-FILE
             ASSIGN TO EXTERNAL ITF
               FILE STATUS IS WK-ITF-FILE-ERR.
           SELECT OEF-FILE
             ASSIGN TO EXTERNAL OEF
               FILE STATUS IS WK-OEF-FILE-ERR.
      *
       DATA                            DIVISION.
       FILE                            SECTION.
       FD  ITF-FILE.
       01  ITF-REC.
           COPY KUCF010.
       FD  OEF-FILE.
       01  OEF-REC                     PIC X(80).
      *
       WORKING-STORAGE                 SECTION.
       01  WK-ITF-FILE-ERR             PIC X(2) VALUE HIGH-VALUE.
       01  WK-OEF-FILE-ERR             PIC X(2) VALUE HIGH-VALUE.
       01  ITF-END-FLG                 PIC X.
       01  ITF-CNT                     PIC 9(10).
       01  OEF-CNT                     PIC 9(10).
       01  WK-GYOSU-CNT                PIC 9(10).
       01  WK-PAGE-CNT                 PIC 9(4).
       01  WK-GASAN                    PIC S9(12).
       01  WK-SPACE                    PIC X VALUE SPACE.
       01  WK-DATE-HOZON.
           03  WK-DATE-HOZON-YY        PIC 9(2).
           03  WK-DATE-HOZON-Y2        PIC 9(2).
           03  WK-DATE-HOZON-MM        PIC 9(2).
           03  WK-DATE-HOZON-DD        PIC 9(2).
      *
      *�L�[�u���C�N
       01  WK-KEY-TOKUCOD              PIC X(4) VALUE HIGH-VALUE.
       01  WK-KEY-JUCHU-DATE.
           03  WK-KEY-DATE-YY          PIC 9(4) VALUE HIGH-VALUE.
           03  WK-KEY-DATE-MM          PIC 9(2) VALUE HIGH-VALUE.
           03  WK-KEY-DATE-DD          PIC 9(2) VALUE HIGH-VALUE.
      *
      *�^�C�g���s
      *�匩�o��
       01  WK-TITLE.
           03  FILLER                  PIC X(10) VALUE SPACE.
           03  FILLER                  PIC X(30) VALUE
             "�������@���㖾�׃��X�g�@������".
           03  FILLER                  PIC X(14) VALUE SPACE.
           03  FILLER                  PIC X(4) VALUE "DATE".
           03  FILLER                  PIC X(1) VALUE SPACE.
           03  WK-DATE.
             05  WK-DATE-YY            PIC 9(2).
             05  FILLER                PIC X(1) VALUE ".".
             05  WK-DATE-MM            PIC 9(2).
             05  FILLER                PIC X(1) VALUE ".".
             05  WK-DATE-DD            PIC 9(2).
           03  FILLER                  PIC X(3) VALUE SPACE.
           03  FILLER                  PIC X(4) VALUE "PAGE".
           03  FILLER                  PIC X(1) VALUE SPACE.
           03  WK-PAGE                 PIC Z,ZZ9.
      *
      *���Ӑ�s
       01  WK-TOKULINE.
           03  FILLER                  PIC X(8) VALUE "���Ӑ�F".
           03  FILLER                  PIC X VALUE SPACE.
           03  WK-TOKU-COD             PIC X(4).
           03  FILLER                  PIC X VALUE SPACE.
           03  WK-TOKU-MEI             PIC X(20).
           03  FILLER                  PIC X(46) VALUE SPACE.
      *
      *�����o��
       01  WK-SUBTITLE.
           03  FILLER                  PIC X(8) VALUE "�󒍓��t".
           03  FILLER                  PIC X(4) VALUE SPACE.
           03  FILLER                  PIC X(8) VALUE "�󒍔ԍ�".
           03  FILLER                  PIC X(2) VALUE SPACE.
           03  FILLER                  PIC X(8) VALUE "���i�ԍ�".
           03  FILLER                  PIC X(2) VALUE SPACE.
           03  FILLER                  PIC X(6) VALUE "���i��".
           03  FILLER                  PIC X(16) VALUE SPACE.
           03  FILLER                  PIC X(6) VALUE "�P  ��".
           03  FILLER                  PIC X(4) VALUE SPACE.
           03  FILLER                  PIC X(4) VALUE "����".
           03  FILLER                  PIC X(6) VALUE SPACE.
           03  FILLER                  PIC X(6) VALUE "��  �z".
      *
      *���׍s
       01  WK-MEISAI.
           03  WK-JUCHU-DATE.
             05  WK-JUCHU-DATE-YY      PIC 9(4).
             05  WK-SEN1               PIC X VALUE "/".
             05  WK-JUCHU-DATE-MM      PIC 9(2).
             05  WK-SEN2               PIC X VALUE "/".
             05  WK-JUCHU-DATE-DD      PIC 9(2).
           03  FILLER                  PIC X(4) VALUE SPACE.
           03  WK-JUCHU-NO             PIC 9(4).
           03  FILLER                  PIC X(4) VALUE SPACE.
           03  WK-SHOHIN-NO            PIC X(5).
           03  FILLER                  PIC X(3) VALUE SPACE.
           03  WK-SHOHIN-MEI           PIC X(20).
           03  FILLER                  PIC X(1) VALUE SPACE.
           03  WK-TANKA                PIC ZZ,ZZ9.99.
           03  FILLER                  PIC X(2) VALUE SPACE.
           03  WK-SURYO                PIC ZZ,ZZ9.
           03  FILLER                  PIC X(1) VALUE SPACE.
           03  WK-KINGAKU              PIC ---,---,--9.
      *
      *���Ӑ捇�v
       01  WK-GOKEI.
           03  FILLER                  PIC X(50) VALUE SPACE.
           03  FILLER                  PIC X(16) VALUE
             "�� ���Ӑ捇�v ��".
           03  FILLER                  PIC X(3) VALUE SPACE.
           03  WK-GOKEI-KINGAKU        PIC ---,---,--9.
      *
       PROCEDURE                       DIVISION.
           PERFORM INIT-RTN.
           PERFORM MAIN-RTN UNTIL ITF-END-FLG = "Y".
           PERFORM TERM-RTN.
           STOP RUN.
      ******************************************************************
      *    ��������
      ******************************************************************
       INIT-RTN                        SECTION.
           DISPLAY "*** KUBM040 START ***".
           MOVE SPACE TO OEF-REC.
           MOVE "Y" TO ITF-END-FLG.
      *
           MOVE FUNCTION CURRENT-DATE TO WK-DATE-HOZON.
           MOVE WK-DATE-HOZON-Y2 TO WK-DATE-YY.
           MOVE WK-DATE-HOZON-MM TO WK-DATE-MM.
           MOVE WK-DATE-HOZON-DD TO WK-DATE-DD.
      *
           OPEN INPUT ITF-FILE.
           IF WK-ITF-FILE-ERR = 00
             OPEN OUTPUT OEF-FILE
             IF WK-OEF-FILE-ERR = 00
               MOVE "N" TO ITF-END-FLG
             ELSE
               DISPLAY "*** KUBM040 ABEND NOT OEF-FILE"
             END-IF
           ELSE
             DISPLAY "*** KUBM040 ABEND NOT ITF-FILE"
           END-IF.
      *
           PERFORM READ-RTN.
       EXI.
           EXIT.
      ******************************************************************
      *    �ǂݍ��ݏ���
      ******************************************************************
       READ-RTN                        SECTION.
           READ ITF-FILE
             AT END
               MOVE "Y" TO ITF-END-FLG
             NOT AT END
               ADD 1 TO ITF-CNT
           END-READ.
       EXI.
           EXIT.
      ******************************************************************
      *    ���C������
      ******************************************************************
       MAIN-RTN                        SECTION.
           IF UF010-TOKU-COD = WK-KEY-TOKUCOD
             IF WK-GYOSU-CNT = 50
               PERFORM WRITE-TITLE-RTN
               MOVE ZERO TO WK-GYOSU-CNT
             END-IF
           ELSE
             IF WK-KEY-TOKUCOD = HIGH-VALUE
               PERFORM WRITE-TITLE-RTN
             ELSE
               PERFORM WRITE-GOKEI-RTN
               PERFORM WRITE-EMPTY-LINE-RTN
               PERFORM WRITE-TITLE-RTN
               MOVE ZERO TO WK-GASAN
               MOVE ZERO TO WK-GYOSU-CNT
             END-IF
             MOVE UF010-TOKU-COD TO WK-KEY-TOKUCOD
             MOVE WK-KEY-TOKUCOD TO WK-TOKU-COD
           END-IF.
      *
           IF UF010-JUCHU-DATE = WK-KEY-JUCHU-DATE AND WK-GYOSU-CNT > 0
             PERFORM WRITE-MEISAI-WO-DATE-RTN
           ELSE
             PERFORM WRITE-MEISAI-W-DATE-RTN
             MOVE UF010-JUCHU-DATE TO WK-KEY-JUCHU-DATE
           END-IF.
      *
           PERFORM READ-RTN.
       EXI.
           EXIT.
      ******************************************************************
      *    �^�C�g���쐬����
      ******************************************************************
       WRITE-TITLE-RTN                 SECTION.
           ADD 1 TO WK-PAGE-CNT.
      *
           MOVE WK-PAGE-CNT TO WK-PAGE.
           MOVE UF010-TOKU-COD TO WK-TOKU-COD.
           MOVE UF010-TOKU-MEI TO WK-TOKU-MEI.
           MOVE WK-TITLE TO OEF-REC.
           PERFORM WRITE-OTF-REC-RTN.
      *
           MOVE WK-TOKULINE TO OEF-REC.
           WRITE OEF-REC AFTER 2.
           ADD 2 TO OEF-CNT.
      *
           MOVE WK-SUBTITLE TO OEF-REC.
           WRITE OEF-REC AFTER 2.
           ADD 2 TO OEF-CNT.
       EXI.
           EXIT.
      ******************************************************************
      *    �󒍓��t�t�����׍s�o�͏���
      ******************************************************************
       WRITE-MEISAI-W-DATE-RTN         SECTION.
           PERFORM WRITE-EMPTY-LINE-RTN.
      *
           MOVE UF010-JUCHU-YY TO WK-JUCHU-DATE-YY.
           MOVE "/" TO WK-SEN1.
           MOVE UF010-JUCHU-MM TO WK-JUCHU-DATE-MM.
           MOVE "/" TO WK-SEN2.
           MOVE UF010-JUCHU-DD TO WK-JUCHU-DATE-DD.
      *
           PERFORM WRITE-MEISAI-RTN.
       EXI.
           EXIT.
      ******************************************************************
      *    �󒍓��t�������׍s�o�͏���
      ******************************************************************
       WRITE-MEISAI-WO-DATE-RTN         SECTION.
           MOVE WK-SPACE TO WK-JUCHU-DATE
      *
           PERFORM WRITE-MEISAI-RTN.
       EXI.
           EXIT.
      *
      ******************************************************************
      *    ���׏o�͏���
      ******************************************************************
       WRITE-MEISAI-RTN                SECTION.
           MOVE UF010-JUCHU-NO TO WK-JUCHU-NO.
           MOVE UF010-SHOHIN-NO TO WK-SHOHIN-NO.
           MOVE UF010-SHOHIN-MEI TO WK-SHOHIN-MEI.
           MOVE UF010-TANKA TO WK-TANKA.
           MOVE UF010-SURYO TO WK-SURYO.
           IF UF010-DATA-KBN NOT = "1"
             COMPUTE UF010-KINGAKU = UF010-KINGAKU * ( - 1 )
           END-IF.
           MOVE UF010-KINGAKU TO WK-KINGAKU.
           COMPUTE WK-GASAN = WK-GASAN + UF010-KINGAKU.
      *
           MOVE WK-MEISAI TO OEF-REC.
           PERFORM WRITE-OTF-REC-RTN.
           ADD 1 TO WK-GYOSU-CNT.
      *
       EXI.
           EXIT.
      ******************************************************************
      *    ���Ӑ悲�Ƃ̍��v���z�o�͏���
      ******************************************************************
       WRITE-GOKEI-RTN                 SECTION.
           PERFORM WRITE-EMPTY-LINE-RTN.
      *
           MOVE WK-GASAN TO WK-GOKEI-KINGAKU.
           MOVE WK-GOKEI TO OEF-REC.
           PERFORM WRITE-OTF-REC-RTN.
       EXI.
           EXIT.
      ******************************************************************
      *    ��s�o�͏���
      ******************************************************************
       WRITE-EMPTY-LINE-RTN            SECTION.
           MOVE SPACE TO OEF-REC.
           PERFORM WRITE-OTF-REC-RTN.
       EXI.
           EXIT.

      ******************************************************************
      *    �������ݏ���
      ******************************************************************
       WRITE-OTF-REC-RTN               SECTION.
           WRITE OEF-REC AFTER 1.
           ADD 1 TO OEF-CNT.
       EXI.
           EXIT.
      ******************************************************************
      *    �I������
      ******************************************************************
       TERM-RTN                        SECTION.
           IF ITF-CNT > 0
             PERFORM WRITE-GOKEI-RTN
           END-IF.
      *
           CLOSE ITF-FILE.
           CLOSE OEF-FILE.
           DISPLAY "*** KUBM040 ITF=" ITF-CNT.
           DISPLAY "*** KUBM040 OEF=" OEF-CNT.
           DISPLAY "*** KUBM040 END ***".
       EXI.
           EXIT.