# Fonction pour compiler les fichiers COBOL en exécutables
function(add_cobol_executable target_name main_source)
    # Utiliser un chemin de sortie absolu pour éviter les conflits
    set(cobc_output "${CMAKE_BINARY_DIR}/${target_name}")
    
    # Commande pour compiler le programme principal
    add_custom_command(
        OUTPUT ${cobc_output}
        COMMAND cd ${CMAKE_BINARY_DIR} && ${CMAKE_COMMAND} -E env "COB_CFLAGS=-w" 
                ${COBC_EXECUTABLE} -x -Wall -std=default -debug -o ${target_name} "${main_source}" ${ARGN}
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
    
    # Commande pour compiler le module
    add_custom_command(
        OUTPUT ${cobc_output}
        COMMAND cd ${CMAKE_BINARY_DIR} && ${COBC_EXECUTABLE} -m -Wall -std=default -debug -o lib${target_name}.so "${source_file}"
        DEPENDS ${source_file}
        COMMENT "Compiling COBOL module ${target_name}"
        VERBATIM
    )
    
    # Cible personnalisée pour le module
    add_custom_target(${target_name} ALL DEPENDS ${cobc_output})
endfunction()
