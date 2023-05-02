set(PWD ${CMAKE_CURRENT_LIST_DIR})

function(test_has_attribute_cleanup)
  try_compile(HAS_ATTRIBUTE_CLEANUP
              ${CMAKE_CURRENT_BINARY_DIR}
              ${PWD}/has_attribute_cleanup.c
              C_STANDARD 99
              C_STANDARD_REQUIRED ON
              COPY_FILE ${CMAKE_CURRENT_BINARY_DIR}/feature/has_attribute_cleanup)
endfunction()

function(test_has_builtin_types_compatible_p)
  try_compile(HAS_BUILTIN_TYPES_COMPATIBLE_P
              ${CMAKE_CURRENT_BINARY_DIR}
              ${PWD}/has_builtin_types_compatible_p.c
              C_STANDARD 11
              C_STANDARD_REQUIRED ON
              COPY_FILE ${CMAKE_CURRENT_BINARY_DIR}/feature/has_builtin_types_compatible_p)
endfunction()
