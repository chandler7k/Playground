# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

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
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/zouhuanlin/Documents/GitHub/Playground/cppprimer/Chapter-1/1.1/StandInOutPut

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/zouhuanlin/Documents/GitHub/Playground/cppprimer/Chapter-1/1.1/StandInOutPut/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/StandInOutPut.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/StandInOutPut.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/StandInOutPut.dir/flags.make

CMakeFiles/StandInOutPut.dir/main.cpp.o: CMakeFiles/StandInOutPut.dir/flags.make
CMakeFiles/StandInOutPut.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zouhuanlin/Documents/GitHub/Playground/cppprimer/Chapter-1/1.1/StandInOutPut/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/StandInOutPut.dir/main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/StandInOutPut.dir/main.cpp.o -c /Users/zouhuanlin/Documents/GitHub/Playground/cppprimer/Chapter-1/1.1/StandInOutPut/main.cpp

CMakeFiles/StandInOutPut.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/StandInOutPut.dir/main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/zouhuanlin/Documents/GitHub/Playground/cppprimer/Chapter-1/1.1/StandInOutPut/main.cpp > CMakeFiles/StandInOutPut.dir/main.cpp.i

CMakeFiles/StandInOutPut.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/StandInOutPut.dir/main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/zouhuanlin/Documents/GitHub/Playground/cppprimer/Chapter-1/1.1/StandInOutPut/main.cpp -o CMakeFiles/StandInOutPut.dir/main.cpp.s

# Object files for target StandInOutPut
StandInOutPut_OBJECTS = \
"CMakeFiles/StandInOutPut.dir/main.cpp.o"

# External object files for target StandInOutPut
StandInOutPut_EXTERNAL_OBJECTS =

StandInOutPut: CMakeFiles/StandInOutPut.dir/main.cpp.o
StandInOutPut: CMakeFiles/StandInOutPut.dir/build.make
StandInOutPut: CMakeFiles/StandInOutPut.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/zouhuanlin/Documents/GitHub/Playground/cppprimer/Chapter-1/1.1/StandInOutPut/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable StandInOutPut"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/StandInOutPut.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/StandInOutPut.dir/build: StandInOutPut

.PHONY : CMakeFiles/StandInOutPut.dir/build

CMakeFiles/StandInOutPut.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/StandInOutPut.dir/cmake_clean.cmake
.PHONY : CMakeFiles/StandInOutPut.dir/clean

CMakeFiles/StandInOutPut.dir/depend:
	cd /Users/zouhuanlin/Documents/GitHub/Playground/cppprimer/Chapter-1/1.1/StandInOutPut/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/zouhuanlin/Documents/GitHub/Playground/cppprimer/Chapter-1/1.1/StandInOutPut /Users/zouhuanlin/Documents/GitHub/Playground/cppprimer/Chapter-1/1.1/StandInOutPut /Users/zouhuanlin/Documents/GitHub/Playground/cppprimer/Chapter-1/1.1/StandInOutPut/cmake-build-debug /Users/zouhuanlin/Documents/GitHub/Playground/cppprimer/Chapter-1/1.1/StandInOutPut/cmake-build-debug /Users/zouhuanlin/Documents/GitHub/Playground/cppprimer/Chapter-1/1.1/StandInOutPut/cmake-build-debug/CMakeFiles/StandInOutPut.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/StandInOutPut.dir/depend

