# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.12.1/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.12.1/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/yongzhehuang/Documents/pdg-projects/llvm_playground

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/yongzhehuang/Documents/pdg-projects/llvm_playground/build

# Include any dependencies generated for this target.
include CMakeFiles/llvm_playground.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/llvm_playground.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/llvm_playground.dir/flags.make

CMakeFiles/llvm_playground.dir/llvm_test.cpp.o: CMakeFiles/llvm_playground.dir/flags.make
CMakeFiles/llvm_playground.dir/llvm_test.cpp.o: ../llvm_test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yongzhehuang/Documents/pdg-projects/llvm_playground/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/llvm_playground.dir/llvm_test.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/llvm_playground.dir/llvm_test.cpp.o -c /Users/yongzhehuang/Documents/pdg-projects/llvm_playground/llvm_test.cpp

CMakeFiles/llvm_playground.dir/llvm_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/llvm_playground.dir/llvm_test.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/yongzhehuang/Documents/pdg-projects/llvm_playground/llvm_test.cpp > CMakeFiles/llvm_playground.dir/llvm_test.cpp.i

CMakeFiles/llvm_playground.dir/llvm_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/llvm_playground.dir/llvm_test.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/yongzhehuang/Documents/pdg-projects/llvm_playground/llvm_test.cpp -o CMakeFiles/llvm_playground.dir/llvm_test.cpp.s

# Object files for target llvm_playground
llvm_playground_OBJECTS = \
"CMakeFiles/llvm_playground.dir/llvm_test.cpp.o"

# External object files for target llvm_playground
llvm_playground_EXTERNAL_OBJECTS =

libllvm_playground.so: CMakeFiles/llvm_playground.dir/llvm_test.cpp.o
libllvm_playground.so: CMakeFiles/llvm_playground.dir/build.make
libllvm_playground.so: CMakeFiles/llvm_playground.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/yongzhehuang/Documents/pdg-projects/llvm_playground/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared module libllvm_playground.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/llvm_playground.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/llvm_playground.dir/build: libllvm_playground.so

.PHONY : CMakeFiles/llvm_playground.dir/build

CMakeFiles/llvm_playground.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/llvm_playground.dir/cmake_clean.cmake
.PHONY : CMakeFiles/llvm_playground.dir/clean

CMakeFiles/llvm_playground.dir/depend:
	cd /Users/yongzhehuang/Documents/pdg-projects/llvm_playground/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/yongzhehuang/Documents/pdg-projects/llvm_playground /Users/yongzhehuang/Documents/pdg-projects/llvm_playground /Users/yongzhehuang/Documents/pdg-projects/llvm_playground/build /Users/yongzhehuang/Documents/pdg-projects/llvm_playground/build /Users/yongzhehuang/Documents/pdg-projects/llvm_playground/build/CMakeFiles/llvm_playground.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/llvm_playground.dir/depend

