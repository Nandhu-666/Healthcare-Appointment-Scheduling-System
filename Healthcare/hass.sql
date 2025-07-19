-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2025 at 08:35 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
create database hass;
use hass;
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` varchar(50) NOT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  `appointment_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(20) DEFAULT NULL CHECK (`status` in ('Scheduled','Completed','Cancelled')),
  `reason_for_visit` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `patient_id`, `appointment_date`, `status`, `reason_for_visit`) VALUES
('00000000-1111-2222-3333-444444444444', 'f2a3b4c5-d6e7-8901-5678-2345678901', '2025-05-10 10:30:00', 'Scheduled', 'Consultation'),
('11111111-2222-3333-4444-555555555555', 'a1b2c3d4-e5f6-7890-abcd-ef1234567890', '2025-05-01 04:30:00', 'Scheduled', ' Chest pain'),
('22222222-3333-4444-5555-666666666666', 'b2c3d4e5-f6a7-8901-bcde-f2345678901', '2025-05-02 05:30:00', 'Completed', 'Headache'),
('33333333-4444-5555-6666-777777777777', 'e5f6a7b8-c9d0-1234-ef01-5678901234', '2025-05-03 04:00:00', 'Scheduled', 'Fever'),
('44444444-5555-6666-7777-888888888888', 'f6a7b8c9-d0e1-2345-f012-6789012345', '2025-05-04 08:30:00', 'Cancelled', 'Back pain'),
('55555555-6666-7777-8888-999999999999', 'a7b8c9d0-e1f2-3456-0123-7890123456', '2025-05-05 09:30:00', 'Scheduled', 'Checkup'),
('66666666-7777-8888-9999-000000000000', 'b8c9d0e1-f2a3-4567-1234-8901234567', '2025-05-06 05:00:00', 'Completed', 'Allergy'),
('77777777-8888-9999-0000-111111111111', 'c9d0e1f2-a3b4-5678-2345-9012345678', '2025-05-07 06:30:00', 'Scheduled', 'Flu symptoms'),
('88888888-9999-0000-1111-222222222222', 'd0e1f2a3-b4c5-6789-3456-0123456789', '2025-05-08 07:30:00', 'Scheduled', 'Knee pain'),
('99999999-0000-1111-2222-333333333333', 'e1f2a3b4-c5d6-7890-4567-1234567890', '2025-05-09 06:00:00', 'Completed', 'Follow-up');

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `bill_id` varchar(50) NOT NULL,
  `amount_due` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL CHECK (`payment_status` in ('Pending','Paid','Overdue')),
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `insurance_claim_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`bill_id`, `amount_due`, `payment_status`, `payment_date`, `insurance_claim_status`) VALUES
('00000000-1111-2222-3333-666666666666', 110.00, 'Pending', '2025-04-30 05:43:31', 'Submitted'),
('11111111-2222-3333-4444-777777777777', 150.00, 'Paid', '2025-05-01 05:30:00', 'Approved'),
('22222222-3333-4444-5555-888888888888', 200.00, 'Pending', '2025-04-30 05:43:31', 'Submitted'),
('33333333-4444-5555-6666-999999999999', 100.00, 'Paid', '2025-05-03 04:30:00', 'Approved'),
('44444444-5555-6666-7777-000000000000', 50.00, 'Overdue', '2025-04-30 05:43:31', 'Denied'),
('55555555-6666-7777-8888-111111111111', 120.00, 'Paid', '2025-05-05 10:30:00', 'Approved'),
('66666666-7777-8888-9999-222222222222', 180.00, 'Pending', '2025-04-30 05:43:31', 'Submitted'),
('77777777-8888-9999-0000-333333333333', 90.00, 'Paid', '2025-05-07 07:30:00', 'Approved'),
('88888888-9999-0000-1111-444444444444', 250.00, 'Overdue', '2025-04-30 05:43:31', 'Denied'),
('99999999-0000-1111-2222-555555555555', 130.00, 'Paid', '2025-05-09 07:00:00', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctor_id` varchar(50) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `availability` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`availability`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_id`, `specialization`, `availability`) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Cardiology', '{\"Mon\": \"9-17\", \"Wed\": \"9-17\"}'),
('550e8400-e29b-41d4-a716-446655440001', 'Neurology', '{\"Tue\": \"10-16\", \"Thu\": \"10-16\"}'),
('550e8400-e29b-41d4-a716-446655440002', 'Pediatrics', '{\"Fri\": \"8-14\"}'),
('550e8400-e29b-41d4-a716-446655440003', 'Orthopedics', '{\"Mon\": \"12-18\"}'),
('550e8400-e29b-41d4-a716-446655440004', 'Dermatology', '{\"Tue\": \"9-15\"}'),
('550e8400-e29b-41d4-a716-446655440005', 'Oncology', '{\"Wed\": \"11-17\"}'),
('550e8400-e29b-41d4-a716-446655440006', 'Gastroenterology', '{\"Thu\": \"9-13\"}'),
('550e8400-e29b-41d4-a716-446655440007', 'Psychiatry', '{\"Fri\": \"10-16\"}'),
('550e8400-e29b-41d4-a716-446655440008', 'Endocrinology', '{\"Mon\": \"8-12\"}'),
('550e8400-e29b-41d4-a716-446655440009', 'Urology', '{\"Tue\": \"12-18\"}');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` varchar(50) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `rating`, `comments`) VALUES
('00000000-1111-2222-3333-777777777777', 4, 'Professional care'),
('11111111-2222-3333-4444-888888888888', 4, 'Good service'),
('22222222-3333-4444-5555-999999999999', 5, 'Excellent doctor'),
('33333333-4444-5555-6666-000000000000', 3, 'Long wait time'),
('44444444-5555-6666-7777-111111111111', 2, 'Cancelled last minute'),
('55555555-6666-7777-8888-222222222222', 4, 'Friendly staff'),
('66666666-7777-8888-9999-333333333333', 5, 'Very thorough'),
('77777777-8888-9999-0000-444444444444', 3, 'Average experience'),
('88888888-9999-0000-1111-555555555555', 4, 'Good consultation'),
('99999999-0000-1111-2222-666666666666', 5, 'Highly recommend');

-- --------------------------------------------------------

--
-- Table structure for table `medicalrecord`
--

CREATE TABLE `medicalrecord` (
  `record_id` varchar(50) NOT NULL,
  `diagnosis` text DEFAULT NULL,
  `prescription` text DEFAULT NULL,
  `test_results` text DEFAULT NULL,
  `doctor_notes` text DEFAULT NULL,
  `record_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicalrecord`
--

INSERT INTO `medicalrecord` (`record_id`, `diagnosis`, `prescription`, `test_results`, `doctor_notes`, `record_date`) VALUES
('00000000-1111-2222-3333-555555555555', 'Tension headache', 'Relaxation', 'Normal', 'Stress management', '2025-05-10 11:00:00'),
('11111111-2222-3333-4444-666666666666', 'Angina', 'Aspirin', 'ECG normal', 'Monitor for 2 weeks', '2025-05-01 05:00:00'),
('22222222-3333-4444-5555-777777777777', 'Migraine', 'Ibuprofen', 'Normal', 'Rest advised', '2025-05-02 06:00:00'),
('33333333-4444-5555-6666-888888888888', 'Viral fever', 'Paracetamol', 'Blood test normal', 'Hydration', '2025-05-03 04:30:00'),
('44444444-5555-6666-7777-999999999999', 'Sprain', 'Painkiller', 'X-ray normal', 'Rest for 1 week', '2025-05-04 09:00:00'),
('55555555-6666-7777-8888-000000000000', 'Hypertension', 'Amlodipine', 'BP 140/90', 'Lifestyle changes', '2025-05-05 10:00:00'),
('66666666-7777-8888-9999-111111111111', 'Allergic rhinitis', 'Antihistamine', 'Normal', 'Avoid allergens', '2025-05-06 05:30:00'),
('77777777-8888-9999-0000-222222222222', 'Influenza', 'Antiviral', 'Positive flu test', 'Rest and fluids', '2025-05-07 07:00:00'),
('88888888-9999-0000-1111-333333333333', 'Arthritis', 'NSAIDs', 'X-ray shows wear', 'Physical therapy', '2025-05-08 08:00:00'),
('99999999-0000-1111-2222-444444444444', 'Stable', 'None', 'Normal', 'Routine checkup', '2025-05-09 06:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `read_status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `message`, `timestamp`, `read_status`) VALUES
('00000000-1111-2222-3333-999999999999', 'Consultation reminder', '2025-05-10 02:30:00', 0),
('11111111-2222-3333-4444-000000000000', 'Appointment scheduled for May 1', '2025-04-30 02:30:00', 0),
('22222222-3333-4444-5555-111111111111', 'Bill due for appointment', '2025-05-02 06:30:00', 1),
('33333333-4444-5555-6666-222222222222', 'Reminder: Appointment on May 3', '2025-05-02 02:30:00', 0),
('44444444-5555-6666-7777-333333333333', 'Appointment cancelled', '2025-05-04 03:30:00', 1),
('55555555-6666-7777-8888-444444444444', 'Please provide feedback', '2025-05-05 10:30:00', 0),
('66666666-7777-8888-9999-555555555555', 'Medical record updated', '2025-05-06 06:00:00', 1),
('77777777-8888-9999-0000-666666666666', 'Appointment confirmed', '2025-05-07 02:30:00', 0),
('88888888-9999-0000-1111-777777777777', 'Bill overdue', '2025-05-08 08:30:00', 0),
('99999999-0000-1111-2222-888888888888', 'Follow-up scheduled', '2025-05-09 07:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` char(1) DEFAULT NULL CHECK (`gender` in ('M','F','O')),
  `contact_info` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `first_name`, `last_name`, `date_of_birth`, `gender`, `contact_info`, `address`) VALUES
('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'John', 'Doe', '1980-05-15', 'M', 'john.doe@email.com', '123 Main St'),
('a7b8c9d0-e1f2-3456-0123-7890123456', 'Susan', 'Lee', '1995-09-18', 'F', 'susan.lee@email.com', '404 Maple Ave'),
('b2c3d4e5-f6a7-8901-bcde-f2345678901', 'Jane', 'Smith', '1975-08-22', 'F', 'jane.smith@email.com', '456 Oak Ave'),
('b8c9d0e1-f2a3-4567-1234-8901234567', 'David', 'Kim', '1982-04-05', 'M', 'david.kim@email.com', '505 Spruce Rd'),
('c9d0e1f2-a3b4-5678-2345-9012345678', 'Emma', 'Davis', '1978-12-01', 'F', 'emma.davis@email.com', '606 Willow Ln'),
('d0e1f2a3-b4c5-6789-3456-0123456789', 'Lisa', 'White', '1988-06-20', 'F', 'lisa.white@email.com', '707 Ash St'),
('e1f2a3b4-c5d6-7890-4567-1234567890', 'Michael', 'Brown', '1970-03-10', 'M', 'michael.brown@email.com', '808 Pine Rd'),
('e5f6a7b8-c9d0-1234-ef01-5678901234', 'Mary', 'Johnson', '1990-07-12', 'F', 'mary.j@email.com', '202 Cedar St'),
('f2a3b4c5-d6e7-8901-5678-2345678901', 'Sarah', 'Wilson', '1992-11-30', 'F', 'sarah.wilson@email.com', '909 Birch Ln'),
('f6a7b8c9-d0e1-2345-f012-6789012345', 'Tom', 'Clark', '1985-01-25', 'M', 'tom.clark@email.com', '303 Elm St');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` varchar(50) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `working_hours` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`working_hours`)),
  `contact_info` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `role`, `working_hours`, `contact_info`) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Receptionist', '{\"Mon-Fri\": \"8-16\"}', 'reception@hospital.com'),
('550e8400-e29b-41d4-a716-446655440001', 'Billing Clerk', '{\"Mon-Fri\": \"9-17\"}', 'billing@hospital.com'),
('550e8400-e29b-41d4-a716-446655440002', 'Nurse', '{\"Mon-Wed\": \"7-15\"}', 'nurse@hospital.com'),
('550e8400-e29b-41d4-a716-446655440003', 'Administrator', '{\"Mon-Fri\": \"8-16\"}', 'admin@hospital.com'),
('550e8400-e29b-41d4-a716-446655440004', 'IT Support', '{\"Mon-Fri\": \"9-17\"}', 'it@hospital.com'),
('550e8400-e29b-41d4-a716-446655440005', 'Medical Assistant', '{\"Tue-Thu\": \"8-14\"}', 'assistant@hospital.com'),
('550e8400-e29b-41d4-a716-446655440006', 'Scheduler', '{\"Mon-Fri\": \"8-12\"}', 'scheduler@hospital.com'),
('550e8400-e29b-41d4-a716-446655440007', 'Records Clerk', '{\"Mon-Fri\": \"9-15\"}', 'records@hospital.com'),
('550e8400-e29b-41d4-a716-446655440008', 'Pharmacist', '{\"Mon-Fri\": \"10-18\"}', 'pharmacy@hospital.com'),
('550e8400-e29b-41d4-a716-446655440009', 'Lab Technician', '{\"Mon-Fri\": \"7-13\"}', 'lab@hospital.com');

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE `userrole` (
  `role_id` varchar(50) NOT NULL,
  `role_type` varchar(50) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`role_id`, `role_type`, `permissions`) VALUES
('00000000-1111-2222-3333-888888888888', 'Patient', '{\"read\": \"own_data\", \"write\": \"feedback\"}'),
('11111111-2222-3333-4444-999999999999', 'Admin', '{\"read\": \"all\", \"write\": \"all\"}'),
('22222222-3333-4444-5555-000000000000', 'Doctor', '{\"read\": \"patient, appointment, medical_record\", \"write\": \"appointment, medical_record\"}'),
('33333333-4444-5555-6666-111111111111', 'Receptionist', '{\"read\": \"patient, appointment\", \"write\": \"appointment\"}'),
('44444444-5555-6666-7777-222222222222', 'Billing Staff', '{\"read\": \"billing, appointment\", \"write\": \"billing\"}'),
('55555555-6666-7777-8888-333333333333', 'Nurse', '{\"read\": \"patient, medical_record\", \"write\": \"medical_record\"}'),
('66666666-7777-8888-9999-444444444444', 'IT Support', '{\"read\": \"all\", \"write\": \"none\"}'),
('77777777-8888-9999-0000-555555555555', 'Scheduler', '{\"read\": \"appointment, doctor\", \"write\": \"appointment\"}'),
('88888888-9999-0000-1111-666666666666', 'Records Clerk', '{\"read\": \"medical_record\", \"write\": \"medical_record\"}'),
('99999999-0000-1111-2222-777777777777', 'Pharmacist', '{\"read\": \"prescriptions\", \"write\": \"none\"}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `fk_appointment_patient` (`patient_id`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `medicalrecord`
--
ALTER TABLE `medicalrecord`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`role_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `fk_doctor_staff` FOREIGN KEY (`doctor_id`) REFERENCES `staff` (`staff_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
