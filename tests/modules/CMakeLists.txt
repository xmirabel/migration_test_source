# Compiler les tests pour les modules
add_cobol_test(calculator 
    ${CMAKE_CURRENT_SOURCE_DIR}/test_calculator.cbl
    ${CMAKE_BINARY_DIR}/libcalculator.so
)

add_cobol_test(file_handler 
    ${CMAKE_CURRENT_SOURCE_DIR}/test_file_handler.cbl
    ${CMAKE_BINARY_DIR}/libfile_handler.so
)

# Dépendances
add_dependencies(test_calculator calculator)
add_dependencies(test_file_handler file_handler)
