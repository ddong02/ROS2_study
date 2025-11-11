#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"
#include <memory>

int main(int argc, char* argv[])
{
    rclcpp::init(argc, argv);

    auto node = std::make_shared<rclcpp::Node>("my_node");
    auto qos_profile = rclcpp::QoS(rclcpp::KeepLast(10));
    auto my_pub = node->create_publisher<std_msgs::msg::String>("my_pub1", qos_profile);
    rclcpp::Publisher<std_msgs::msg::String>::SharedPtr my_pub2 = node->create_publisher<std_msgs::msg::String>("my_pub2", qos_profile);
    std::shared_ptr<rclcpp::Publisher<std_msgs::msg::String>> my_pub3 = node->create_publisher<std_msgs::msg::String>("my_pub3", qos_profile);

    std_msgs::msg::String message;
    message.data = "Hello World!";
    rclcpp::WallRate loop_rate(1.0);

    while (rclcpp::ok())
    {
        RCLCPP_INFO(node->get_logger(), "Published: %s", message.data.c_str());
        my_pub->publish(message);
        my_pub2->publish(message);
        my_pub3->publish(message);
        loop_rate.sleep();
    }

    rclcpp::shutdown();
    return 0;
}