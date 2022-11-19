-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2022 at 07:09 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finalcasestudy`
--

-- --------------------------------------------------------

--
-- Table structure for table `all_doctors`
--

CREATE TABLE `all_doctors` (
  `DoctorID` varchar(255) NOT NULL,
  `DoctorName` varchar(255) NOT NULL,
  `DepartmentID` varchar(255) NOT NULL
) ;

--
-- Dumping data for table `all_doctors`
--

INSERT INTO `all_doctors` (`DoctorID`, `DoctorName`, `DepartmentID`) VALUES
('DC001', 'John Doe', 'DEPT1'),
('DR001', 'Jane Doe', 'DEPT1');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DepartmentID` varchar(255) NOT NULL,
  `DepartmentName` varchar(255) NOT NULL,
  `DepartmentLocation` varchar(255) NOT NULL,
  `DepartmentFacility` varchar(255) NOT NULL
) ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DepartmentID`, `DepartmentName`, `DepartmentLocation`, `DepartmentFacility`) VALUES
('DEPT1', 'Blood Bank', 'Floor 4', 'Blood');

-- --------------------------------------------------------

--
-- Table structure for table `doc_on_call`
--

CREATE TABLE `doc_on_call` (
  `DoctorID` varchar(255) NOT NULL,
  `DoctorName` varchar(255) NOT NULL,
  `Qualification` varchar(255) DEFAULT NULL,
  `CallFee` int(11) NOT NULL,
  `PaymentDue` int(11) DEFAULT NULL,
  `DateOfJoin` date NOT NULL,
  `Address` varchar(255) NOT NULL,
  `PhoneNumber` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doc_on_call`
--

INSERT INTO `doc_on_call` (`DoctorID`, `DoctorName`, `Qualification`, `CallFee`, `PaymentDue`, `DateOfJoin`, `Address`, `PhoneNumber`) VALUES
('DC001', 'John Doe', 'Doctor', 1000, 500, '2003-11-11', '102 Negora MX Lane', '213-123-37');

-- --------------------------------------------------------

--
-- Table structure for table `doc_reg`
--

CREATE TABLE `doc_reg` (
  `DoctorID` varchar(255) NOT NULL,
  `DoctorName` varchar(255) NOT NULL,
  `Qualification` varchar(255) DEFAULT NULL,
  `Salary` int(11) NOT NULL,
  `DateOfJoin` date NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doc_reg`
--

INSERT INTO `doc_reg` (`DoctorID`, `DoctorName`, `Qualification`, `Salary`, `DateOfJoin`, `Address`, `PhoneNumber`) VALUES
('DR001', 'Jane Doe', 'Doctor', 100000, '2007-11-11', '106 Negora MX Lane', '361-732-15');

-- --------------------------------------------------------

--
-- Table structure for table `pat_admit`
--

CREATE TABLE `pat_admit` (
  `PatientID` varchar(255) NOT NULL,
  `PatientStatus` varchar(1) DEFAULT NULL,
  `PaymentMethod` varchar(255) NOT NULL,
  `AdvancePayment` int(11) DEFAULT NULL,
  `RoomNum` varchar(255) NOT NULL,
  `DepartmentID` varchar(255) NOT NULL,
  `DateOfAdmission` date NOT NULL,
  `IntitialCondition` varchar(255) NOT NULL,
  `Diagnosis` varchar(255) DEFAULT NULL,
  `Treatment` varchar(255) DEFAULT NULL,
  `TreatmentDoctor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pat_admit`
--

INSERT INTO `pat_admit` (`PatientID`, `PatientStatus`, `PaymentMethod`, `AdvancePayment`, `RoomNum`, `DepartmentID`, `DateOfAdmission`, `IntitialCondition`, `Diagnosis`, `Treatment`, `TreatmentDoctor`) VALUES
('PT001', 'A', 'Cheque', 10000, '101', 'DEPT1', '2022-11-11', 'LOW IRON', 'HIGH IRON', 'PILLS', 'DR001');

-- --------------------------------------------------------

--
-- Table structure for table `pat_checkup`
--

CREATE TABLE `pat_checkup` (
  `PatientID` varchar(255) NOT NULL,
  `RefferedDoctor` varchar(255) NOT NULL,
  `CheckupDate` date NOT NULL,
  `Diagnosis` varchar(255) DEFAULT NULL,
  `Treatment` varchar(255) DEFAULT NULL,
  `PatientStatus` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pat_checkup`
--

INSERT INTO `pat_checkup` (`PatientID`, `RefferedDoctor`, `CheckupDate`, `Diagnosis`, `Treatment`, `PatientStatus`) VALUES
('PT001', 'DR001', '2022-11-21', 'LOW IRON', 'PILLS', 'A'),
('PT002', 'DR001', '2022-11-21', 'LOW IRON', 'PILLS', 'D'),
('PT005', 'DR001', '2022-11-21', 'LOW IRON', 'PILLS', 'O'),
('PT006', 'DR001', '2022-11-21', 'LOW IRON', 'PILLS', 'R');

-- --------------------------------------------------------

--
-- Table structure for table `pat_dis`
--

CREATE TABLE `pat_dis` (
  `PatientID` varchar(255) NOT NULL,
  `PatientStatus` varchar(1) NOT NULL,
  `Treatment` varchar(255) NOT NULL,
  `TreatmentAdvice` varchar(255) NOT NULL,
  `PaymentMade` int(11) DEFAULT NULL,
  `PaymentMethod` varchar(255) NOT NULL,
  `DateOfDischarge` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pat_dis`
--

INSERT INTO `pat_dis` (`PatientID`, `PatientStatus`, `Treatment`, `TreatmentAdvice`, `PaymentMade`, `PaymentMethod`, `DateOfDischarge`) VALUES
('PT002', 'D', 'PILLS', 'TAKE MORE PILLS', 1000, 'CHEQUE', '2022-11-11');

-- --------------------------------------------------------

--
-- Table structure for table `pat_entry`
--

CREATE TABLE `pat_entry` (
  `PatientID` varchar(255) NOT NULL,
  `PatientName` varchar(255) NOT NULL,
  `PatientGender` varchar(1) NOT NULL,
  `PatientAge` int(11) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `PhoneNumber` varchar(255) NOT NULL,
  `City` varchar(255) NOT NULL,
  `EntryDate` date NOT NULL,
  `RefferedDoctor` varchar(255) NOT NULL,
  `Diagnosis` varchar(255) DEFAULT NULL,
  `RefferedDepartment` varchar(255) NOT NULL
) ;

--
-- Dumping data for table `pat_entry`
--

INSERT INTO `pat_entry` (`PatientID`, `PatientName`, `PatientGender`, `PatientAge`, `Address`, `PhoneNumber`, `City`, `EntryDate`, `RefferedDoctor`, `Diagnosis`, `RefferedDepartment`) VALUES
('PT001', 'Josh Doe', 'M', 10, '234 Lorane Place', '243-634-8236', 'Gander NL', '2022-05-24', 'DR001', 'Low Iron', 'DEPT1'),
('PT002', 'Logan Doe', 'M', 15, '234 Lorane Place', '243-634-8236', 'Gander NL', '2022-07-24', 'DR001', 'High Iron', 'DEPT1'),
('PT003', 'RAIN Doe', 'F', 2, '234 Lorane Place', '243-634-8236', 'Gander NL', '2022-03-12', 'DR001', 'Diabetes', 'DEPT1'),
('PT004', 'Jordan Doe', 'M', 19, '234 Lorane Place', '243-634-8236', 'Gander NL', '2022-03-17', 'DR001', 'Low Blood', 'DEPT1'),
('PT005', 'Kylie Doe', 'F', 26, '234 Lorane Place', '243-634-8236', 'Gander NL', '2019-03-17', 'DR001', 'Low Blood', 'DEPT1'),
('PT006', 'Popper Doe', 'M', 56, '234 Lorane Place', '243-634-8236', 'Gander NL', '2022-09-19', 'DR001', 'Broken Arm', 'DEPT1');

-- --------------------------------------------------------

--
-- Table structure for table `pat_opr`
--

CREATE TABLE `pat_opr` (
  `PatientID` varchar(255) NOT NULL,
  `PatientStatus` varchar(1) NOT NULL,
  `DateOfAdmission` date NOT NULL,
  `DateOfOperation` date NOT NULL,
  `OperationDoctor` varchar(255) NOT NULL,
  `OperationRoomNum` varchar(255) NOT NULL,
  `OperationType` varchar(255) NOT NULL,
  `TreatmentAdvice` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pat_opr`
--

INSERT INTO `pat_opr` (`PatientID`, `PatientStatus`, `DateOfAdmission`, `DateOfOperation`, `OperationDoctor`, `OperationRoomNum`, `OperationType`, `TreatmentAdvice`) VALUES
('PT005', 'O', '2022-11-11', '2022-11-11', 'DR001', '101', 'SURGERY', 'DONT WALK');

-- --------------------------------------------------------

--
-- Table structure for table `pat_reg`
--

CREATE TABLE `pat_reg` (
  `PatientID` varchar(255) NOT NULL,
  `PatientStatus` varchar(1) NOT NULL,
  `DateOfAdmission` date NOT NULL,
  `Diagnosis` varchar(255) DEFAULT NULL,
  `Treatment` varchar(255) DEFAULT NULL,
  `TreatmentStatus` varchar(255) NOT NULL,
  `Medicine` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pat_reg`
--

INSERT INTO `pat_reg` (`PatientID`, `PatientStatus`, `DateOfAdmission`, `Diagnosis`, `Treatment`, `TreatmentStatus`, `Medicine`) VALUES
('PT006', 'R', '2022-11-11', 'LOW IRON', 'PILLS', 'GOOD', 'IRON PILLS');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `RoomNum` varchar(255) NOT NULL,
  `DepartmentID` varchar(255) NOT NULL,
  `RoomAttendant` varchar(255) DEFAULT NULL,
  `RoomStatus` varchar(1) NOT NULL,
  `RoomType` varchar(1) NOT NULL,
  `PatientID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`RoomNum`, `DepartmentID`, `RoomAttendant`, `RoomStatus`, `RoomType`, `PatientID`) VALUES
('101', 'DEPT1', 'Alysha', '', 'B', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `all_doctors`
--
ALTER TABLE `all_doctors`
  ADD PRIMARY KEY (`DoctorID`),
  ADD KEY `DepartmentID` (`DepartmentID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DepartmentID`);

--
-- Indexes for table `doc_on_call`
--
ALTER TABLE `doc_on_call`
  ADD KEY `DoctorID` (`DoctorID`);

--
-- Indexes for table `doc_reg`
--
ALTER TABLE `doc_reg`
  ADD KEY `DoctorID` (`DoctorID`);

--
-- Indexes for table `pat_admit`
--
ALTER TABLE `pat_admit`
  ADD KEY `PatientID` (`PatientID`),
  ADD KEY `PatientStatus` (`PatientStatus`),
  ADD KEY `RoomNum` (`RoomNum`),
  ADD KEY `DepartmentID` (`DepartmentID`),
  ADD KEY `TreatmentDoctor` (`TreatmentDoctor`);

--
-- Indexes for table `pat_checkup`
--
ALTER TABLE `pat_checkup`
  ADD PRIMARY KEY (`PatientStatus`),
  ADD KEY `RefferedDoctor` (`RefferedDoctor`),
  ADD KEY `PatientID` (`PatientID`);

--
-- Indexes for table `pat_dis`
--
ALTER TABLE `pat_dis`
  ADD KEY `PatientID` (`PatientID`),
  ADD KEY `PatientStatus` (`PatientStatus`);

--
-- Indexes for table `pat_entry`
--
ALTER TABLE `pat_entry`
  ADD PRIMARY KEY (`PatientID`),
  ADD KEY `RefferedDoctor` (`RefferedDoctor`);

--
-- Indexes for table `pat_opr`
--
ALTER TABLE `pat_opr`
  ADD KEY `PatientID` (`PatientID`),
  ADD KEY `PatientStatus` (`PatientStatus`),
  ADD KEY `OperationDoctor` (`OperationDoctor`),
  ADD KEY `OperationRoomNum` (`OperationRoomNum`);

--
-- Indexes for table `pat_reg`
--
ALTER TABLE `pat_reg`
  ADD KEY `PatientID` (`PatientID`),
  ADD KEY `PatientStatus` (`PatientStatus`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`RoomNum`),
  ADD KEY `PatientID` (`PatientID`),
  ADD KEY `DepartmentID` (`DepartmentID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `all_doctors`
--
ALTER TABLE `all_doctors`
  ADD CONSTRAINT `all_doctors_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`);

--
-- Constraints for table `doc_on_call`
--
ALTER TABLE `doc_on_call`
  ADD CONSTRAINT `doc_on_call_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `all_doctors` (`DoctorID`);

--
-- Constraints for table `doc_reg`
--
ALTER TABLE `doc_reg`
  ADD CONSTRAINT `doc_reg_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `all_doctors` (`DoctorID`);

--
-- Constraints for table `pat_admit`
--
ALTER TABLE `pat_admit`
  ADD CONSTRAINT `pat_admit_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `pat_entry` (`PatientID`),
  ADD CONSTRAINT `pat_admit_ibfk_2` FOREIGN KEY (`PatientStatus`) REFERENCES `pat_checkup` (`PatientStatus`),
  ADD CONSTRAINT `pat_admit_ibfk_3` FOREIGN KEY (`RoomNum`) REFERENCES `rooms` (`RoomNum`),
  ADD CONSTRAINT `pat_admit_ibfk_4` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`),
  ADD CONSTRAINT `pat_admit_ibfk_5` FOREIGN KEY (`TreatmentDoctor`) REFERENCES `all_doctors` (`DoctorID`);

--
-- Constraints for table `pat_checkup`
--
ALTER TABLE `pat_checkup`
  ADD CONSTRAINT `pat_checkup_ibfk_1` FOREIGN KEY (`RefferedDoctor`) REFERENCES `all_doctors` (`DoctorID`),
  ADD CONSTRAINT `pat_checkup_ibfk_2` FOREIGN KEY (`PatientID`) REFERENCES `pat_entry` (`PatientID`);

--
-- Constraints for table `pat_dis`
--
ALTER TABLE `pat_dis`
  ADD CONSTRAINT `pat_dis_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `pat_entry` (`PatientID`),
  ADD CONSTRAINT `pat_dis_ibfk_2` FOREIGN KEY (`PatientStatus`) REFERENCES `pat_checkup` (`PatientStatus`);

--
-- Constraints for table `pat_entry`
--
ALTER TABLE `pat_entry`
  ADD CONSTRAINT `pat_entry_ibfk_1` FOREIGN KEY (`RefferedDoctor`) REFERENCES `all_doctors` (`DoctorID`);

--
-- Constraints for table `pat_opr`
--
ALTER TABLE `pat_opr`
  ADD CONSTRAINT `pat_opr_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `pat_entry` (`PatientID`),
  ADD CONSTRAINT `pat_opr_ibfk_2` FOREIGN KEY (`PatientStatus`) REFERENCES `pat_checkup` (`PatientStatus`),
  ADD CONSTRAINT `pat_opr_ibfk_3` FOREIGN KEY (`OperationDoctor`) REFERENCES `all_doctors` (`DoctorID`),
  ADD CONSTRAINT `pat_opr_ibfk_4` FOREIGN KEY (`OperationRoomNum`) REFERENCES `rooms` (`RoomNum`);

--
-- Constraints for table `pat_reg`
--
ALTER TABLE `pat_reg`
  ADD CONSTRAINT `pat_reg_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `pat_entry` (`PatientID`),
  ADD CONSTRAINT `pat_reg_ibfk_2` FOREIGN KEY (`PatientStatus`) REFERENCES `pat_checkup` (`PatientStatus`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `pat_entry` (`PatientID`),
  ADD CONSTRAINT `rooms_ibfk_2` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
