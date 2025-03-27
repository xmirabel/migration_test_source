       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST_DATE_UTILS.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-DATE.
          05 WS-YEAR              PIC 9(4) VALUE 2023.
          05 WS-MONTH             PIC 9(2) VALUE 05.
          05 WS-DAY               PIC 9(2) VALUE 15.
       01 WS-FORMATTED-DATE       PIC X(10).
       01 WS-EXPECTED-DATE        PIC X(10) VALUE "15/05/2023".
       
       LINKAGE SECTION.
       01 LS-TEST-RESULT          PIC 9(1).
       
       PROCEDURE DIVISION USING LS-TEST-RESULT.
       MAIN-PROCEDURE.
           DISPLAY "  Test de formatage de date..."
           
           MOVE 0 TO LS-TEST-RESULT
           
           CALL "DATE_UTILS" USING WS-DATE, WS-FORMATTED-DATE
           
           IF WS-FORMATTED-DATE = WS-EXPECTED-DATE
              DISPLAY "  OK: Date formatée correctement"
           ELSE
              DISPLAY "  ÉCHEC: Date incorrecte"
              DISPLAY "    Attendu: " WS-EXPECTED-DATE
              DISPLAY "    Obtenu: " WS-FORMATTED-DATE
              MOVE 1 TO LS-TEST-RESULT
           END-IF
           
           GOBACK.
       END PROGRAM TEST_DATE_UTILS.
