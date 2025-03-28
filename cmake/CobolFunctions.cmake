# Fonction pour compiler les fichiers COBOL en exécutables
function(add_cobol_executable target_name main_source)
    # Utiliser un chemin de sortie absolu pour éviter les conflits
    set(cobc_output "${CMAKE_BINARY_DIR}/${target_name}")
    
    # Commande pour compiler le programme principal avec suppression des avertissements
    add_custom_command(
        OUTPUT ${cobc_output}
        COMMAND ${CMAKE_COMMAND} -E env "COB_CFLAGS=-w" 
                ${COBC_EXECUTABLE} -x ${COBC_FLAGS_EXEC} -o ${cobc_output} ${main_source} ${ARGN}
        DEPENDS ${main_source} ${ARGN}
        COMMENT "Compiling COBOL executable ${target_name}"
        VERBATIM
    )
    
    # Cible personnalisée pour le programme
    add_custom_target(${target_name} ALL DEPENDS ${cobc_output})
endfunction()

# Fonction pour compiler les modules COBOL
function(add_cobol_module target_name source_file)
    # Utiliser un chemin de sortie absolu pour éviter les conflits
    set(cobc_output "${CMAKE_BINARY_DIR}/lib${target_name}.so")
    
    # Créer un script shell pour compiler le module
    set(compile_script "${CMAKE_BINARY_DIR}/compile_${target_name}.sh")
    file(WRITE ${compile_script} "#!/bin/bash\n")
    file(APPEND ${compile_script} "cd ${CMAKE_BINARY_DIR}\n")
    file(APPEND ${compile_script} "${COBC_EXECUTABLE} -m -Wall -std=default -debug -o lib${target_name}.so \"${source_file}\"\n")
    
    # Rendre le script exécutable
    execute_process(COMMAND chmod +x ${compile_script})
    
    # Commande pour exécuter le script de compilation
    add_custom_command(
        OUTPUT ${cobc_output}
        COMMAND ${compile_script}
        DEPENDS ${source_file} ${compile_script}
        COMMENT "Compiling COBOL module ${target_name}"
        VERBATIM
    )
    
    # Cible personnalisée pour le module
    add_custom_target(${target_name} ALL DEPENDS ${cobc_output})
endfunction()



