# Fonction pour compiler les fichiers COBOL en ex�cutables
function(add_cobol_executable target_name main_source)
    # Utiliser un chemin de sortie absolu pour �viter les conflits
    set(cobc_output "${CMAKE_BINARY_DIR}/${target_name}")
    
    # Cr�er un script shell pour compiler l'ex�cutable
    set(compile_script "${CMAKE_BINARY_DIR}/compile_${target_name}.sh")
    file(WRITE ${compile_script} "#!/bin/bash\n")
    file(APPEND ${compile_script} "cd ${CMAKE_BINARY_DIR}\n")
    file(APPEND ${compile_script} "export COB_CFLAGS=-w\n")
    file(APPEND ${compile_script} "${COBC_EXECUTABLE} -x -Wall -std=default -debug -o ${main_source}")
    
    # Ajouter les arguments suppl�mentaires
    foreach(arg IN LISTS ARGN)
        file(APPEND ${compile_script} " \"${arg}\"")
    endforeach()
    
    file(APPEND ${compile_script} "\n")
    
    # Rendre le script ex�cutable
    execute_process(COMMAND chmod +x ${compile_script})
    
    # Commande pour ex�cuter le script de compilation
    add_custom_command(
        OUTPUT ${cobc_output}
        COMMAND ${compile_script}
        DEPENDS ${main_source} ${ARGN} ${compile_script}
        COMMENT "Compiling COBOL executable ${target_name}"
        VERBATIM
    )
    
    # Cible personnalis�e pour le programme
    add_custom_target(${target_name} ALL DEPENDS ${cobc_output})
endfunction()

# Fonction pour compiler les modules COBOL avec nom interne sp�cifi�
function(add_cobol_module target_name source_file module_name)
    # Utiliser un chemin de sortie absolu pour �viter les conflits
    set(cobc_output "${CMAKE_BINARY_DIR}/lib${target_name}.so")
    
    # Cr�er un script shell pour compiler le module
    set(compile_script "${CMAKE_BINARY_DIR}/compile_${target_name}.sh")
    file(WRITE ${compile_script} "#!/bin/bash\n")
    file(APPEND ${compile_script} "cd ${CMAKE_BINARY_DIR}\n")
    file(APPEND ${compile_script} "${COBC_EXECUTABLE} -m -Wall -std=default -debug -o lib${target_name}.so \"-module-name=${module_name}\" \"${source_file}\"\n")
    
    # Rendre le script ex�cutable
    execute_process(COMMAND chmod +x ${compile_script})
    
    # Commande pour ex�cuter le script de compilation
    add_custom_command(
        OUTPUT ${cobc_output}
        COMMAND ${compile_script}
        DEPENDS ${source_file} ${compile_script}
        COMMENT "Compiling COBOL module ${target_name} with internal name ${module_name}"
        VERBATIM
    )
    
    # Cible personnalis�e pour le module
    add_custom_target(${target_name} ALL DEPENDS ${cobc_output})
endfunction()