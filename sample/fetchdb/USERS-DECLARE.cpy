       EXEC SQL 
           DECLARE USERINFO TABLE (
               USERID      CHAR(5)  NOT NULL  PRIMARY KEY,
               USERNAME    CHAR(32) NOT NULL,
               USERAGE     CHAR(5)  NOT NULL 
           )
      END-EXEC.