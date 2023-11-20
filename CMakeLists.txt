cmake_minimum_required(VERSION 3.0)
project(ADRouter)

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_CXX_FLAGS_DEBUG "-Wall -g -O0")
set(CMAKE_CXX_FLAGS_VERBOSE "-Wall -Wextra -g -O0 -DVERBOSE")
set(CMAKE_CXX_FLAGS_RELEASE "-Wall -O3")

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
elseif(CMAKE_BUILD_TYPE STREQUAL "Verbose")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_VERBOSE}")
endif()


include_directories(inc)
file(GLOB SOURCES "src/*.cpp")
add_executable(ADRouter ${SOURCES})

# Uncomment and edit the following lines if you have other directories or libraries to include
# add_subdirectory(tests)
# add_subdirectory(tools)
# target_link_libraries(YourExecutableName library_name)

# Copy the executable to the bin directory after a release build
if(CMAKE_BUILD_TYPE STREQUAL "Release")
  add_custom_command(TARGET ADRouter POST_BUILD
                     COMMAND ${CMAKE_COMMAND} -E copy
                             $<TARGET_FILE:ADRouter>
                             ${CMAKE_SOURCE_DIR}/bin/$<TARGET_FILE_NAME:ADRouter>)
endif()

# How to use?
# For a release build:`cmake -DCMAKE_BUILD_TYPE=release ..`
# For a debug build: `cmake -DCMAKE_BUILD_TYPE=debug ..`