#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/int32.hpp"
#include <memory>

/*
1. rclcpp::node 생성
2. rclcpp::node::create_publisher (Publisher 생성)
3. std_msgs::msg::Int32 메세지 객체 생성
4. while(rclcpp::ok()) -> 1초 주기로 message publish
5. rclcpp::WallRate loop_rate(1.0); loop_rate.sleep() 이용하여 주기 제어
*/

int main(int argc, char* argv[])
{
    rclcpp::init(argc, argv);

    auto node = std::make_shared<rclcpp::Node>("my_node");
    auto qos_profile = rclcpp::QoS(rclcpp::KeepLast(10));
    auto my_pub = node->create_publisher<std_msgs::msg::Int32>("my_topic", qos_profile);
    std_msgs::msg::Int32 message;
    message.data = 0;
    rclcpp::WallRate loop_rate(1.0);

    while(rclcpp::ok())
    {
        RCLCPP_INFO(node->get_logger(), "Published: %d", message.data);
        my_pub->publish(message);
        loop_rate.sleep();
        message.data++;
    }
    
    rclcpp::shutdown();
    return 0;
}