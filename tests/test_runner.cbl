       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST-RUNNER.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-TEST-RESULT          PIC 9(1) VALUE 0.
       01 WS-TEST-COUNT           PIC 9(3) VALUE 0.
       01 WS-TEST-PASSED          PIC 9(3) VALUE 0.
       01 WS-TEST-FAILED          PIC 9(3) VALUE 0.
       
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "=== Ex�cution des tests unitaires ==="
           
           DISPLAY "Test des utilitaires de date..."
           CALL "TEST_DATE_UTILS" USING WS-TEST-RESULT
           PERFORM UPDATE-TEST-COUNT
           
           DISPLAY "Test des utilitaires de cha�ne..."
           CALL "TEST_STRING_UTILS" USING WS-TEST-RESULT
           PERFORM UPDATE-TEST-COUNT
           
           DISPLAY "Test de la calculatrice..."
           CALL "TEST_CALCULATOR" USING WS-TEST-RESULT
           PERFORM UPDATE-TEST-COUNT
           
           DISPLAY "Test du gestionnaire de fichiers..."
           CALL "TEST_FILE_HANDLER" USING WS-TEST-RESULT
           PERFORM UPDATE-TEST-COUNT
           
           DISPLAY "=== R�sum� des tests ==="
           DISPLAY "Tests ex�cut�s: " WS-TEST-COUNT
           DISPLAY "Tests r�ussis: " WS-TEST-PASSED
           DISPLAY "Tests �chou�s: " WS-TEST-FAILED
           
           IF WS-TEST-FAILED > 0
              DISPLAY "�CHEC: Certains tests ont �chou�."
              MOVE 1 TO RETURN-CODE
           ELSE
              DISPLAY "SUCC�S: Tous les tests ont r�ussi."
              MOVE 0 TO RETURN-CODE
           END-IF
           
           STOP RUN.
           
       UPDATE-TEST-COUNT.
           ADD 1 TO WS-TEST-COUNT
           IF WS-TEST-RESULT = 0
              ADD 1 TO WS-TEST-PASSED
           ELSE
              ADD 1 TO WS-TEST-FAILED
           END-IF.
       END PROGRAM TEST-RUNNER.
