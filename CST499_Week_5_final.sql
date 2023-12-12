
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE DATABASE CST499_ben;

USE CST499_ben;


CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 3,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `users` (`user_id`, `username`, `password`, `role_id`, `first_name`, `last_name`) VALUES
(0, 'admin', 'Admin', 9, 'Admin', 'Superuser'),
(1, 'dman', '123456', 1, 'David', 'Man'),
(2, 'apuffy', '123456', 6, 'Alexandria', 'Puffy'),
(3, 'jpotter', '123456', 3, 'James', 'Potter'),
(4, 'twright', '123456', 4, 'Tracy', 'Wright'),
(6, 'kclark', '123456', 4, 'Kent', 'Clark'),
(7, 'test123', 'test', 6, 'Test', 'Onetwothree'),
(8, 'mmouse', '123456', 2, 'Mickey', 'Mouse'),
(9, 'bgreatness', '123456', 5, 'Becky', 'Greatness'),
(10, 'dyorkel', '123456', 1, 'Danny', 'Yorkel'),
(11, 'jkelly', '123456', 1, 'Jack', 'Kelly'),
(15, 'sman', '123456', 4, 'Spider', 'Man'),
(16, 'jblake', '123456', 1, 'Jake', 'Blake'),
(17, 'falbert', '123456', 1, 'Fred', 'Albert'),
(18, 'testuser', 'password', 5, 'Test', 'Me'),
(19, 'ahappy', '123456', 1, 'Alex', 'Happy'),
(20, 'jfan', '123456', 1, 'Jasper', 'Fan'),
(21, 'nbush', '123456', 4, 'Nicole', 'Bush'),
(23, 'hsmith', '123456', 1, 'Henry', 'Smith'),
(24, 'jhunt', '123456', 5, 'John', 'Hunt'),
(25, 'jsmith', '123456', 2, 'Jane', 'Smith'),
(26, 'bsmith', '123456', 3, 'Bob', 'Smith');


CREATE TABLE `students` (
  `user_id` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role_id` int(11) NOT NULL,
  `email` varchar(45) NOT NULL DEFAULT 'firstlastname.student@uagc.edu',
  `phone` text NOT NULL DEFAULT '(208)222-3333',
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `dob` date NOT NULL DEFAULT '2010-01-01',
  `ssn` varchar(20) NOT NULL DEFAULT '111-22-1111',
  `admission_date` date NOT NULL DEFAULT current_timestamp(),
  `graduation_date` int(11) DEFAULT NULL,
  `mailing_address` varchar(500) NOT NULL DEFAULT '123 Main St, UAGC, AZ, 85142',
  `cumulative_gpa` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `students` (`user_id`, `student_id`, `password`, `role_id`, `email`, `phone`, `first_name`, `last_name`, `dob`, `ssn`, `admission_date`, `graduation_date`, `mailing_address`, `cumulative_gpa`) VALUES
(17, 'falbert', '123456', 1, 'fredalbert.student@uagc.edu', '(111)222-3333', 'Fred', 'Albert', '2001-01-01', '111-22-3333', '2023-08-25', NULL, '123 Main St, UAGC, AZ, 12345', NULL),
(19, 'ahappy', '123456', 1, 'alexhappy.student@uagc.edu', '(111)222-3333', 'Alex', 'Happy', '2001-01-01', '111-22-3333', '2023-08-26', NULL, '123 Main St, UAGC, AZ, 12345', NULL),
(16, 'jblake', '123456', 1, 'jakeblake.student@uagc.edu', '(111)222-3333', 'Jake', 'Blake', '2001-01-01', '111-22-3333', '2023-08-25', NULL, '123 Main St, UAGC, AZ, 12345', NULL),
(20, 'jfan', '123456', 1, 'jasperfan.student@uagc.edu', '(111)222-3333', 'Jasper', 'Fan', '2001-01-01', '111-22-3333', '2023-08-27', NULL, '123 Main St, UAGC, AZ, 12345', NULL),
(11, 'jkelly', '123456', 1, 'jackkelly.student@uagc.edu', '(111)222-3333', 'Jack', 'Kelly', '0000-00-00', '111-22-3333', '2023-08-24', NULL, '123 Main St, UAGC, AZ, 12345', NULL),
(8, 'mmouse', '123456', 2, 'mickeymouse.student@uagc.edu', '(111)222-3333', 'Mickey', 'Mouse', '1943-07-26', '111-22-3333', '2023-08-14', NULL, 'Abbey Road. Look it up.', NULL),
(1, 'dman', '123456', 1, 'davidman.student@gmail.com', '740-407-8022', 'David', 'Man', '1983-08-23', '111-22-3333', '2023-08-13', NULL, '123 Main St, UAGC, AZ, 12345', NULL),
(10, 'dyorkel', '123456', 1, 'dannyyorkel.student@uagc.edu', '(111)222-3333', 'Danny', 'Yorkel', '0000-00-00', '111-22-3333', '2023-08-24', NULL, '123 Main St, UAGC, AZ, 12345', NULL),
(23, 'hsmith', '123456', 1, 'henrysmith.student@uagc.edu', '(111)222-3333', 'Henry', 'Smith', '2001-01-01', '111-22-3333', '2023-12-04', NULL, '123 Main St, UAGC, AZ, 12345', NULL),
(25, 'jsmith', '123456', 2, 'janesmith.student@uagc.edu', '(111)222-3333', 'Jane', 'Smith', '2001-01-01', '111-22-3333', '2023-12-04', NULL, '123 Main St, UAGC, AZ, 12345', NULL);


CREATE TABLE `teachers` (
  `user_id` int(11) NOT NULL,
  `teacher_id` varchar(20) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT 'firstlastname.teacher@uagc.edu',
  `phone` varchar(45) DEFAULT '(111)222-3333',
  `prefix` varchar(5) DEFAULT 'Mx.',
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `ssn` varchar(20) DEFAULT '111-22-3333',
  `hire_date` date NOT NULL DEFAULT current_timestamp(),
  `mailing_address` varchar(500) DEFAULT '1401 University of AZ, Tucson, AZ, 85719',
  `salary` double DEFAULT NULL,
  `bio_summary` varchar(1000) DEFAULT 'Write your biography/summary for students to see in 3rd person and include your pronouns.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `teachers` (`user_id`, `teacher_id`, `password`, `role_id`, `email`, `phone`, `prefix`, `first_name`, `last_name`, `ssn`, `hire_date`, `mailing_address`, `salary`, `bio_summary`) VALUES
(2, 'apuffy', '123456', 6, 'alexandriapuffy.teacher@uagc.edu', '(111)222-3333', 'Ms.', 'Alexandria', 'Puffy', '111-22-3333', '2023-08-14', '1401 University of AZ  Tucson, AZ  85719', NULL, 'This is a placeholder for where your biography/summary should go. It will be shown to students, describing you. Please put it in 3rd person and make sure to include your pronouns.'),
(4, 'twright', '123456', 4, 'tracywright.teacher@uagc.edu', '(111)222-3333', 'Dr.', 'Tracy', 'Wright', '111-22-3333', '2023-08-13', '1401 University of AZ  Tucson, AZ  85719', NULL, 'This is a placeholder for where your biography/summary should go. It will be shown to students, describing you. Please put it in 3rd person and make sure to include your pronouns.'),
(6, 'kclark', '123456', 4, 'kentclark.teacher@uagc.edu', '(111)222-3333', 'Mr.', 'Kent', 'Clark', '111-22-3333', '2023-08-13', '1401 University of AZ  Tucson, AZ  85719', NULL, 'Kent is a very busy guy. He is also Superman.'),
(7, 'test123', 'test', 6, 'test123.teacher@uagc.edu', '(111)222-3333', 'Mx.', 'Test', 'Onetwothree', '111-22-3333', '2023-08-13', '1401 University of AZ  Tucson, AZ  85719', NULL, 'This is a placeholder for where your biography/summary should go. It will be shown to students, describing you. Please put it in 3rd person and make sure to include your pronouns.'),
(9, 'bgreatness', '123456', 5, 'beckygreatness.teacher@uagc.edu', '(111)222-3333', 'Mrs.', 'Becky', 'Greatness', '111-22-3333', '2023-08-20', '1401 University of AZ  Tucson, AZ  85719', NULL, 'Realtor by day, college teacher by night.'),
(15, 'sman', '123456', 4, 'spiderman.teacher@uagc.edu', '(111)222-3333', 'Mr.', 'Spider', 'Man', '111-22-3333', '2023-08-25', '1401 University of AZTucson, AZ85719', NULL, 'Spider is a spiderman who apparently teaches college courses.'),
(18, 'testuser', 'password', 5, 'testme.teacher@test.com', '(111)222-3333', 'Mx.', 'Test', 'Me', '111-22-3333', '2023-08-25', '1401 University of AZ, Tucson, AZ, 85719', NULL, 'This is a placeholder for where your biography/summary should go. It will be shown to students, describing you. Please put it in 3rd person and make sure to include your pronouns.'),
(21, 'nbush', '123456', 4, 'nicolebush.teacher@uagc.edu', '(111)222-3456', 'Mrs.', 'Nicole', 'Bush', '111-22-3456', '2023-08-28', 'Somewhere in Texas', NULL, 'Nicole is the best.'),
(24, 'jhunt', '123456', 5, 'johnhunt.teacher@uagc.edu', '(111)222-3333', 'Mr.', 'John', 'Hunt', '111-22-3333', '2023-12-04', '1401 University of AZ, Tucson, AZ, 85719', NULL, 'This is a placeholder for where your biography/summary should go. It will be shown to students, describing you. Please put it in 3rd person and make sure to include your pronouns.');

CREATE TABLE `administrators` (
  `user_id` int(11) NOT NULL,
  `administrator_id` varchar(20) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT 'firstlastname.admin@uagc.edu',
  `phone` varchar(45) DEFAULT '(111)222-3333',
  `prefix` varchar(5) DEFAULT 'Mx.',
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `ssn` varchar(20) DEFAULT '111-22-3333',
  `hire_date` date NOT NULL DEFAULT current_timestamp(),
  `mailing_address` varchar(500) DEFAULT '1401 University of AZ, Tucson, AZ, 85719',
  `salary` double DEFAULT NULL,
  `bio_summary` varchar(1000) DEFAULT 'Write your biography/summary for students to see in 3rd person and include your pronouns.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `administrators` (`user_id`, `administrator_id`, `password`, `role_id`, `email`, `phone`, `prefix`, `first_name`, `last_name`, `ssn`, `hire_date`, `mailing_address`, `salary`, `bio_summary`) VALUES
(0, 'admin', 'Admin', 9, 'adminsuperuser.admin@uagc.edu', '(111)222-3333', 'Mx.', 'Admin', 'Superuser', '111-22-3333', '2023-08-14', '1401 University of AZ  Tucson, AZ  85719', NULL, 'This is a placeholder for where your biography/summary should go. It will be shown to students, describing you. Please put it in 3rd person and make sure to include your pronouns.');


CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'Undergrad'),
(2, 'Graduate student'),
(3, 'Applicant'),
(4, 'Professor'),
(5, 'Instructor'),
(6, 'Aide'),
(7, 'Department head'),
(8, 'Advisor'),
(9, 'Administrator'),
(10, 'Technician');

CREATE TABLE `courses` (
  `course_id` varchar(10) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `summary` varchar(1000) DEFAULT NULL,
  `credits` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  `prerequesites` tinyint(1) DEFAULT NULL,
  `default_max_capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `summary`, `credits`, `track_id`, `prerequesites`, `default_max_capacity`) VALUES
('ACCT 200', 'Introduction to Financial Accounting', 'Concepts involved in accounting for assets, liabilities, and owners equity; financial statements.', 3, 16, NULL, 30),
('ACCT 210', 'Introduction to Managerial Accounting', 'Concepts involved in uses of accounting data in the managerial process.', 3, 16, NULL, 30),
('ACCT 250', 'Survey of Accounting', 'This course provides a basic introduction to both financial and managerial accounting topics. It concentrates on concepts and relationships involved in preparing and analyzing financial statements and some basic decision making for internal financial managers. This course is for non-BSBA students ONLY. This course will not meet the Eller College of Management requirements for professional admission.', 3, 16, NULL, 50),
('ACCT 310', 'Cost and Managerial Accounting', 'Concepts and analytical procedures necessary in the generation of accounting data for management planning control.', 3, 16, NULL, 30),
('CSC 345', 'Analysis of Discrete Structures', 'Introduction to and analysis of algorithms and characteristics of discrete structures. Course topics include algorithm analysis techniques, recurrence relations, structural induction, hierarchical structures, graphs, hashing, and sorting.', 4, 3, NULL, 20),
('CST 310', 'Programming', 'Learn how to develop applications and computer development', 3, 20, NULL, 1),
('ECE 175', 'Computer Programming for Engineering Applications', 'Fundamentals of C, complexity and efficiency analysis, numerical precision and representations, intro to data structures, structured program design, application to solving engineering problems.', 3, 3, NULL, 15),
('ECE 274A', 'Digital Logic', 'Number systems and coding, logic design, sequential systems, register transfer language.', 4, 3, NULL, 15),
('HIST 207', 'Games and Play in Medieval and Early Modern Europe', 'Games provide entertainment and recreation, but they also reflect, influence, and supply metaphors for many other aspects of life. We will explore the importance of games in shaping medieval and early modern societies by focusing on four games that have come to symbolize the era - chess, jousting, hunting, and dice games. Through our examination of these and other games, we will explore the social, political, religious, economic, legal, military, and intellectual history of medieval and early modern Europe.', 3, 9, 0, 40),
('LAR 440', 'Contemporary Landscape Architecture', 'This course examines 20th and 21st century prominent design figures that have shaped the profession of landscape architecture. Through case reviews of built works including significant gardens, urban designs, recreational areas, corporate landscapes, restored natural sites, heritage sites, waterfront projects, resorts, etc., we will explore the evolution of design ideology and theory in applied landscape architectural practice.', 3, 15, NULL, 40),
('MATH 243', 'Discrete Mathematics in Computer Science', 'Graphs and networks; set theory, logic, discrete structures; induction and recursion;\r\ntechniques of proof. Course calendar on class website.', 3, 8, NULL, 40),
('OSCM 373', 'Basic Operations Management', 'This course is an introduction to the concepts, principles, problems, and practices of operations management. Operations Management is one of the key functional areas in any organization or company that deals with the production of goods and services. This course is concerned with the tasks, issues and decisions of those operations managers who have made the services and products on which we all depend. Emphasis is on managerial processes for effective operations in both goods-producing and service- rendering organization. Topics include operations strategy, process design, capacity planning, facilities location and design, forecasting, production scheduling, inventory control, quality assurance, and project management. The topics are integrated using a systems model of the operations of an organization. ', 3, 16, 0, 30),
('SFWE 101', ' Introduction to Software Engineering', 'This course introduces students to the different software development lifecycle (SDLC) phases used in\r\ndeveloping, delivering, and maintaining software products. Students will also acquire basic software\r\ndevelopment skills and understand common terminology used in the software engineering profession.\r\nStudents will also learn and practice using traditional coding standards/guidelines. Python software\r\ndevelopment libraries and debugging tools will be explored and used in projects to familiarize students SFWE 101 2\r\nwith basic tasks involved in modifying, building, and testing software. The course will also lay the\r\nfoundation for achieving academic and career success in Software Engineering.', 3, 3, NULL, 20),
('SIE 277', 'Object-Oriented Modeling and Design', 'Modeling and design of complex systems using all views of the Unified Modeling Language (UML).\r\nMost effort will be in the problem domain (defining the problem). Some effort will be in the\r\nsolution domain (designing and/or producing hardware or software).', 3, 3, NULL, 20),
('UNIV 301', 'General Education Portfolio', 'UNIV 301 gives you the opportunity to reflect and make meaning of your general education experience while creating your ePortfolio.', 1, 1, NULL, 300);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `class_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `enrollment_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `enrollment_status` char(1) DEFAULT NULL,
  `grade` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`class_id`, `user_id`, `enrollment_date`, `enrollment_status`, `grade`) VALUES
(1, 1, '2023-08-24 20:11:20', 'a', NULL),
(1, 7, '2023-08-24 20:11:38', 'w', NULL),
(1, 8, '2023-08-24 20:10:33', 'w', NULL),
(1, 17, '2023-08-25 20:45:40', 'w', NULL),
(2, 7, '2023-08-24 20:11:44', 'w', NULL),
(3, 1, '2023-08-24 20:11:26', 'a', NULL),
(3, 7, '2023-08-24 20:11:50', 'w', NULL),
(5, 20, '2023-08-27 14:47:26', 'a', NULL),
(6, 1, '2023-08-29 01:11:52', 'a', NULL),
(6, 10, '2023-08-24 20:12:48', 'a', NULL),
(6, 11, '2023-08-24 20:12:17', 'a', NULL),
(7, 8, '2023-08-24 20:10:44', 'a', NULL),
(11, 1, '2023-08-29 01:07:37', 'q', NULL),
(11, 8, '2023-08-25 19:11:31', 'a', NULL),
(11, 10, '2023-08-25 19:08:37', 'a', NULL),
(11, 11, '2023-08-25 19:09:35', 'a', NULL),
(11, 16, '2023-08-25 20:38:13', 'a', NULL),
(11, 17, '2023-08-25 21:15:23', 'a', NULL),
(11, 19, '2023-08-27 14:56:53', 'a', NULL),
(11, 20, '2023-08-27 14:47:27', 'q', NULL),
(12, 20, '2023-08-27 14:47:22', 'a', NULL),
(15, 1, '2023-08-29 03:26:23', 'a', NULL),
(16, 23, '2023-12-05 04:05:23', 'a', NULL),
(17, 23, '2023-12-05 03:58:08', 'w', NULL),
(17, 25, '2023-12-05 03:58:08', 'a', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `is_reply` tinyint(1) NOT NULL DEFAULT 0,
  `reply_to_id` int(11) DEFAULT NULL,
  `message_timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `message_status` char(1) NOT NULL DEFAULT 'u',
  `sender_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `message_subject` varchar(500) NOT NULL DEFAULT '(No subject)',
  `message_content` varchar(5000) NOT NULL DEFAULT 'This is a test message.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `is_reply`, `reply_to_id`, `message_timestamp`, `message_status`, `sender_id`, `recipient_id`, `message_subject`, `message_content`) VALUES
(1, 0, NULL, '2023-12-04 14:56:53', 'r', 0, 19, 'Waitlisted class enrolled!', 'Congratulations, a seat has opened up in Digital Logic. You were next on the waitlist and have been automatically enrolled. You should now see the class in your schedule.'),
(2, 0, NULL, '2023-12-05 03:58:08', 'u', 0, 25, 'Waitlisted class enrolled!', 'Congratulations, a seat has opened up in Programming. You were next on the waitlist and have been automatically enrolled. You should now see the class in your schedule.');

-- --------------------------------------------------------

--
-- Table structure for table `offerings`
--

CREATE TABLE `offerings` (
  `class_id` bigint(20) NOT NULL,
  `course_id` varchar(10) NOT NULL,
  `teacher_user_id` bigint(20) NOT NULL,
  `room_id` varchar(10) NOT NULL,
  `occupancy` int(11) DEFAULT NULL,
  `vacancies` int(11) DEFAULT NULL,
  `semester_name` varchar(50) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `monday` tinyint(1) DEFAULT NULL,
  `tuesday` tinyint(1) DEFAULT NULL,
  `wednesday` tinyint(1) DEFAULT NULL,
  `thursday` tinyint(1) DEFAULT NULL,
  `friday` tinyint(1) DEFAULT NULL,
  `saturday` tinyint(1) DEFAULT NULL,
  `sunday` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `offerings`
--

INSERT INTO `offerings` (`class_id`, `course_id`, `teacher_user_id`, `room_id`, `occupancy`, `vacancies`, `semester_name`, `start_time`, `end_time`, `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`) VALUES
(1, 'ACCT 200', 6, '76-232', 24, 23, 'Fall 2023', '11:00:00', '12:00:00', 1, 0, 1, 0, 1, 0, 0),
(3, 'ACCT 250', 6, '113-204', 50, 49, 'Winter 2023', '09:00:00', '10:00:00', 0, 0, 1, 1, 1, 0, 0),
(5, 'SFWE 101', 4, '113-209', 20, 19, 'Fall 2023', '15:00:00', '16:30:00', 0, 1, 0, 1, 0, 0, 0),
(6, 'ECE 274A', 4, '11-1M', 12, 9, 'Winter 2023', '15:00:00', '17:00:00', 0, 0, 0, 0, 0, 1, 1),
(7, 'ACCT 250', 9, '76-232', 24, 23, 'Fall 2023', '09:00:00', '10:30:00', 0, 1, 0, 1, 0, 0, 0),
(8, 'ACCT 310', 9, '56-104', 30, 30, 'Winter 2023', '09:00:00', '10:00:00', 1, 0, 1, 0, 1, 0, 0),
(10, 'ACCT 310', 6, '73-319', 28, 28, 'Spring 2024', '14:00:00', '15:30:00', 0, 0, 1, 1, 0, 0, 0),
(11, 'ECE 274A', 4, '11-1N', 6, 0, 'Fall 2023', '13:00:00', '14:00:00', 1, 1, 1, 1, 0, 0, 0),
(12, 'UNIV 301', 15, '000', 300, 299, 'Fall 2023', '00:00:00', '00:00:00', 1, 0, 0, 1, 0, 0, 0),
(13, 'LAR 440', 21, '76-232', 24, 24, 'Spring 2024', '13:00:00', '14:00:00', 0, 0, 0, 1, 1, 1, 0),
(14, 'HIST 207', 21, '000', 40, 40, 'Summer 2024', '00:00:00', '00:00:00', 0, 0, 0, 0, 0, 1, 1),
(15, 'OSCM 373', 21, '56-104', 30, 29, 'Fall 2024', '09:00:00', '10:00:00', 1, 1, 1, 0, 0, 0, 0),
(16, 'MATH 243', 24, '000', 40, 39, 'Winter 2023', '08:30:00', '09:30:00', 1, 0, 1, 0, 0, 0, 0),
(17, 'CST 310', 24, '73-319', 1, 0, 'Winter 2023', '10:30:00', '11:30:00', 1, 0, 1, 0, 0, 0, 0);

-- --------------------------------------------------------
CREATE TABLE `rooms` (
  `room_id` varchar(10) NOT NULL,
  `room_name` varchar(45) NOT NULL,
  `building_name` varchar(200) DEFAULT NULL,
  `capacity` int(11) NOT NULL,
  `ada_accessible` tinyint(1) DEFAULT NULL,
  `building_address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_name`, `building_name`, `capacity`, `ada_accessible`, `building_address`) VALUES
('000', 'Remote', 'Online (no physical location)', 999, 1, 'uagc.edu'),
('103-108', '0108 Lecture Hall', 'John P. Schaefer Center For Creative Photogragraphy', 224, 1, '1030 N Olive Rd'),
('11-1M', '0001M Class Laboratory', 'John W. Harshbarger Building', 12, 0, '1133 E James E. Rogers Way'),
('11-1N', '0001N Class Laboratory', 'John W. Harshbarger Building', 6, 0, '1133 E James E. Rogers Way'),
('11-206', '0206 Classroom', 'John W. Harshbarger Building', 50, 1, '1133 E James E. Rogers Way'),
('113-204', '0204 Lecture Hall', 'Henry Koffler Building', 300, 1, '1340 E University Blvd'),
('113-209', '0209 Classroom', 'Henry Koffler Building', 36, 1, '1340 E University Blvd'),
('4-146', '0146 Classroom', 'Fred Fox School of Music', 142, 1, '1017 N Olive Rd'),
('56-104', '0104 Classroom', 'Bear Down Building', 999, 0, '1428 E University Blvd'),
('73-319', '0319 Computer Instructional', 'Computer Center', 28, 1, '1077 N Highland Ave'),
('76-232', '0232 Seminar', 'Richard A. Harvill Building', 24, 1, '1103 E 2 St'),
('78-415', '0415 Class Laboratory', 'McClelland Park', 22, 1, '650 N Park Ave'),
('81-201', '0201 Lecture Hall', 'Physics-Atmospheric Sciences', 379, 1, '1118 E 4 St'),
('88-301', '0301 Collaborative Classroom', 'Biological Sciences West', 112, 0, '1041 E Lowell St'),
('94-408', '0408 Lecture Hall', 'Meinel Optical Sciences', 77, 0, '1630 E University Blvd');

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `semester_name` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`semester_name`, `start_date`, `end_date`) VALUES
('Fall 2023', '2023-08-21', '2023-12-15'),
('Winter 2023', '2023-12-18', '2024-01-10'),
('Spring 2024', '2024-01-10', '2024-05-10'),
('Summer 2024', '2024-05-13', '2024-08-07'),
('Fall 2024', '2024-08-26', '2024-12-20'),
('Winter 2024', '2024-12-10', '2025-01-11'),
('Spring 2025', '2025-01-10', '2025-05-10'),
('Summer 2025', '2025-05-13', '2025-08-07'),
('Fall 2025', '2025-08-26', '2025-12-20'),
('Winter 2025', '2025-12-10', '2026-01-11');

CREATE TABLE `subject_tracks` (
  `track_id` int(11) NOT NULL,
  `track_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject_tracks`
--

INSERT INTO `subject_tracks` (`track_id`, `track_name`) VALUES
(0, 'None'),
(1, 'Elective'),
(2, 'Social & Behavioral Science'),
(3, 'Engineering & Technology'),
(4, 'Law, Policy & Social Justice'),
(5, 'Music'),
(6, 'Culture & Language'),
(7, 'Biological & Biomedical Science'),
(8, 'Mathematics, Statistic & Data Science'),
(9, 'History'),
(10, 'English & Literature'),
(11, 'Education & Human Development'),
(12, 'Arts & Media'),
(13, 'Agricultural Science'),
(14, 'Animal & Veterinary Science'),
(15, 'Architecture, Planning, & Development'),
(16, 'Business, Economics & Entrepreneurship'),
(17, 'Communication, Journalism, & Public Relations'),
(18, 'Health, Nutrition, & Fitness'),
(19, 'Environment & Sustainability'),
(20, 'Computer & Information Science'),
(21, 'Psychology & Human Behavior'),
(22, 'Physical & Space Sciences'),
(23, 'Philosophy & Religious Studies');

CREATE TABLE `contact_messages` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `Date Time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `message`, `Date Time`) VALUES
(1, 'Admin', 'test@admin.com', 'Test message', '2023-12-04 18:34:50');

CREATE TABLE `messages_chat` (
  `user_from` bigint(20) NOT NULL,
  `user_to` bigint(20) NOT NULL,
  `date_send` datetime NOT NULL DEFAULT current_timestamp(),
  `date_read` datetime DEFAULT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `messages_chat` (`user_from`, `user_to`, `date_send`, `date_read`, `message`) VALUES
(0, 1, '2023-12-10 23:05:05', '2023-12-10 23:05:40', 'Hi dman this is Admin'),
(1, 0, '2023-12-10 23:06:02', '2023-12-10 23:07:06', 'Hi admin this is dman i got your message'),
(1, 4, '2023-12-11 00:27:55', '2023-12-11 00:28:39', 'hi twright whats our lesson today thanks dman'),
(4, 1, '2023-12-11 00:29:55', '2023-12-11 00:30:37', 'dman Its on science projects thanks twright'),
(25, 0, '2023-12-11 08:35:09', NULL, 'Hi admin this is jsmith');

ALTER TABLE `messages_chat`
  ADD PRIMARY KEY (`user_from`, `user_to`, `date_send`),
  ADD KEY `date_read` (`date_read`);


ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD UNIQUE KEY `course_id` (`course_id`),
  ADD UNIQUE KEY `course_id_2` (`course_id`),
  ADD KEY `track_id` (`track_id`),
  ADD KEY `course_name` (`course_name`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`class_id`,`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `reply_to_id` (`reply_to_id`,`sender_id`,`recipient_id`);

--
-- Indexes for table `offerings`
--
ALTER TABLE `offerings`
  ADD PRIMARY KEY (`class_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `course_id` (`course_id`,`teacher_user_id`,`room_id`,`semester_name`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `role_id_2` (`role_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `room_id` (`room_id`,`room_name`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`semester_name`),
  ADD UNIQUE KEY `semester_name` (`semester_name`),
  ADD KEY `semester_name_2` (`semester_name`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `user_id` (`user_id`,`student_id`);

--
-- Indexes for table `subject_tracks`
--
ALTER TABLE `subject_tracks`
  ADD PRIMARY KEY (`track_id`),
  ADD UNIQUE KEY `track_id` (`track_id`),
  ADD KEY `track_id_2` (`track_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`user_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`,`teacher_id`);
  
-- Indexes for table `administrators`

ALTER TABLE `administrators`
  ADD PRIMARY KEY (`user_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`,`administrator_id`);
--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `user_id` (`user_id`,`username`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `first_name` (`first_name`,`last_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `offerings`
--
ALTER TABLE `offerings`
  MODIFY `class_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `subject_tracks`
--
ALTER TABLE `subject_tracks`
  MODIFY `track_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `subject_tracks` (`track_id`);

--
-- Constraints for table `offerings`
--
ALTER TABLE `offerings`
  ADD CONSTRAINT `offerings_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

--
-- Constraints for table `administrators`
--
ALTER TABLE `administrators`
  ADD CONSTRAINT `administrators_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;