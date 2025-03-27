# Compiler les tests pour les utilitaires
add_cobol_test(date_utils 
    ${CMAKE_CURRENT_SOURCE_DIR}/test_date_utils.cbl
    ${CMAKE_BINARY_DIR}/libdate_utils.so
)

add_cobol_test(string_utils 
    ${CMAKE_CURRENT_SOURCE_DIR}/test_string_utils.cbl
    ${CMAKE_BINARY_DIR}/libstring_utils.so
)

# Dépendances
add_dependencies(test_date_utils date_utils)
add_dependencies(test_string_utils string_utils)
