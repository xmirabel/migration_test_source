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
       01 WS-FILENAME           PIC X(100).
       01 WS-FILE-CONTENT       PIC X(1000).
       01 WS-FILE-STATUS        PIC 9(2).
       
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
           
           MOVE "output.txt" TO WS-FILENAME
           STRING "Résultat du calcul: " DELIMITED BY SIZE
                  WS-RESULT DELIMITED BY SIZE
                  INTO WS-FILE-CONTENT
           
           CALL "FILE_HANDLER" USING WS-FILENAME, WS-FILE-CONTENT, 
                                     WS-FILE-STATUS
           
           IF WS-FILE-STATUS = 0
              DISPLAY "Le résultat a été enregistré dans " WS-FILENAME
           ELSE
              DISPLAY "Erreur lors de l'enregistrement du fichier"
           END-IF
           
           STOP RUN.
       END PROGRAM MAIN.
