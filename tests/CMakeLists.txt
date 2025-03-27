# Ajouter les sous-répertoires de tests
add_subdirectory(utils)
add_subdirectory(modules)

# Compiler l'exécuteur de tests
add_cobol_executable(test_runner 
    ${CMAKE_CURRENT_SOURCE_DIR}/test_runner.cbl
)
