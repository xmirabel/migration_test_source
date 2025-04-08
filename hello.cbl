      *****************************************************************
      * Program:     HELLO                                            *
      * Author:      Lyn                                              *
      * Purpose:     Simple Hello World program to demonstrate COBOL  *
      *              syntax and structure                             *
      *****************************************************************
       IDENTIFICATION DIVISION.
      * The IDENTIFICATION DIVISION is mandatory and contains program metadata
       PROGRAM-ID. HELLO.
      
      *-----------------------------------------------------------------
       ENVIRONMENT DIVISION.
      * The ENVIRONMENT DIVISION is used to describe the computing environment
      * It's optional for simple programs like this one
      
      *-----------------------------------------------------------------
       DATA DIVISION.
      * The DATA DIVISION is where you define variables and data structures
      * It's optional if no variables are needed
      
      *-----------------------------------------------------------------
       PROCEDURE DIVISION.
      * The PROCEDURE DIVISION contains the executable program statements
           
      * DISPLAY is used to output text to the console
           DISPLAY "Hello, World!".
           
      * STOP RUN terminates the program execution
           STOP RUN.
      *-----------------------------------------------------------------
      * End of program HELLO
