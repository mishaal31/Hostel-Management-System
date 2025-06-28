# Code
CREATE DATABASE Hostel_Management_System;
USE Hostel_Management_System;

CREATE TABLE Hostel (
    Hostel_ID INT PRIMARY KEY NOT NULL,
    Hostel_Name VARCHAR(50) NOT NULL,
    Hostel_Type VARCHAR(10) NOT NULL,
    Total_Rooms INT NOT NULL
);

CREATE TABLE Room (
    Room_ID INT PRIMARY KEY,
    Room_No VARCHAR(10) NOT NULL,
    Room_Type VARCHAR(20) NOT NULL,
    Capacity INT NOT NULL,
    Occupied_Count INT NOT NULL,
    RentPerMonth DECIMAL(10, 2) NOT NULL,
    Hostel_ID INT NOT NULL,
    FOREIGN KEY (Hostel_ID) REFERENCES
    Hostel(Hostel_ID)
);

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    First_Name VARCHAR(100) NOT NULL,
    Last_Name VARCHAR(100) NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Contact_No VARCHAR(15) NOT NULL,
    Email VARCHAR(100),
    Address TEXT NOT NULL,
    Admission_Date DATE NOT NULL,
    Guardian_Name VARCHAR(100) NOT NULL,
    Guardian_Relation VARCHAR(50) NOT NULL,
    Guardian_Contact VARCHAR(15) NOT NULL,
    Room_ID INT NOT NULL,
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID)
);

CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY,
    Staff_Name VARCHAR(100) NOT NULL,
    Designation VARCHAR(50) NOT NULL,
    Contact_No VARCHAR(15) NOT NULL,
    Assigned_Area VARCHAR(100) NOT NULL
);

CREATE TABLE Fee (
    Fee_ID INT PRIMARY KEY,
    Student_ID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Payment_Date DATE NOT NULL,
    Payment_Mode VARCHAR(20) NOT NULL,
    Fee_Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

CREATE TABLE Complaint (
    Complaint_ID INT PRIMARY KEY,
    Student_ID INT NOT NULL,
    Complaint_Date DATE NOT NULL,
    ComplaintType VARCHAR(50) NOT NULL,
    Complaint_Description TEXT NOT NULL,
    Complaint_Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

CREATE TABLE Visitor (
    Visitor_ID INT PRIMARY KEY,
    Student_ID INT NOT NULL,
    Visitor_Name VARCHAR(100) NOT NULL,
    Relation VARCHAR(50) NOT NULL,
    Visiting_Date DATE NOT NULL,
    Time_In TIME NOT NULL,
    Time_Out TIME NOT NULL,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

CREATE TABLE Inventory (
    Item_ID INT PRIMARY KEY,
    Room_ID INT NOT NULL,
    Item_Name VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    Item_Condition VARCHAR(20) NOT NULL,
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID)
);

INSERT INTO Hostel (Hostel_ID, Hostel_Name, Hostel_Type, Total_Rooms) 
VALUES
(2007, 'Rose Hostel', 'Girls', 25),
(2006, 'Oak Hostel', 'Boys', 25);

 INSERT INTO Room (Room_ID, Room_No, Room_Type, Capacity, Occupied_Count, RentPerMonth, Hostel_ID) 
 VALUES
(1101, 'A101', 'Single', 1, 1, 5000.00, 2006),
(1102, 'A102', 'Double', 2, 2, 4500.00, 2007),
(1103, 'A103', 'Double', 2, 2, 4500.00, 2007),
(1104, 'A104', 'Dorm', 4, 3, 3000.00, 2006),
(1105, 'A105', 'Single', 1, 1, 5000.00, 2007),
(1106, 'B101', 'Single', 1, 1, 5000.00, 2006),
(1107, 'B102', 'Double', 2, 1, 4500.00, 2007),
(1108, 'B103', 'Dorm', 4, 0, 3000.00, 2006),
(1109, 'B104', 'Single', 1, 1, 5000.00, 2007),
(1110, 'B105', 'Double', 2, 2, 4500.00, 2006),
(2111, 'C101', 'Dorm', 4, 4, 3000.00, 2007),
(2112, 'C102', 'Double', 2, 2, 4500.00, 2006),
(2113, 'C103', 'Single', 1, 0, 5000.00, 2007),
(2114, 'C104', 'Dorm', 4, 3, 3000.00, 2006),
(2115, 'C105', 'Single', 1, 1, 5000.00, 2007),
(2116, 'D101', 'Double', 2, 2, 4500.00, 2006),
(2117, 'D102', 'Single', 1, 1, 5000.00, 2007),
(2118, 'D103', 'Dorm', 4, 2, 3000.00, 2006),
(2119, 'D104', 'Double', 2, 1, 4500.00, 2007),
(2120, 'D105', 'Single', 1, 0, 5000.00, 2006),
(3121, 'E101', 'Dorm', 4, 0, 3000.00, 2007),
(3122, 'E102', 'Double', 2, 0, 4500.00, 2006),
(3123, 'E103', 'Single', 1, 0, 5000.00, 2007),
(3124, 'E104', 'Dorm', 4, 0, 3000.00, 2006),
(3125, 'E105', 'Single', 1, 0, 5000.00, 2007);

INSERT INTO Student (Student_ID, First_Name, Last_Name, Gender, Contact_No, Email, Address, Room_ID,Admission_Date, Guardian_Name, Guardian_Relation, Guardian_Contact) 
VALUES
(101, 'Ali', 'Raza', 'Male', '03001234501', 'ali1@example.com', 'Lahore', 1101, '2024-09-01', 'Raza Ahmed', 'Father', '03211230001'),
(102, 'Fatima', 'Khan', 'Female', '03001234502', 'fatima2@example.com', 'Karachi', 1102, '2024-09-02', 'Khan Ahmed', 'Father', '03211230002'),
(103, 'Ayesha', 'Malik', 'Female', '03001234503', 'ayesha3@example.com', 'Islamabad', 1103, '2024-09-03', 'Sara Malik', 'Mother', '03211230003'),
(104, 'Hassan', 'Ali', 'Male', '03001234504', 'hassan4@example.com', 'Lahore', 1104, '2024-09-04', 'Ali Raza', 'Father', '03211230004'),
(105, 'Zainab', 'Fatima', 'Female', '03001234505', 'zainab5@example.com', 'Rawalpindi', 1105, '2024-09-05', 'Khadija Fatima', 'Mother', '03211230005'),
(106, 'Ahmed', 'Noor', 'Male', '03001234506', 'ahmed6@example.com', 'Faisalabad', 1106, '2024-09-06', 'Noor Ali', 'Father', '03211230006'),
(107, 'Laiba', 'Shah', 'Female', '03001234507', 'laiba7@example.com', 'Multan', 1107, '2024-09-07', 'Farah Shah', 'Mother', '03211230007'),
(108, 'Usman', 'Javed', 'Male', '03001234508', 'usman8@example.com', 'Hyderabad', 1108, '2024-09-08', 'Javed Iqbal', 'Father', '03211230008'),
(109, 'Maryam', 'Nisar', 'Female', '03001234509', 'maryam9@example.com', 'Sargodha', 1109, '2024-09-09', 'Nisar Fatima', 'Mother', '03211230009'),
(110, 'Bilal', 'Tariq', 'Male', '03001234510', 'bilal10@example.com', 'Sialkot', 1110, '2024-09-10', 'Tariq Mehmood', 'Father', '03211230010'),
(111, 'Sarah', 'Iqbal', 'Female', '03001234511', 'sarah11@example.com', 'Bahawalpur', 2111, '2024-09-11', 'Iqbal Hussain', 'Father', '03211230011'),
(112, 'Hamza', 'Rehman', 'Male', '03001234512', 'hamza12@example.com', 'Larkana', 2112, '2024-09-12', 'Rehman Khan', 'Father', '03211230012'),
(113, 'Nida', 'Shahid', 'Female', '03001234513', 'nida13@example.com', 'Quetta', 2113, '2024-09-13', 'Shahid Malik', 'Father', '03211230013'),
(114, 'Zeeshan', 'Saeed', 'Male', '03001234514', 'zeeshan14@example.com', 'Gujranwala', 2114, '2024-09-14', 'Saeed Ahmed', 'Father', '03211230014'),
(115, 'Mehwish', 'Akram', 'Female', '03001234515', 'mehwish15@example.com', 'Rahim Yar Khan', 2115, '2024-09-15', 'Akram Shah', 'Father', '03211230015'),
(116, 'Umer', 'Farooq', 'Male', '03001234516', 'umer16@example.com', 'Lahore', 2116, '2024-09-16', 'Farooq Ali', 'Father', '03211230016'),
(117, 'Hira', 'Naveed', 'Female', '03001234517', 'hira17@example.com', 'Abbottabad', 2117, '2024-09-17', 'Naveed Malik', 'Father', '03211230017'),
(118, 'Kashif', 'Mehmood', 'Male', '03001234518', 'kashif18@example.com', 'Okara', 2118, '2024-09-18', 'Mehmood Raza', 'Father', '03211230018'),
(119, 'Tania', 'Yousuf', 'Female', '03001234519', 'tania19@example.com', 'Sheikhupura', 2119, '2024-09-19', 'Yousuf Ali', 'Father', '03211230019'),
(120, 'Faisal', 'Zubair', 'Male', '03001234520', 'faisal20@example.com', 'Jhelum', 2120, '2024-09-20', 'Zubair Khan', 'Father', '03211230020'),
(121, 'Amina', 'Shahbaz', 'Female', '03001234521', 'amina21@example.com', 'Kasur', 3121, '2024-09-21', 'Shahbaz Raza', 'Father', '03211230021'),
(122, 'Imran', 'Latif', 'Male', '03001234522', 'imran22@example.com', 'DG Khan', 3122, '2024-09-22', 'Latif Hussain', 'Father', '03211230022'),
(123, 'Komal', 'Zahid', 'Female', '03001234523', 'komal23@example.com', 'Mardan', 3123, '2024-09-23', 'Zahid Ali', 'Father', '03211230023'),
(124, 'Noman', 'Arif', 'Male', '03001234524', 'noman24@example.com', 'Mianwali', 3124, '2024-09-24', 'Arif Bashir', 'Father', '03211230024'),
(125, 'Sana', 'Rauf', 'Female', '03001234525', 'sana25@example.com', 'Sahiwal', 3125, '2024-09-25', 'Rauf Ahmed', 'Father', '03211230025');

INSERT INTO Staff (Staff_ID, Staff_Name, Designation, Contact_No, Assigned_Area) 
VALUES
(1, 'Mr. Kamran', 'Warden', '03111111101', 'Block A'),
(2, 'Ms. Hina', 'Cleaner', '03111111102', 'Block B'),
(3, 'Mr. Bilal', 'Electrician', '03111111103', 'All Blocks'),
(4, 'Ms. Ayesha', 'Cook', '03111111104', 'Kitchen'),
(5, 'Mr. Sohail', 'Security', '03111111105', 'Main Gate'),
(6, 'Ms. Kiran', 'Receptionist', '03111111106', 'Front Desk'),
(7, 'Mr. Usman', 'Accountant', '03111111107', 'Accounts Office'),
(8, 'Ms. Samina', 'Nurse', '03111111108', 'Health Unit'),
(9, 'Mr. Junaid', 'Maintenance', '03111111109', 'Block C'),
(10, 'Ms. Saba', 'Supervisor', '03111111110', 'Ground Floor');

INSERT INTO Fee (Fee_ID, Student_ID, Amount, Payment_Date, Payment_Mode, Fee_Status) 
VALUES
(201, 101, 25000, '2024-09-05', 'Cash', 'Paid'),
(202, 102, 25000, '2024-09-06', 'Online', 'Paid'),
(203, 103, 25000, '2024-09-07', 'Bank Transfer', 'Paid'),
(204, 104, 25000, '2024-09-08', 'Cash', 'Paid'),
(205, 105, 25000, '2024-09-09', 'Online', 'Paid'),
(206, 106, 25000, '2024-09-10', 'Bank Transfer', 'Paid'),
(207, 107, 25000, '2024-09-11', 'Cash', 'Paid'),
(208, 108, 25000, '2024-09-12', 'Online', 'Paid'),
(209, 109, 25000, '2024-09-13', 'Cash', 'Paid'),
(210, 110, 25000, '2024-09-14', 'Bank Transfer', 'Paid'),
(411, 111, 25000, '2024-09-15', 'Online', 'Paid'),
(412, 112, 25000, '2024-09-16', 'Cash', 'Paid'),
(413, 113, 25000, '2024-09-17', 'Online', 'Paid'),
(414, 114, 25000, '2024-09-18', 'Bank Transfer', 'Paid'),
(415, 115, 25000, '2024-09-19', 'Cash', 'Paid'),
(416, 116, 25000, '2024-09-20', 'Online', 'Paid'),
(417, 117, 25000, '2024-09-21', 'Bank Transfer', 'Paid'),
(418, 118, 25000, '2024-09-22', 'Cash', 'Paid'),
(419, 119, 25000, '2024-09-23', 'Online', 'Paid'),
(420, 120, 25000, '2024-09-24', 'Bank Transfer', 'Paid'),
(521, 121, 25000, '2024-09-25', 'Cash', 'Paid'),
(522, 122, 25000, '2024-09-26', 'Online', 'Paid'),
(523, 123, 25000, '2024-09-27', 'Cash', 'Paid'),
(524, 124, 25000, '2024-09-28', 'Bank Transfer', 'Paid'),
(525, 125, 25000, '2024-09-29', 'Online', 'Paid');

INSERT INTO Complaint (Complaint_ID, Student_ID, Complaint_Date, ComplaintType, Complaint_Description, Complaint_Status)
VALUES
(5001, 103, '2024-09-10', 'Room Issue', 'Ceiling fan is not working properly.', 'Pending'),
(5002, 105, '2024-09-11', 'Food Quality', 'Lunch was served cold and tasteless.', 'Resolved'),
(5003, 107, '2024-09-12', 'WiFi', 'WiFi signal is too weak in my room.', 'In Progress'),
(5004, 102, '2024-09-13', 'Cleanliness', 'Bathroom not cleaned regularly.', 'Pending'),
(5005, 109, '2024-09-14', 'Noise', 'Roommate makes too much noise at night.', 'Resolved'),
(5006, 112, '2024-09-15', 'Water Supply', 'No water in the morning hours.', 'In Progress'),
(5007, 101, '2024-09-16', 'Electricity', 'Frequent power cuts in the evening.', 'Resolved'),
(5008, 106, '2024-09-17', 'Furniture', 'Chair in my room is broken.', 'Pending'),
(5009, 108, '2024-09-18', 'Security', 'Main gate is left open at night.', 'Resolved'),
(5010, 110, '2024-09-19', 'Laundry', 'Clothes got damaged in laundry.', 'In Progress'),
(5011, 111, '2024-09-20', 'Water Supply', 'Tap is leaking continuously.', 'Resolved'),
(5012, 113, '2024-09-21', 'Food Quality', 'Undercooked rice served.', 'Pending'),
(5013, 115, '2024-09-22', 'Maintenance', 'Light bulb not replaced for 3 days.', 'Pending'),
(5014, 118, '2024-09-23', 'Room Issue', 'Window is jammed and won’t open.', 'In Progress'),
(5015, 120, '2024-09-24', 'Cleanliness', 'Room not swept for a week.', 'Resolved');

INSERT INTO Visitor (
    Visitor_ID, Student_ID, Visitor_Name, Relation, Visiting_Date, Time_In, Time_Out
) VALUES
(1001, 101, 'Raza Ahmed', 'Father', '2024-09-05', '10:00:00', '11:00:00'),
(1002, 102, 'Khan Ahmed', 'Father', '2024-09-06', '11:30:00', '12:30:00'),
(1003, 103, 'Sara Malik', 'Mother', '2024-09-07', '09:45:00', '10:15:00'),
(1004, 104, 'Ali Raza', 'Father', '2024-09-08', '14:00:00', '15:00:00'),
(1005, 105, 'Khadija Fatima', 'Mother', '2024-09-09', '13:30:00', '14:30:00'),
(1006, 106, 'Noor Ali', 'Father', '2024-09-10', '15:00:00', '15:45:00'),
(1007, 107, 'Farah Shah', 'Mother', '2024-09-11', '16:00:00', '17:00:00'),
(1008, 108, 'Javed Iqbal', 'Father', '2024-09-12', '11:15:00', '12:00:00'),
(1009, 109, 'Nisar Fatima', 'Mother', '2024-09-13', '10:30:00', '11:30:00'),
(1010, 110, 'Tariq Mehmood', 'Father', '2024-09-14', '12:00:00', '13:00:00'),
(1011, 111, 'Iqbal Hussain', 'Father', '2024-09-15', '09:00:00', '09:30:00'),
(1012, 112, 'Rehman Khan', 'Father', '2024-09-16', '14:15:00', '15:15:00'),
(1013, 113, 'Shahid Malik', 'Father', '2024-09-17', '10:00:00', '10:45:00'),
(1014, 114, 'Saeed Ahmed', 'Father', '2024-09-18', '11:00:00', '11:45:00'),
(1015, 115, 'Akram Shah', 'Father', '2024-09-19', '13:00:00', '13:45:00'),
(1016, 116, 'Farooq Ali', 'Father', '2024-09-20', '10:30:00', '11:15:00'),
(1017, 117, 'Naveed Malik', 'Father', '2024-09-21', '15:30:00', '16:30:00'),
(1018, 118, 'Mehmood Raza', 'Father', '2024-09-22', '14:00:00', '14:45:00'),
(1019, 119, 'Yousuf Ali', 'Father', '2024-09-23', '09:15:00', '10:00:00'),
(1020, 120, 'Zubair Khan', 'Father', '2024-09-24', '12:45:00', '13:30:00'),
(1021, 121, 'Shahbaz Raza', 'Father', '2024-09-25', '10:00:00', '11:00:00'),
(1022, 122, 'Latif Hussain', 'Father', '2024-09-26', '11:30:00', '12:15:00'),
(1023, 123, 'Zahid Ali', 'Father', '2024-09-27', '13:00:00', '13:45:00'),
(1024, 124, 'Arif Bashir', 'Father', '2024-09-28', '09:00:00', '09:45:00'),
(1025, 125, 'Rauf Ahmed', 'Father', '2024-09-29', '10:30:00', '11:15:00');

INSERT INTO Inventory (Item_ID, Room_ID, Item_Name, Quantity, Item_Condition) 
VALUES
(1001, 1101, 'Study Table', 2, 'Good'),
(1002, 1102, 'Chair', 2, 'Fair'),
(1003, 1103, 'Bed', 2, 'Good'),
(1004, 1104, 'Fan', 1, 'Good'),
(1005, 1105, 'Study Table', 2, 'Excellent'),
(1006, 1106, 'Chair', 2, 'Good'),
(1007, 1107, 'Bed', 2, 'Good'),
(1008, 1108, 'Light', 2, 'Good'),
(1009, 1109, 'Study Table', 2, 'Fair'),
(1010, 1110, 'Chair', 2, 'Poor'),
(1011, 2111, 'Bed', 2, 'Good'),
(1012, 2112, 'Curtains', 1, 'Fair'),
(1013, 2113, 'Study Table', 2, 'Excellent'),
(1014, 2114, 'Chair', 2, 'Good'),
(1015, 2115, 'Bed', 2, 'Good'),
(1016, 2116, 'Fan', 1, 'Fair'),
(1017, 2117, 'Study Table', 2, 'Good'),
(1018, 2118, 'Chair', 2, 'Excellent'),
(1019, 2119, 'Bed', 2, 'Fair'),
(1020, 2120, 'Light', 2, 'Good'),
(1021, 3121, 'Wardrobe', 1, 'Good'),
(1022, 3122, 'Bookshelf', 1, 'Good'),
(1023, 3123, 'Mirror', 1, 'Fair'),
(1024, 3124, 'Carpet', 1, 'Fair'),
(1025, 3125, 'Dustbin', 1, 'Excellent');

SELECT* FROM Hostel;
SELECT* FROM Room;
SELECT* FROM Student;
SELECT* FROM Staff;
SELECT* FROM Fee;
SELECT* FROM Complaint;
SELECT* FROM Visitor;
SELECT* FROM Inventory;

SELECT MAX(Amount) AS HighestFee
FROM Fee;

SELECT * FROM Room
WHERE Capacity = (SELECT MIN(Capacity) FROM Room);

SELECT AVG(Amount) AS AverageFee
FROM Fee;

SELECT* FROM Hostel NATURAL JOIN Room;
SELECT* FROM Room NATURAL JOIN Student;
SELECT* FROM Student NATURAL JOIN Fee;
SELECT* FROM Student NATURAL JOIN Complaint;
SELECT* FROM Student NATURAL JOIN Visitor;

SELECT Hostel_Name AS Hostel_Information
FROM Hostel
UNION
SELECT Room_No
FROM Room;

SELECT Student_ID AS Room_Occupied
FROM Student
UNION
SELECT Room_No
FROM Room;

SELECT Student_ID AS Fee_Information
FROM Student
UNION
SELECT Fee_Status
FROM Fee;

SELECT Student_ID AS Student_Complaints
FROM Student
UNION
SELECT ComplaintType
FROM Complaint;

SELECT Student_ID AS Vistors_Detail
FROM Student
UNION
SELECT Relation
FROM Visitor;
