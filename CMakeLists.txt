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
set(COBC_FLAGS_EXEC "-Wall -std=default -debug")
set(COBC_FLAGS_MODULE "-Wall -std=default -debug")

# Répertoires d'inclusion
include_directories(${CMAKE_SOURCE_DIR}/include)

# Inclure les fonctions COBOL
include(${CMAKE_SOURCE_DIR}/cmake/CobolFunctions.cmake)

# Activer les tests
enable_testing()

# Sous-répertoires du projet
add_subdirectory(src)
add_subdirectory(tests)
