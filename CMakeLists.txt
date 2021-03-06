cmake_minimum_required(VERSION 3.4.3)
project(llvm_playground)
find_package(LLVM REQUIRED CONFIG)
include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})
link_directories(${LLVM_LIBRARY_DIRS})

#
# We will build one library: libtmplugin.so.  It corresponds to a plugin that we
# run when compiling.
#

#
# Files associated with libtmplugin.so
#

add_library(llvm_playground MODULE
    llvm_test.cpp
)

target_link_libraries(llvm_playground ${llvm_libs})

#
# Turn on C++11, turn off C++ RTTI.
#
target_compile_features(llvm_playground PRIVATE cxx_range_for cxx_auto_type)
set_target_properties(llvm_playground PROPERTIES COMPILE_FLAGS "-fno-rtti")

set(CMAKE_CXX_FLAGS "-e main")
#
# OS X-specific configuration
#
if(APPLE)
    set_target_properties(llvm_playground PROPERTIES LINK_FLAGS "-undefined dynamic_lookup")
endif(APPLE)

