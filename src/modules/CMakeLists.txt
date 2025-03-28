# Compiler les modules fonctionnels avec noms internes spécifiés
add_cobol_module(calculator 
    ${CMAKE_CURRENT_SOURCE_DIR}/calculator.cbl
    "CALCULATOR"
)

add_cobol_module(file_handler 
    ${CMAKE_CURRENT_SOURCE_DIR}/file_handler.cbl
    "FILE_HANDLER"
)
