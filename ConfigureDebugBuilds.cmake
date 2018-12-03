# ConfigureDebugBuilds.cmake
#
# Mark J. Olah (mjo@cs.unm DOT edu)
# Copyright 2018
# see file: LICENCE
#
# Configure common debugging flags and deginitions for debug builds only.
#
#

# CFLAGS ##
#Debugging configuration
add_compile_options($<$<AND:$<CONFIG:Debug>,$<CXX_COMPILER_ID:GNU>>:-O0>) #No optimization for debugging
add_compile_options($<$<CONFIG:Debug>:-W -Wall -Wextra>) #Add warnings in debug configurations
set_property(DIRECTORY APPEND PROPERTY COMPILE_DEFINITIONS $<$<CONFIG:Debug>:DEBUG>) 
set(CMAKE_DEBUG_POSTFIX ".debug" CACHE STRING "Debug file extension")
#Limit # of errors reported by gcc
set_property(DIRECTORY APPEND PROPERTY COMPILE_OPTIONS $<$<AND:$<CONFIG:Debug>,$<CXX_COMPILER_ID:GNU>>:-fmax-errors=5>)
