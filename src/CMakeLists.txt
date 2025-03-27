# Définir les sources des modules utilitaires
set(UTILS_SOURCES
    utils/date_utils.cbl
    utils/string_utils.cbl
)

# Définir les sources des modules fonctionnels
set(MODULE_SOURCES
    modules/calculator.cbl
)

# Compiler le programme principal avec un chemin de sortie explicite
add_cobol_executable(cobol_app_exe 
    ${CMAKE_CURRENT_SOURCE_DIR}/main.cbl
    ${CMAKE_CURRENT_SOURCE_DIR}/utils/date_utils.cbl
    ${CMAKE_CURRENT_SOURCE_DIR}/utils/string_utils.cbl
    ${CMAKE_CURRENT_SOURCE_DIR}/modules/calculator.cbl
)
