      * �v���O������ID�Ȃǂ����L�q����
       IDENTIFICATION DIVISION.
       PROGRAM-ID. KJBM000.
      ********************************************************
      * �V�X�e����    �F���C
      * �T�u�V�X�e�����F�T���v���v���O����
      * �v���O������  �F�T���v���v���O����
      * �쐬���^�쐬�ҁF�Q�O�Q�S�N�U���Q�T��  �V�X�e���Z��
      * �ύX���^�ύX�ҁF
      *       �ύX���e�F
      ********************************************************       
      * �A�N�Z�X�t�@�C���Ȃǂ̏����L�ڂ���
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OTF-FILE ASSIGN TO EXTERNAL OTF.

      * �t�@�C���̃��R�[�h�̃f�[�^���ڂ�A�ꎞ�I�ɗ��p����f�[�^���ڂ��`
       DATA DIVISION.
       FILE SECTION.
       FD OTF-FILE.
       01  OTF-MSG     PIC X(100).

       WORKING-STORAGE SECTION.
       01  MSG.
         03  GREETING PIC X(12) VALUE '����ɂ���,'.
         03  YOURNAME PIC X(20) VALUE SPACE.

      * ���ۂ̃v���O�����̊J�n�n�_
       PROCEDURE DIVISION.
           PERFORM INPUT-YOURNAME UNTIL YOURNAME NOT = SPACE.
           PERFORM DISPMEG.
           PERFORM OUTPUT-FILE.
           STOP RUN.

       INPUT-YOURNAME SECTION.
           DISPLAY "���Ȃ��̖��O����͂��Ă��������B"
           ACCEPT YOURNAME.           
           EXIT.

       DISPMEG SECTION.
           DISPLAY MSG.
           EXIT.

       OUTPUT-FILE SECTION.
           MOVE MSG TO OTF-MSG.

           OPEN OUTPUT OTF-FILE.
           WRITE OTF-MSG.
           CLOSE OTF-FILE.
           EXIT.
      