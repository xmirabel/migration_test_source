# Compiler les modules fonctionnels
add_cobol_module(calculator 
    ${CMAKE_CURRENT_SOURCE_DIR}/calculator.cbl
)

add_cobol_module(file_handler 
    ${CMAKE_CURRENT_SOURCE_DIR}/file_handler.cbl
)
