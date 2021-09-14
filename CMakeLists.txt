cmake_minimum_required(VERSION 3.20)


project(list)


file(GLOB sources src/*.c)

add_library(list SHARED ${sources})

include_directories(src/include)
