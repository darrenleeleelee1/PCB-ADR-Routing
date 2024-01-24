cmake_minimum_required(VERSION 3.14)
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

target_link_libraries(ADRouter stdc++fs)


# Copy the executable to the bin directory after a release build
if(CMAKE_BUILD_TYPE STREQUAL "Release")
  add_custom_command(TARGET ADRouter POST_BUILD
                     COMMAND ${CMAKE_COMMAND} -E copy
                             $<TARGET_FILE:ADRouter>
                             ${CMAKE_SOURCE_DIR}/bin/$<TARGET_FILE_NAME:ADRouter>)
endif()


# Add the json library
# include(FetchContent)

# FetchContent_Declare(
#     json
#     GIT_REPOSITORY https://github.com/nlohmann/json.git
#     GIT_TAG v3.10.5  # or whichever version you prefer
# )

# FetchContent_GetProperties(json)
# if(NOT json_POPULATED)
#     FetchContent_Populate(json)
#     add_subdirectory(${json_SOURCE_DIR} ${json_BINARY_DIR} EXCLUDE_FROM_ALL)
# endif()
# target_link_libraries(ADRouter PRIVATE nlohmann_json::nlohmann_json)
# End of json library


# Google Test integration
include(FetchContent)
FetchContent_Declare(
    googletest
    URL https://github.com/google/googletest/archive/release-1.10.0.tar.gz
)
FetchContent_MakeAvailable(googletest)

# Create the io_test executable and link it with Google Test
add_executable(io_test tests/io_test.cpp)
target_link_libraries(io_test gtest gtest_main)

# Enable testing and specify the tests to run
include(GoogleTest)
gtest_discover_tests(io_test)

enable_testing()


# Uncomment and edit the following lines if you have other directories or libraries to include
# add_subdirectory(tools)
# target_link_libraries(YourExecutableName library_name)


# How to use?
# For a release build:`cmake -DCMAKE_BUILD_TYPE=release ..`
# For a debug build: `cmake -DCMAKE_BUILD_TYPE=debug ..`