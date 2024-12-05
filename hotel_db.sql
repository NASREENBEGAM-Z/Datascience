use  hotel_db;
CREATE TABLE hotel (Hotel_Id INT PRIMARY KEY AUTO_INCREMENT,Name VARCHAR(45) NOT NULL ,City VARCHAR(45) NOT NULL);
INSERT INTO hotel (Name, City) VALUES('Hotel Asoka', 'Mumbai'),('The Taj', 'Mumbai'),('Oberoi', 'Delhi'),('Marriott', 'Bangalore');
desc hotel;
CREATE TABLE Room (
 Room_No INT PRIMARY KEY AUTO_INCREMENT,
 Hotel_Id INT,
 Type ENUM('Single', 'Double', 'Deluxe', 'Family', 'Suite') NOT NULL,
 Price DECIMAL(10, 2) NOT NULL,
 FOREIGN KEY (Hotel_Id) REFERENCES hotel(Hotel_Id)
);
INSERT INTO Room (Hotel_Id, Type, Price)
VALUES
(1, 'Single', 1500.00),
(1, 'Double', 2500.00),
(1, 'Family', 3000.00),
(2, 'Single', 2000.00),
(2, 'Double', 3500.00),
(3, 'Single', 1800.00),
(3, 'Suite', 5000.00),
(4, 'Deluxe', 4000.00),
(4, 'Family', 4500.00);
CREATE TABLE Guest (
 Guest_Id INT PRIMARY KEY AUTO_INCREMENT,
 Name VARCHAR(45) NOT NULL,
 Address VARCHAR(45) NOT NULL,
 Guest_Type ENUM('Platinum', 'Gold', 'Regular') NOT NULL
);
INSERT INTO Guest (Name, Address, Guest_Type)
VALUES
('John Doe', '123 Main St', 'Regular'),
('Jane Smith', '456 Elm St', 'Gold'),
('Alice Johnson', '789 Maple St', 'Platinum'),
('Bob Brown', '101 Oak St', 'Regular');
   CREATE TABLE Booking (
    Hotel_Id INT,
    Guest_Id INT,
    From_Date DATE,
    To_Date DATE,
    Room_No INT,
    Number_of_Guests INT,
    Kids ENUM('Y', 'N'),
    FOREIGN KEY (Hotel_Id) REFERENCES Hotel(Hotel_Id),
    FOREIGN KEY (Guest_Id) REFERENCES Guest(Guest_Id),
    FOREIGN KEY (Room_No) REFERENCES Room(Room_No)
);

drop table booking;
INSERT INTO Booking (Hotel_Id, Guest_Id, From_Date, To_Date, Room_No, Number_of_Guests, Kids) VALUES
(1, 1, '2010-06-14', '2016-06-6', 1, 2, 'N'),
(1, 2, '2024-06-14', '2024-06-17', 2, 2, 'Y'),
(2, 3, '2024-06-14', '2024-06-18', 4, 3, 'N'),
(3, 4, '2024-06-14', '2024-06-15', 6, 1, 'N');

show tables;
select  Name, Address FROM Guest WHERE Address LIKE '%Mumbai%' ORDER BY Name ;
SELECT h.Name AS Hotel_Name, AVG(r.Price) AS Average_Price
FROM Room r
JOIN Hotel h ON r.Hotel_Id = h.Hotel_Id
GROUP BY h.Name;
SELECT SUM(r.Price) AS Lost_Income
FROM Room r
LEFT JOIN Booking b ON r.Room_No = b.Room_No AND CURDATE() BETWEEN b.From_Date AND b.To_Date
WHERE b.Room_No IS NULL;
SELECT h.City, COUNT(DISTINCT h.Hotel_Id) AS Hotel_Count
FROM Booking b
JOIN Hotel h ON b.Hotel_Id = h.Hotel_Id
GROUP BY h.City
ORDER BY Hotel_Count DESC;
CREATE TABLE Booking_Archive LIKE Booking;
INSERT INTO Booking_Archive
SELECT * FROM Booking
WHERE To_Date < '2017-12-31';

DELETE FROM Booking WHERE To_Date < '2017-12-31';

select * from booking limit 1000;