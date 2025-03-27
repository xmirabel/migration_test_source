       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILE_HANDLER.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OUTPUT-FILE ASSIGN TO DYNAMIC WS-FILENAME
           ORGANIZATION IS LINE SEQUENTIAL
           FILE STATUS IS WS-FILE-STATUS.
       
       DATA DIVISION.
       FILE SECTION.
       FD OUTPUT-FILE.
       01 FILE-RECORD             PIC X(1000).
       
       WORKING-STORAGE SECTION.
       01 WS-FILENAME             PIC X(100).
       01 WS-FILE-STATUS          PIC X(2).
       
       LINKAGE SECTION.
       01 LS-FILENAME             PIC X(100).
       01 LS-CONTENT              PIC X(1000).
       01 LS-STATUS               PIC 9(2).
       
       PROCEDURE DIVISION USING LS-FILENAME, LS-CONTENT, LS-STATUS.
       MAIN-PROCEDURE.
           MOVE LS-FILENAME TO WS-FILENAME
           MOVE 0 TO LS-STATUS
           
           OPEN OUTPUT OUTPUT-FILE
           IF WS-FILE-STATUS = "00"
              MOVE LS-CONTENT TO FILE-RECORD
              WRITE FILE-RECORD
              IF WS-FILE-STATUS NOT = "00"
                 MOVE 1 TO LS-STATUS
              END-IF
           ELSE
              MOVE 2 TO LS-STATUS
           END-IF
           CLOSE OUTPUT-FILE
           
           GOBACK.
       END PROGRAM FILE_HANDLER.
