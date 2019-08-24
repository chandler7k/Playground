cmake_minimum_required(VERSION 3.14)
project(LRU)

set(CMAKE_CXX_STANDARD 14)

add_executable(LRU main.cpp LRUCache.cpp)