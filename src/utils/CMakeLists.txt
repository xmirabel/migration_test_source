# Compiler les modules utilitaires avec noms internes spécifiés
add_cobol_module(date_utils 
    ${CMAKE_CURRENT_SOURCE_DIR}/date_utils.cbl
    "DATE_UTILS"
)

add_cobol_module(string_utils 
    ${CMAKE_CURRENT_SOURCE_DIR}/string_utils.cbl
    "STRING_UTILS"
)
