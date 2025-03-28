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

# Créer des liens symboliques pour les modules
add_custom_command(
    TARGET cobol_app_exe
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E create_symlink libstring_utils.so STRING_UTILS.so
    COMMAND ${CMAKE_COMMAND} -E create_symlink libdate_utils.so DATE_UTILS.so
    COMMAND ${CMAKE_COMMAND} -E create_symlink libcalculator.so CALCULATOR.so
    COMMAND ${CMAKE_COMMAND} -E create_symlink libfile_handler.so FILE_HANDLER.so
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    COMMENT "Creating symbolic links for modules"
    VERBATIM
)

# Créer un script d'exécution
set(run_script "${CMAKE_BINARY_DIR}/run_app.sh")
file(WRITE ${run_script} "#!/bin/bash\n")
file(APPEND ${run_script} "export COB_LIBRARY_PATH=${CMAKE_BINARY_DIR}\n")
file(APPEND ${run_script} "${CMAKE_BINARY_DIR}/cobol_app_exe\n")

# Rendre le script exécutable
execute_process(COMMAND chmod +x ${run_script})

message(STATUS "Script d'exécution créé: ${run_script}")
