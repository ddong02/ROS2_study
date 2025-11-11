#include "rclcpp/rclcpp.hpp"
#include "geometry_msgs/msg/vector3.hpp"
#include <iostream>
#include <memory>

int main(int argc, char* argv[])
{
    rclcpp::init(argc, argv);
    
    auto my_node = std::make_shared<rclcpp::Node>("my_node");
    auto qos_profile = rclcpp::QoS(rclcpp::KeepLast(10));
    auto my_pub = my_node->create_publisher<geometry_msgs::msg::Vector3>(
        "my_topic", qos_profile);
    geometry_msgs::msg::Vector3 message;

    while(rclcpp::ok())
    {
        std::cout << "input 3 numbers: ";
        std::cin >> message.x;
        std::cin >> message.y;
        std::cin >> message.z;
        RCLCPP_INFO(my_node->get_logger(), "x: %f, y: %f, z: %f",
            message.x, message.y, message.z);
        my_pub->publish(message);
    }

    rclcpp::shutdown();
    return 0;
}