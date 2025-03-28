# Ajouter les sous-répertoires de tests
add_subdirectory(utils)
add_subdirectory(modules)

# Compiler l'exécuteur de tests
add_cobol_executable(test_runner 
    ${CMAKE_CURRENT_SOURCE_DIR}/test_runner.cbl
)

# Créer un script d'exécution pour les tests
set(run_tests_script "${CMAKE_BINARY_DIR}/run_tests.sh")
file(WRITE ${run_tests_script} "#!/bin/bash\n")
file(APPEND ${run_tests_script} "export COB_LIBRARY_PATH=${CMAKE_BINARY_DIR}\n")
file(APPEND ${run_tests_script} "${CMAKE_BINARY_DIR}/test_runner\n")

# Rendre le script exécutable
execute_process(COMMAND chmod +x ${run_tests_script})

message(STATUS "Script d'exécution des tests créé: ${run_tests_script}")
