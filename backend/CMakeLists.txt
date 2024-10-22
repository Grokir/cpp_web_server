cmake_minimum_required(VERSION 3.13)
project(backend-cpp-web)

set(PRJ_NAME "server")


set(PATH_HEADERS "include/")
set(PATH_SOURCES "src/")

file(GLOB_RECURSE HEADERS "${PATH_HEADERS}/*.h")
file(GLOB_RECURSE SRC     "${PATH_SOURCES}/*.cpp")

include("cmake/functions.cmake")

assign_source_group(${HEADERS})
assign_source_group(${SRC})

add_executable(${PRJ_NAME})

target_include_directories(${PRJ_NAME} PUBLIC ${PATH_HEADERS})
target_sources(${PRJ_NAME} PUBLIC ${HEADERS}
                                  ${SRC})