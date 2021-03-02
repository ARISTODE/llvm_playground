cmake_minimum_required(VERSION 3.4.3)
project(llvm_playground)

if (DEFINED LLVM_DIR)
    set(ENV{LLVM_DIR} "${LLVM_DIR}")
endif()
# out of tree build
find_package(LLVM REQUIRED CONFIG)
include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})
link_directories(${LLVM_LIBRARY_DIRS})
include_directories("PDG/include")
# include_directories("sea-dsa/include/")

#
# We will build one library: libtmplugin.so.  It corresponds to a plugin that we
# run when compiling.
#

#
# Files associated with libtmplugin.so
#

message("LLVM STATUS:
   Definitions ${LLVM_DEFINITIONS}
   Includes    ${LLVM_INCLUDE_DIRS}
   Libraries   ${LLVM_LIBRARY_DIRS}
   Targets     ${LLVM_TARGETS_TO_BUILD}"
 )



set(CMAKE_CXX_FLAGS "-fPIC -std=gnu++14 -O3 -fno-rtti -Wno-deprecated")

# add_library(PDG SHARED IMPORTED)
# set_target_properties(PDG PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/PDG/libpdg.so )

add_library(llvm_playground MODULE
    llvm_test.cpp
)


target_link_libraries(llvm_playground PUBLIC "${CMAKE_SOURCE_DIR}/PDG/libpdg_shared.a")
# target_link_libraries(llvm_playground PUBLIC "${CMAKE_SOURCE_DIR}/SVF/lib/libSVF.a" "${CMAKE_SOURCE_DIR}/sea-dsa/build/lib/libSeaDsaAnalysis.a")

#
# OS X-specific configuration
#
if(APPLE)
    set_target_properties(llvm_playground PROPERTIES LINK_FLAGS "-undefined dynamic_lookup")
endif(APPLE)

