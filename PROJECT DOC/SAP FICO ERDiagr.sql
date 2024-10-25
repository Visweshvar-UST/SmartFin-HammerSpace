CREATE TABLE `organizations` (
  `org_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `type` varchar(100),
  `address` varchar(255),
  `contact_info` varchar(255)
);

CREATE TABLE `projects` (
  `project_id` int PRIMARY KEY AUTO_INCREMENT,
  `org_id` int,
  `project_name` varchar(255),
  `start_date` date,
  `end_date` date,
  `total_budget` decimal(18,2),
  `allocated_budget` decimal(18,2),
  `remaining_budget` decimal(18,2),
  `actual_expenses` decimal(18,2)
);

CREATE TABLE `employees` (
  `employee_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `role` varchar(100),
  `salary` decimal(18,2),
  `project_id` int
);

CREATE TABLE `analytics` (
  `analytic_id` int PRIMARY KEY AUTO_INCREMENT,
  `org_id` int,
  `total_income` decimal(18,2),
  `total_expenses` decimal(18,2),
  `profit_margin` decimal(5,2)
);

ALTER TABLE `projects` ADD FOREIGN KEY (`org_id`) REFERENCES `organizations` (`org_id`);

ALTER TABLE `employees` ADD FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);

ALTER TABLE `analytics` ADD FOREIGN KEY (`org_id`) REFERENCES `organizations` (`org_id`);
