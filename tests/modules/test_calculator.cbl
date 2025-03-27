       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST_CALCULATOR.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUM1                 PIC 9(5)V99 VALUE 123.45.
       01 WS-NUM2                 PIC 9(5)V99 VALUE 67.89.
       01 WS-RESULT               PIC 9(6)V99.
       01 WS-EXPECTED-RESULT      PIC 9(6)V99 VALUE 191.34.
       
       LINKAGE SECTION.
       01 LS-TEST-RESULT          PIC 9(1).
       
       PROCEDURE DIVISION USING LS-TEST-RESULT.
       MAIN-PROCEDURE.
           DISPLAY "  Test d'addition..."
           
           MOVE 0 TO LS-TEST-RESULT
           
           CALL "CALCULATOR" USING WS-NUM1, WS-NUM2, WS-RESULT
           
           IF WS-RESULT = WS-EXPECTED-RESULT
              DISPLAY "  OK: Addition correcte"
           ELSE
              DISPLAY "  ÉCHEC: Addition incorrecte"
              DISPLAY "    Attendu: " WS-EXPECTED-RESULT
              DISPLAY "    Obtenu: " WS-RESULT
              MOVE 1 TO LS-TEST-RESULT
           END-IF
           
           GOBACK.
       END PROGRAM TEST_CALCULATOR.
