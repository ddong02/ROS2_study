#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"
#include <memory>


/*
1. create Node object, QoS
2. create Publisher using Node::create_publisher()
3. create Message std_msgs::msg::String()
4. publish message in while loop, where condition is rclcpp::ok()
5. Set message period as 1sec using delay function
6. Check topic using topic echo ...
*/

int main(int argc, char* argv[])
{
    rclcpp::init(argc, argv);

    auto node = std::make_shared<rclcpp::Node>("my_node");
    auto qos_profile = rclcpp::QoS(rclcpp::KeepLast(10));
    auto my_pub = node->create_publisher<std_msgs::msg::String>("my_topic", qos_profile);
    std_msgs::msg::String message;
    message.data = "Hello World!";
    rclcpp::WallRate loop_rate(1.0);

    while (rclcpp::ok())
    {
        RCLCPP_INFO(node->get_logger(), "Published: %s", message.data.c_str());
        my_pub->publish(message);
        loop_rate.sleep();
    }

    rclcpp::shutdown();
    return 0;
}