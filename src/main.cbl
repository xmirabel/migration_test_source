       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN.
       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUM1        PIC 9(5)V99.
       01 WS-NUM2        PIC 9(5)V99.
       01 WS-RESULT      PIC 9(6)V99.
       01 WS-CURRENT-DATE.
          05 WS-CURRENT-YEAR    PIC 9(4).
          05 WS-CURRENT-MONTH   PIC 9(2).
          05 WS-CURRENT-DAY     PIC 9(2).
       01 WS-FORMATTED-DATE     PIC X(10).
       01 WS-USER-NAME          PIC X(30).
       01 WS-GREETING           PIC X(50).
       
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "=== Application Console GnuCOBOL ==="
           
           MOVE "Utilisateur" TO WS-USER-NAME
           
           CALL "STRING_UTILS" USING WS-USER-NAME, WS-GREETING
           DISPLAY WS-GREETING
           
           MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE
           CALL "DATE_UTILS" USING WS-CURRENT-DATE, WS-FORMATTED-DATE
           DISPLAY "Date: " WS-FORMATTED-DATE
           
           DISPLAY "Entrez le premier nombre:"
           ACCEPT WS-NUM1
           DISPLAY "Entrez le deuxième nombre:"
           ACCEPT WS-NUM2
           
           CALL "CALCULATOR" USING WS-NUM1, WS-NUM2, WS-RESULT
           
           DISPLAY "Résultat de l'addition: " WS-RESULT
           
           STOP RUN.
       END PROGRAM MAIN.
