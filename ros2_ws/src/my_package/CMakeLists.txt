cmake_minimum_required(VERSION 3.16)
project(my_package)

if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)

add_executable(my_pkg src/my_pkg.cpp)
ament_target_dependencies(my_pkg rclcpp std_msgs geometry_msgs)

install(TARGETS
  my_pkg
  DESTINATION lib/${PROJECT_NAME})

ament_package()