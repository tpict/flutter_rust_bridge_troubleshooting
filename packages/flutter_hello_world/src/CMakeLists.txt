# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(flutter_hello_world_library VERSION 0.0.1 LANGUAGES C)

add_library(flutter_hello_world SHARED
  "flutter_hello_world.c"
)

set_target_properties(flutter_hello_world PROPERTIES
  PUBLIC_HEADER flutter_hello_world.h
  OUTPUT_NAME "flutter_hello_world"
)

target_compile_definitions(flutter_hello_world PUBLIC DART_SHARED_LIB)
