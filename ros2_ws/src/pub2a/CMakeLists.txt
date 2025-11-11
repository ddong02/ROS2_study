cmake_minimum_required(VERSION 3.16)
project(pub2a)

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)

#build
add_executable(pub2a src/pub2a.cpp)
ament_target_dependencies(pub2a rclcpp std_msgs)

#install
install(
  TARGETS pub2a
  DESTINATION lib/${PROJECT_NAME}
)

ament_package()
