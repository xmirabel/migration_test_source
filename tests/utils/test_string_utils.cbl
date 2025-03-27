       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST_STRING_UTILS.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NAME                 PIC X(30) VALUE "Jean".
       01 WS-GREETING             PIC X(50).
       01 WS-EXPECTED-GREETING    PIC X(50) VALUE "Bonjour, Jean !".
       
       LINKAGE SECTION.
       01 LS-TEST-RESULT          PIC 9(1).
       
       PROCEDURE DIVISION USING LS-TEST-RESULT.
       MAIN-PROCEDURE.
           DISPLAY "  Test de génération de salutation..."
           
           MOVE 0 TO LS-TEST-RESULT
           
           CALL "STRING_UTILS" USING WS-NAME, WS-GREETING
           
           IF WS-GREETING = WS-EXPECTED-GREETING
              DISPLAY "  OK: Salutation générée correctement"
           ELSE
              DISPLAY "  ÉCHEC: Salutation incorrecte"
              DISPLAY "    Attendu: " WS-EXPECTED-GREETING
              DISPLAY "    Obtenu: " WS-GREETING
              MOVE 1 TO LS-TEST-RESULT
           END-IF
           
           GOBACK.
       END PROGRAM TEST_STRING_UTILS.
