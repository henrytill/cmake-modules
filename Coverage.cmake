include(Platform)

# https://discourse.cmake.org/t/guideline-for-code-coverage/167/2
# https://gitlab.kitware.com/cmake/cmake/-/issues/19942
# https://gitlab.kitware.com/cmb/smtk/blob/master/.gitlab/ci/ctest_coverage.cmake
# https://gitlab.kitware.com/cmb/smtk/blob/master/CMake/SMTKCoverage.cmake

option(ENABLE_COVERAGE "Enable coverage reporting" FALSE)
mark_as_advanced(ENABLE_COVERAGE)

if(ENABLE_COVERAGE)
  if(GCC)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --coverage")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --coverage")
  elseif(CLANG)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fprofile-arcs -ftest-coverage -fprofile-instr-generate -fcoverage-mapping")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fprofile-arcs -ftest-coverage -fno-elide-constructors -fprofile-instr-generate -fcoverage-mapping")
  else()
    message(FATAL_ERROR "Coverage reporting is only supported for GCC and Clang")
  endif()
endif()
