       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST_FILE_HANDLER.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT TEST-FILE ASSIGN TO "test_output.txt"
           ORGANIZATION IS LINE SEQUENTIAL
           FILE STATUS IS WS-TEST-FILE-STATUS.
       
       DATA DIVISION.
       FILE SECTION.
       FD TEST-FILE.
       01 TEST-RECORD             PIC X(100).
       
       WORKING-STORAGE SECTION.
       01 WS-FILENAME             PIC X(100) VALUE "test_output.txt".
       01 WS-CONTENT              PIC X(100) VALUE "Contenu de test".
       01 WS-FILE-STATUS          PIC 9(2).
       01 WS-TEST-FILE-STATUS     PIC X(2).
       01 WS-READ-CONTENT         PIC X(100).
       01 WS-TEST-RESULT          PIC 9(1) VALUE 0.
       
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "  Test d'�criture de fichier..."
           
           MOVE "test_output.txt" TO WS-FILENAME
           MOVE "Contenu de test" TO WS-CONTENT
           
           CALL "FILE_HANDLER" 
               USING WS-FILENAME 
                     WS-CONTENT 
                     WS-FILE-STATUS
           
           IF WS-FILE-STATUS = 0
              DISPLAY "  OK: Fichier �crit avec succ�s"
              
              OPEN INPUT TEST-FILE
              IF WS-TEST-FILE-STATUS = "00"
                 READ TEST-FILE INTO WS-READ-CONTENT
                 IF WS-TEST-FILE-STATUS = "00"
                    IF WS-READ-CONTENT = WS-CONTENT
                       DISPLAY "  OK: Contenu du fichier correct"
                    ELSE
                       DISPLAY "  �CHEC: Contenu du fichier incorrect"
                       DISPLAY "    Attendu: " WS-CONTENT
                       DISPLAY "    Obtenu: " WS-READ-CONTENT
                       MOVE 1 TO WS-TEST-RESULT
                    END-IF
                 ELSE
                    DISPLAY "  �CHEC: Erreur lors de la lecture"
                    DISPLAY "    Code: " WS-TEST-FILE-STATUS
                    MOVE 1 TO WS-TEST-RESULT
                 END-IF
                 CLOSE TEST-FILE
              ELSE
                 DISPLAY "  �CHEC: Erreur lors de l'ouverture"
                 DISPLAY "    Code: " WS-TEST-FILE-STATUS
                 MOVE 1 TO WS-TEST-RESULT
              END-IF
           ELSE
              DISPLAY "  �CHEC: Erreur lors de l'�criture"
              DISPLAY "    Code: " WS-FILE-STATUS
              MOVE 1 TO WS-TEST-RESULT
           END-IF
           
           MOVE WS-TEST-RESULT TO RETURN-CODE
           STOP RUN.
       END PROGRAM TEST_FILE_HANDLER.
