cmake_minimum_required(VERSION 3.10)
project(HelloCobol)

# Check if GnuCOBOL is installed
find_program(COBC_EXECUTABLE cobc)
if(NOT COBC_EXECUTABLE)
    message(FATAL_ERROR "GnuCOBOL compiler (cobc) not found. Please install GnuCOBOL.")
endif()

# Create output directory for binaries
file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Function to compile COBOL files
function(add_cobol_executable target_name source_file)
    add_custom_command(
        OUTPUT ${CMAKE_BINARY_DIR}/bin/${target_name}
        COMMAND ${COBC_EXECUTABLE} -x -o ${CMAKE_BINARY_DIR}/bin/${target_name} ${CMAKE_CURRENT_SOURCE_DIR}/${source_file}
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${source_file}
        COMMENT "Compiling COBOL program ${source_file}"
    )
    add_custom_target(${target_name} ALL DEPENDS ${CMAKE_BINARY_DIR}/bin/${target_name})
endfunction()

# Compile our Hello World program
add_cobol_executable(hello hello.cbl)
