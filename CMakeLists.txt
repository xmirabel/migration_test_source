cmake_minimum_required(VERSION 3.10)
project(CobolApp LANGUAGES C)

# Vérifier si les outils de base sont installés
find_program(NINJA_EXECUTABLE ninja)
find_program(GCC_EXECUTABLE gcc)
find_program(COBC_EXECUTABLE cobc)

# Vérifier les dépendances et afficher des messages d'erreur si nécessaire
set(MISSING_DEPENDENCIES FALSE)

if(NOT NINJA_EXECUTABLE)
    message(WARNING "Ninja n'est pas installé. Veuillez l'installer avec : sudo apt install -y ninja-build")
    set(MISSING_DEPENDENCIES TRUE)
endif()

if(NOT GCC_EXECUTABLE)
    message(WARNING "GCC n'est pas installé. Veuillez l'installer avec : sudo apt install -y build-essential")
    set(MISSING_DEPENDENCIES TRUE)
endif()

if(NOT COBC_EXECUTABLE)
    message(WARNING "GnuCOBOL n'est pas installé. Veuillez l'installer avec : sudo apt install -y gnucobol")
    set(MISSING_DEPENDENCIES TRUE)
endif()

if(MISSING_DEPENDENCIES)
    message(FATAL_ERROR "Des dépendances sont manquantes. Veuillez installer les outils requis en exécutant :
    sudo apt update
    sudo apt install -y build-essential ninja-build gcc g++ cmake gnucobol")
endif()

# Afficher les chemins des outils trouvés
message(STATUS "Ninja trouvé: ${NINJA_EXECUTABLE}")
message(STATUS "GCC trouvé: ${GCC_EXECUTABLE}")
message(STATUS "GnuCOBOL trouvé: ${COBC_EXECUTABLE}")

# Définir explicitement le compilateur C
set(CMAKE_C_COMPILER ${GCC_EXECUTABLE})

# Options de compilation pour GnuCOBOL
set(COBC_FLAGS "-x" "-Wall" "-std=default" "-debug")

# Répertoires d'inclusion
include_directories(${CMAKE_SOURCE_DIR}/include)

# Fonction pour compiler les fichiers COBOL
function(add_cobol_executable target_name main_source)
    set(cobc_output "${CMAKE_CURRENT_BINARY_DIR}/${target_name}")
    
    # Commande pour compiler le programme principal
    add_custom_command(
        OUTPUT ${cobc_output}
        COMMAND ${COBC_EXECUTABLE} ${COBC_FLAGS} -o ${cobc_output} ${main_source} ${ARGN}
        DEPENDS ${main_source} ${ARGN}
        COMMENT "Compiling COBOL executable ${target_name}"
        VERBATIM
    )
    
    # Cible personnalisée pour le programme
    add_custom_target(${target_name} ALL DEPENDS ${cobc_output})
endfunction()

# Vérifier si le répertoire src existe
if(NOT EXISTS "${CMAKE_SOURCE_DIR}/src")
    message(FATAL_ERROR "Le répertoire src n'existe pas. Veuillez créer une structure de projet appropriée.")
endif()

# Sous-répertoires du projet
add_subdirectory(src)
