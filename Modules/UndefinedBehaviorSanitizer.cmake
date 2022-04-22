get_property(isMultiConfig GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)

if(isMultiConfig)
  if(NOT "DebugUBSan" IN_LIST CMAKE_CONFIGURATION_TYPES)
    list(APPEND CMAKE_CONFIGURATION_TYPES DebugUBSan)
  endif()
else()
  get_property(HAS_BUILD_TYPES CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS SET)
  if(HAS_BUILD_TYPES)
    get_property(AVAILABLE_BUILD_TYPES CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS)
    list(APPEND AVAILABLE_BUILD_TYPES DebugUBSan)
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS ${AVAILABLE_BUILD_TYPES})
  endif()
endif()

set(CMAKE_C_FLAGS_DEBUGUBSAN
    "${CMAKE_C_FLAGS_DEBUG} -fsanitize=undefined"
    CACHE STRING "Flags used by the C compiler for DebugUBSan build type or configuration." FORCE)

set(CMAKE_CXX_FLAGS_DEBUGUBSAN
    "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=undefined"
    CACHE STRING "Flags used by the C++ compiler for DebugUBSan build type or configuration." FORCE)

set(CMAKE_EXE_LINKER_FLAGS_DEBUGUBSAN
    "${CMAKE_SHARED_LINKER_FLAGS_DEBUG} -fsanitize=undefined"
    CACHE STRING "Linker flags to be used to create executables for DebugUBSan build type." FORCE)

set(CMAKE_SHARED_LINKER_FLAGS_DEBUGUBSAN
    "${CMAKE_SHARED_LINKER_FLAGS_DEBUG} -fsanitize=undefined"
    CACHE STRING "Linker flags to be used to create shared libraries for DebugUBSan build type." FORCE)
