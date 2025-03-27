       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRING_UTILS.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       LINKAGE SECTION.
       01 LS-USER-NAME          PIC X(30).
       01 LS-GREETING           PIC X(50).
       
       PROCEDURE DIVISION USING LS-USER-NAME, LS-GREETING.
       MAIN-PROCEDURE.
           STRING "Bonjour, " DELIMITED BY SIZE
                  LS-USER-NAME DELIMITED BY SPACE
                  " !" DELIMITED BY SIZE
                  INTO LS-GREETING
           END-STRING
           
           GOBACK.
       END PROGRAM STRING_UTILS.
