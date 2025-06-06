cmake_minimum_required(VERSION 3.10)
project(CobolApp LANGUAGES C)

# V�rifier si les outils de base sont install�s
find_program(NINJA_EXECUTABLE ninja)
find_program(GCC_EXECUTABLE gcc)
find_program(COBC_EXECUTABLE cobc)

# V�rifier les d�pendances et afficher des messages d'erreur si n�cessaire
set(MISSING_DEPENDENCIES FALSE)

if(NOT NINJA_EXECUTABLE)
    message(WARNING "Ninja n'est pas install�. Veuillez l'installer avec : sudo apt install -y ninja-build")
    set(MISSING_DEPENDENCIES TRUE)
endif()

if(NOT GCC_EXECUTABLE)
    message(WARNING "GCC n'est pas install�. Veuillez l'installer avec : sudo apt install -y build-essential")
    set(MISSING_DEPENDENCIES TRUE)
endif()

if(NOT COBC_EXECUTABLE)
    message(WARNING "GnuCOBOL n'est pas install�. Veuillez l'installer avec : sudo apt install -y gnucobol")
    set(MISSING_DEPENDENCIES TRUE)
endif()

if(MISSING_DEPENDENCIES)
    message(FATAL_ERROR "Des d�pendances sont manquantes. Veuillez installer les outils requis en ex�cutant :
    sudo apt update
    sudo apt install -y build-essential ninja-build gcc g++ cmake gnucobol")
endif()

# Afficher les chemins des outils trouv�s
message(STATUS "Ninja trouv�: ${NINJA_EXECUTABLE}")
message(STATUS "GCC trouv�: ${GCC_EXECUTABLE}")
message(STATUS "GnuCOBOL trouv�: ${COBC_EXECUTABLE}")

# D�finir explicitement le compilateur C
set(CMAKE_C_COMPILER ${GCC_EXECUTABLE})

# Options de compilation pour GnuCOBOL
set(COBC_FLAGS_EXEC -Wall -std=default -debug)
set(COBC_FLAGS_MODULE -Wall -std=default -debug)

# R�pertoires d'inclusion
include_directories(${CMAKE_SOURCE_DIR}/include)

# Inclure les fonctions COBOL
include(${CMAKE_SOURCE_DIR}/cmake/CobolFunctions.cmake)

# Activer les tests
enable_testing()

# Sous-r�pertoires du projet
add_subdirectory(src)
add_subdirectory(tests)
