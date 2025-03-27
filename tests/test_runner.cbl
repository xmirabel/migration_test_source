       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST-RUNNER.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-TEST-COUNT           PIC 9(3) VALUE 0.
       01 WS-TEST-PASSED          PIC 9(3) VALUE 0.
       01 WS-TEST-FAILED          PIC 9(3) VALUE 0.
       
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "=== Exécution des tests unitaires ==="
           
           DISPLAY "Note: Veuillez exécuter les tests individuellement:"
           DISPLAY "  ./test_date_utils"
           DISPLAY "  ./test_string_utils"
           DISPLAY "  ./test_calculator"
           DISPLAY "  ./test_file_handler"
           
           DISPLAY "=== Fin des tests ==="
           
           STOP RUN.
       END PROGRAM TEST-RUNNER.
