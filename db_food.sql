/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `food_type`;
CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `like_res`;
CREATE TABLE `like_res` (
  `like_res_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  `isLike` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`like_res_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int NOT NULL,
  `code` varchar(10) NOT NULL,
  `arr_sub_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `rate_res`;
CREATE TABLE `rate_res` (
  `rate_res_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  PRIMARY KEY (`rate_res_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `sub_food`;
CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(100) NOT NULL,
  `sub_price` float NOT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Spaghetti Bolognese', 'spaghetti.jpg', 12.99, 'Classic Italian dish', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Sushi Platter', 'sushi.jpg', 24.99, 'Assorted sushi rolls', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'Chocolate Cake', 'chocolate_cake.jpg', 8.99, 'Rich and decadent', 3);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'Caesar Salad', 'caesar_salad.jpg', 10.99, 'Fresh and crisp', 1),
(5, 'Grilled Salmon', 'grilled_salmon.jpg', 18.99, 'Healthy seafood option', 2),
(6, 'Cheesecake', 'cheesecake.jpg', 9.99, 'Creamy and delicious', 3),
(7, 'Margherita Pizza', 'margherita_pizza.jpg', 14.99, 'Simple and classic', 1),
(8, 'Shrimp Scampi', 'shrimp_scampi.jpg', 16.99, 'Garlicky shrimp pasta', 2),
(9, 'Tiramisu', 'tiramisu.jpg', 7.99, 'Italian coffee-flavored dessert', 3),
(10, 'Chicken Alfredo', 'chicken_alfredo.jpg', 15.99, 'Creamy pasta with chicken', 1);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Vegetarian');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Seafood');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Dessert');

INSERT INTO `like_res` (`like_res_id`, `user_id`, `res_id`, `date_like`, `isLike`) VALUES
(1, 1, 1, '2023-01-01 12:00:00', 1);
INSERT INTO `like_res` (`like_res_id`, `user_id`, `res_id`, `date_like`, `isLike`) VALUES
(2, 2, 2, '2023-01-02 14:30:00', 1);
INSERT INTO `like_res` (`like_res_id`, `user_id`, `res_id`, `date_like`, `isLike`) VALUES
(3, 3, 3, '2023-01-03 16:45:00', 1);
INSERT INTO `like_res` (`like_res_id`, `user_id`, `res_id`, `date_like`, `isLike`) VALUES
(4, 5, 5, '2023-01-05 08:00:00', 1),
(5, 6, 1, '2023-01-06 19:20:00', 1),
(6, 7, 2, '2023-01-07 22:10:00', 1),
(7, 9, 4, '2023-01-09 17:00:00', 1),
(8, 10, 5, '2023-01-10 13:45:00', 1),
(9, 1, 2, '2023-01-01 12:00:00', 1),
(10, 2, 1, '2023-01-02 14:30:00', 1),
(11, 3, 3, '2023-01-03 16:45:00', 1),
(12, 5, 4, '2023-01-05 08:00:00', 1),
(13, 5, 1, '2024-03-05 09:09:48', 0);

INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 1, 2, 'ABC123', '[1, 2]');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 2, 2, 1, 'DEF456', '[1,3]');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 3, 3, 3, 'GHI789', '[2,3]');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(4, 3, 4, 1, 'JKL012', '[1,2,3]'),
(5, 5, 5, 2, 'MNO345', '[1,4]'),
(6, 6, 1, 2, 'PQR678', '[4,6]'),
(7, 7, 2, 1, 'STU901', '[5]'),
(8, 5, 3, 3, 'VWX234', '[1]'),
(9, 9, 4, 1, 'YZA567', '[1, 4]'),
(10, 10, 5, 2, 'BCD890', '[1, 6]'),
(11, 1, 1, 1, 'EFG123', '[2]'),
(12, 2, 2, 2, 'HIJ456', '[2, 4]'),
(13, 3, 3, 1, 'KLM789', '[3, 5]'),
(14, 1, 4, 3, 'NOP012', '[4, 5, 6]'),
(15, 5, 5, 2, 'QRS345', '[1, 2, 4]'),
(16, 6, 1, 1, 'TUV678', '[1, 3]'),
(17, 7, 2, 2, 'WXY901', '[2, 4]'),
(18, 2, 3, 1, 'ZAB234', '[1, 2]'),
(19, 9, 4, 3, 'CDE567', '[6, 7]'),
(20, 10, 5, 1, 'FGH890', '[1, 4, 7]'),
(21, 2, 1, 1, '1.70963e12', NULL),
(22, 2, 1, 3, '1.70963e12', NULL);

INSERT INTO `rate_res` (`rate_res_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 1, 5, '2023-01-01 12:00:00');
INSERT INTO `rate_res` (`rate_res_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 2, 2, 4, '2023-01-02 14:30:00');
INSERT INTO `rate_res` (`rate_res_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 3, 3, 3, '2023-01-03 16:45:00');
INSERT INTO `rate_res` (`rate_res_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(4, 4, 4, 5, '2023-01-04 10:15:00'),
(5, 5, 5, 2, '2023-01-05 08:00:00'),
(6, 6, 1, 4, '2023-01-06 19:20:00'),
(7, 7, 2, 3, '2023-01-07 22:10:00'),
(8, 8, 3, 5, '2023-01-08 11:30:00'),
(9, 9, 4, 4, '2023-01-09 17:00:00'),
(10, 10, 5, 1, '2023-01-10 13:45:00'),
(11, 1, 1, 5, '2024-03-05 09:24:22');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'Restaurant A', 'image1.jpg', 'Description for Restaurant A');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(2, 'Restaurant B', 'image2.jpg', 'Description for Restaurant B');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(3, 'Restaurant C', 'image3.jpg', 'Description for Restaurant C');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(4, 'Restaurant D', 'image4.jpg', 'Description for Restaurant D'),
(5, 'Restaurant E', 'image5.jpg', 'Description for Restaurant E');



INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'John Doe', 'john@example.com', 'password1');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Jane Doe', 'jane@example.com', 'password2');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Bob Smith', 'bob@example.com', 'password3');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Alice Johnson', 'alice@example.com', 'password4'),
(5, 'Charlie Brown', 'charlie@example.com', 'password5'),
(6, 'Eva Williams', 'eva@example.com', 'password6'),
(7, 'David Lee', 'david@example.com', 'password7'),
(8, 'Grace Taylor', 'grace@example.com', 'password8'),
(9, 'Michael Wilson', 'michael@example.com', 'password9'),
(10, 'Emma Miller', 'emma@example.com', 'password10');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;