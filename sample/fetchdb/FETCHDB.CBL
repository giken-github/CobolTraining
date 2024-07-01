       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         FETCHDB.
      ******************************************************************
      * �V�X�e����    �F���C
      * �T�u�V�X�e�����F
      * �v���O������  �FFETCH
      * �쐬���^�쐬�ҁF�Q�O�Q�R�N�P���Q�S��  �V�X�e���Z��
      * �ύX���^�ύX�ҁF
      *       �ύX���e�FGnuCOBOL + esqlOC ����
      ******************************************************************
      *
       ENVIRONMENT         DIVISION.
       INPUT-OUTPUT        SECTION.
       FILE-CONTROL.
      *
       SELECT OTF-FILE ASSIGN EXTERNAL OTF.
      *
       DATA                DIVISION.
       FILE                SECTION.
       FD  OTF-FILE.
       COPY USERS.

       WORKING-STORAGE     SECTION.
       01 WK-OTF-END-FLG   PIC  X VALUE "N".
       01 WK-OTF-CNT       PIC  9(9) PACKED-DECIMAL VALUE 0.
      *
       01 WK-DBERR-FLG     PIC  X VALUE "N".
       01 WK-DBUPDATE-CNT  PIC  9(9) PACKED-DECIMAL VALUE 0.
      *
       EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       EXEC SQL INCLUDE USERS-DECLARE END-EXEC.
      *
       01 DSN                PIC  X(256).
       EXEC SQL END DECLARE SECTION END-EXEC.
      *
       EXEC SQL INCLUDE SQLCA END-EXEC.

       PROCEDURE           DIVISION.
           PERFORM INIT-RTN.
           PERFORM MAIN-RTN UNTIL WK-OTF-END-FLG = "Y".
           PERFORM SUCCESSFUL-TERM-RTN.
      *
       INIT-RTN            SECTION.
           DISPLAY  "*** FETCHDB START ***".
      *
           OPEN OUTPUT OTF-FILE.
      *
      * ESQLOC��ODBC�o�R��DB�֐ڑ�����R�[�h�𐶐����邽�߁A�f�[�^�x�[�X
      * �ւ̐ڑ���ODBC�ڑ���������쐬����K�v������B�ڍׂ͉��LURL�Q�ƁB
      * https://www.microfocus.co.jp/manuals/ED60/VS2017/GUID-2B444A32-4991-4396-B9F1-68AB643B5EBA.html
      *
      * �Ȃ��A����SQL����������v���v���Z�b�T�ɂ���āA�f�[�^�x�[�X�ւ�
      * �ڑ����@���قȂ�̂ŁA���̏ꏊ�ŗ��p���Ă���v���v���Z�b�T��
      * �h�L�������g���m�F���邱�ƁB
      *
      * Ubuntu 22.04�ł́Aodbc-postgresql�p�b�P�[�W�̃C���X�g�[�����K�v�B
      *
      * ����SQL�𗘗p����ꍇ�́ACOBOL���̕����R�[�h�ɍ��킹�ăf�[�^��
      * ��������K�v������B���C�̊���'SJIS'�̂��߁A�f�[�^�擾����
      * �����G���R�[�h��'SJIS'�ɐݒ肷��B(���Ȃ��ƕ�����������������)
      * �����G���R�[�h��ݒ肷��ɂ́A
      *   CONNSETTINGS=SET CLIENT_ENCODING TO 'SJIS'
      * ��ڑ�������ɒǉ�����B
           STRING
             "DRIVER={Postgresql Unicode};"                             *> Postgresql ODBC�h���C�o
             "SERVER=db;"                                               *> �y�v�ύX�z�T�[�o������IP�A�h���X
             "DATABASE=postgres;"                                       *> �y�v�ύX�z�f�[�^�x�[�X��
             "USER=postgres;"                                           *> �y�v�ύX�z���[�U��
             "PASSWORD=postgres;"                                       *> �y�v�ύX�z�p�X���[�h
             "CONNSETTINGS=SET CLIENT_ENCODING to 'SJIS';"              *> �N���C�A���g�����R�[�h
             INTO DSN
           END-STRING.

           EXEC SQL CONNECT TO :DSN END-EXEC.
           IF SQLCODE NOT = ZERO
             PERFORM DBERR-TERM-RTN
           END-IF.
       EXT.
           EXIT.

       MAIN-RTN            SECTION.
      * UPDATE���ߎ��s���ɍX�V�ΏۂƂȂ郌�R�[�h��0����������
      * ���ꂪ�ANOT FOUND �����ɓ��Ă͂܂邩�ǂ����́ARDBMS�̎�����
      * ����ĈقȂ邽�߁A���p����ꍇ�͎��O��RDBMS�̃}�j���A������
      * �`�F�b�N���Ă������ƁB
       EXT.
           EXIT.
           
       READ-TABLE          SECTION.
           EXEC SQL OPEN 

       EXT.
           EXIT.
       
       SUCCESSFUL-TERM-RTN  SECTION.
           EXEC SQL COMMIT END-EXEC.
           PERFORM TERM-RTN.
       EXT.
           EXIT.

       DBERR-TERM-RTN      SECTION.
           EXEC SQL ROLLBACK END-EXEC.
           DISPLAY "!!! FETCHDB ABEND !!!"
           PERFORM TERM-RTN.
       EXT.
           EXIT.

       TERM-RTN            SECTION.
           EXEC SQL DISCONNECT ALL END-EXEC.
      *
           CLOSE OTF-FILE.
      *
           DISPLAY "   OTF=" WK-OTF-CNT.
           DISPLAY "UPDATE=" WK-DBUPDATE-CNT.
           DISPLAY "*** FETCHDB END ***".
       EXT.
           STOP RUN.