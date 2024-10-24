cmake_minimum_required(VERSION 3.16)
project(backend-cpp-web)

find_package(Qt6 REQUIRED COMPONENTS Core HttpServer)
qt_standard_project_setup()


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
target_link_libraries(${PRJ_NAME} PRIVATE Qt6::Core Qt6::HttpServer)


# example from Qt HttpServer
add_subdirectory("${PATH_SOURCES}/example_httpserver")