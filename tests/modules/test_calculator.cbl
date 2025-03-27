       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST_CALCULATOR.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUM1                 PIC 9(5)V99 VALUE 123.45.
       01 WS-NUM2                 PIC 9(5)V99 VALUE 67.89.
       01 WS-RESULT               PIC 9(6)V99.
       01 WS-EXPECTED-RESULT      PIC 9(6)V99 VALUE 191.34.
       01 WS-TEST-RESULT          PIC 9(1) VALUE 0.
       
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "  Test d'addition..."
           
           CALL "CALCULATOR" USING WS-NUM1, WS-NUM2, WS-RESULT
           
           IF WS-RESULT = WS-EXPECTED-RESULT
              DISPLAY "  OK: Addition correcte"
           ELSE
              DISPLAY "  ÉCHEC: Addition incorrecte"
              DISPLAY "    Attendu: " WS-EXPECTED-RESULT
              DISPLAY "    Obtenu: " WS-RESULT
              MOVE 1 TO WS-TEST-RESULT
           END-IF
           
           MOVE WS-TEST-RESULT TO RETURN-CODE
           STOP RUN.
       END PROGRAM TEST_CALCULATOR.
