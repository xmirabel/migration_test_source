# Ajouter les sous-répertoires
add_subdirectory(utils)
add_subdirectory(modules)

# Compiler le programme principal
add_custom_command(
    OUTPUT ${CMAKE_BINARY_DIR}/cobol_app_exe
    COMMAND cd ${CMAKE_BINARY_DIR} && ${COBC_EXECUTABLE} -x -Wall -std=default -debug -o cobol_app_exe 
            ${CMAKE_CURRENT_SOURCE_DIR}/main.cbl
            ${CMAKE_BINARY_DIR}/libdate_utils.so
            ${CMAKE_BINARY_DIR}/libstring_utils.so
            ${CMAKE_BINARY_DIR}/libcalculator.so
            ${CMAKE_BINARY_DIR}/libfile_handler.so
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/main.cbl
            date_utils string_utils calculator file_handler
    COMMENT "Compiling COBOL executable cobol_app_exe"
    VERBATIM
)

add_custom_target(cobol_app_exe ALL DEPENDS ${CMAKE_BINARY_DIR}/cobol_app_exe)

# Créer un script d'exécution
set(run_script "${CMAKE_BINARY_DIR}/run_app.sh")
file(WRITE ${run_script} "#!/bin/bash\n")
file(APPEND ${run_script} "export COB_LIBRARY_PATH=${CMAKE_BINARY_DIR}\n")
file(APPEND ${run_script} "${CMAKE_BINARY_DIR}/cobol_app_exe\n")

# Rendre le script exécutable
execute_process(COMMAND chmod +x ${run_script})

message(STATUS "Script d'exécution créé: ${run_script}")
