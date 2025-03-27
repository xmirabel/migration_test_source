# Compiler les tests pour les modules
add_cobol_executable(test_calculator 
    ${CMAKE_CURRENT_SOURCE_DIR}/test_calculator.cbl
)

add_cobol_executable(test_file_handler 
    ${CMAKE_CURRENT_SOURCE_DIR}/test_file_handler.cbl
)

# Dépendances
add_dependencies(test_calculator calculator)
add_dependencies(test_file_handler file_handler)

# Ajouter les tests à CTest
add_test(NAME calculator COMMAND ${CMAKE_BINARY_DIR}/test_calculator)
add_test(NAME file_handler COMMAND ${CMAKE_BINARY_DIR}/test_file_handler)
