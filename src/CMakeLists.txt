# Compiler les modules utilitaires
set(UTILS_SOURCES
    utils/date_utils.cbl
    utils/string_utils.cbl
)

# Compiler les modules fonctionnels
set(MODULE_SOURCES
    modules/calculator.cbl
)

# Compiler le programme principal
add_cobol_executable(cobol_app 
    ${CMAKE_CURRENT_SOURCE_DIR}/main.cbl
    ${CMAKE_CURRENT_SOURCE_DIR}/utils/date_utils.cbl
    ${CMAKE_CURRENT_SOURCE_DIR}/utils/string_utils.cbl
    ${CMAKE_CURRENT_SOURCE_DIR}/modules/calculator.cbl
)
