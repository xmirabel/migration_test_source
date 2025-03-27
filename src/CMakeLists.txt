# Ajouter les sous-répertoires
add_subdirectory(utils)
add_subdirectory(modules)

# Compiler le programme principal
add_cobol_executable(cobol_app_exe 
    ${CMAKE_CURRENT_SOURCE_DIR}/main.cbl
    ${CMAKE_BINARY_DIR}/libdate_utils.so
    ${CMAKE_BINARY_DIR}/libstring_utils.so
    ${CMAKE_BINARY_DIR}/libcalculator.so
    ${CMAKE_BINARY_DIR}/libfile_handler.so
)

# Dépendances
add_dependencies(cobol_app_exe 
    date_utils
    string_utils
    calculator
    file_handler
)
