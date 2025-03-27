# Compiler les tests pour les utilitaires
add_cobol_executable(test_date_utils 
    ${CMAKE_CURRENT_SOURCE_DIR}/test_date_utils.cbl
)

add_cobol_executable(test_string_utils 
    ${CMAKE_CURRENT_SOURCE_DIR}/test_string_utils.cbl
)

# Dépendances
add_dependencies(test_date_utils date_utils)
add_dependencies(test_string_utils string_utils)

# Ajouter les tests à CTest
add_test(NAME date_utils COMMAND ${CMAKE_BINARY_DIR}/test_date_utils)
add_test(NAME string_utils COMMAND ${CMAKE_BINARY_DIR}/test_string_utils)
