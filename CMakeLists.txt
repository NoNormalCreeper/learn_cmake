project(learn_cmake)

add_library(hw SHARED src/hw.h src/hw.cpp)

target_include_directories(hw PUBLIC ../src)
# target_link_libraries(hw PRIVATE Boost)

add_executable(
exec
main.cpp
)


target_link_libraries(exec PRIVATE hw)