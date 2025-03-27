       IDENTIFICATION DIVISION.
       PROGRAM-ID. DATE_UTILS.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       LINKAGE SECTION.
       01 LS-CURRENT-DATE.
          05 LS-YEAR            PIC 9(4).
          05 LS-MONTH           PIC 9(2).
          05 LS-DAY             PIC 9(2).
       01 LS-FORMATTED-DATE     PIC X(10).
       
       PROCEDURE DIVISION USING LS-CURRENT-DATE, LS-FORMATTED-DATE.
       MAIN-PROCEDURE.
           STRING LS-DAY DELIMITED BY SIZE
                  "/" DELIMITED BY SIZE
                  LS-MONTH DELIMITED BY SIZE
                  "/" DELIMITED BY SIZE
                  LS-YEAR DELIMITED BY SIZE
                  INTO LS-FORMATTED-DATE
           END-STRING
           
           GOBACK.
       END PROGRAM DATE_UTILS.
