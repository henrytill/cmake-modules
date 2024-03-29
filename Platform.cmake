if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
  set(LINUX TRUE)
endif()

if(CMAKE_C_COMPILER_ID   STREQUAL "Clang"      OR
   CMAKE_CXX_COMPILER_ID STREQUAL "Clang"      OR
   CMAKE_C_COMPILER_ID   STREQUAL "AppleClang" OR
   CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang")
  SET(CLANG TRUE)
endif()

if(CMAKE_C_COMPILER_ID   STREQUAL "GNU" OR
   CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
  SET(GCC TRUE)
endif()

if(MINGW)
  set(MINGW_DIRECTORY C:/msys64/mingw64 CACHE PATH "Path to mingw directory" FORCE)
endif()
