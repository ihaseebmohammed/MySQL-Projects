/* SQL Refresher Assignment
Hotels in London-database*/

create database hotels; #Creating database hotels
use  hotels; #Using the database for analysis

#Creating the required tables
create table hotel(  
   hotel_no CHAR(4) NOT NULL, 
   name VARCHAR(20) NOT NULL,
   address VARCHAR(50) NOT NULL);

create table room(
  room_no VARCHAR(4) NOT NULL,
  hotel_no CHAR(4) NOT NULL,
  type CHAR(1) NOT NULL,
  price DECIMAL(5,2) NOT NULL);
  
  CREATE TABLE booking (
  hotel_no CHAR(4) NOT NULL, 
  guest_no CHAR(4) NOT NULL, 
  date_from DATETIME NOT NULL, 
  date_to DATETIME NULL, 
  room_no CHAR(4) NOT NULL);
  
  CREATE TABLE guest(
  guest_no CHAR(4) NOT NULL, 
  name VARCHAR(20) NOT NULL, 
  address VARCHAR(50) NOT NULL);

#Inserting values in the above created tables
 INSERT INTO hotel 
 VALUES ('H111', 'Grosvenor Hotel','London'),
 ('H112', 'Watergate', 'Paris'),
 ('H113', 'Omni Shoreham', 'London'),
 ('H114', 'Phoenix Park', 'London'),
 ('H115', 'Latham', 'Berlin');

select *from hotel;
 INSERT INTO room 
 VALUES ('501', 'H111', 'S', 72.00),
 (601, 'H112', 'D', 29),
 (701, 'H113', 'F', 39),
 (1001, 'H114', 'S', 58),
 (1101, 'H225', 'D', 86);
 
 INSERT INTO guest 
 VALUES ('G111', 'John Smith', 'London'), 
 ('G112', 'John Kay', '56 High St, London'),
 ('G113','Mike Ritchie','18 Tain St, London'),
('G114','Mary Tregear','5 Tarbot Rd, Aberdeen'),
('G115', 'Joe Keogh', '2 Fergus Dr, Aberdeen');
 
 INSERT INTO booking 
 VALUES ('H111', 'G111', DATE'1999-01-01', DATE'1999-01-02', '501'),
 ('H112', 'G112', DATE'04-04-15', DATE'04-05-15', 601),
 ('H113','G113',DATE'04-05-02',DATE'04-05-07', 701),
 ('H114', 'G114', DATE'16-05-04', DATE'04-05-29', 1001),
 ('H115','G115',DATE'04-05-01',DATE'04-05-04', 1101);
 
 select *from hotel; #To check if the table is updated
 
 #Updating the tables
 
 UPDATE room SET price = price*1.05; 
 
 #Creating a separate table with the same structure as the Booking table to hold archive records.
 
 CREATE TABLE booking_old ( 
   hotel_no CHAR(4) NOT NULL, 
   guest_no CHAR(4) NOT NULL, 
   date_from DATETIME NOT NULL, 
   date_to DATETIME NULL, 
   room_no VARCHAR(4) NOT NULL);
   
select *from booking_old;

#Inserting the required data within the new table

INSERT INTO booking_old (SELECT * FROM booking 
WHERE date_to < DATE'2000-01-01');

DELETE FROM booking 
WHERE date_to < DATE'2000-01-01';

select *from booking_old;

/*Simple Queries*/

#1 List full details of all hotels.

select *from hotel;

#2 List full details of all hotels in London.

SELECT *FROM hotel
WHERE address = 'London';

#3 List the names and addresses of all guests in London, alphabetically ordered by name.

select *from guest
where address LIKE '%London%' 
order by name;

#4 List all double or family rooms with a price below £40.00 per night, in ascending order of price. 

select *from room;
SELECT * FROM room WHERE price < 40 AND type IN ('D', 'F')
 ORDER BY price;
 
 #5 List the bookings for which no date_to has been specified. 
 
 SELECT *FROM booking
 where date_to = NULL;
 
 /*AGGREGATE FUNCTIONS*/
 
 #1 How many hotels are there? 
 
SELECT COUNT(*) FROM hotel; 

#2 What is the average price of a room? 

SELECT AVG(price) FROM room; 

#3 What is the total revenue per night from all double rooms? 

SELECT SUM(price) FROM room WHERE type = 'D'; 

#4 How many different guests have made bookings for August?

SELECT COUNT(DISTINCT guest_no) FROM booking
 WHERE (date_from <= DATE'2004-08-01' AND date_to >= DATE'2004-08-01') OR
 (date_from >= DATE'2004-08-01' AND date_from <= DATE'2004-08-31');
 
/*Subqueries and Joins*/

#1 List the price and type of all rooms at the Grosvenor Hotel.

SELECT price, type FROM room
 WHERE hotel_no =
 (SELECT hotel_no FROM hotel
 WHERE name = 'Grosvenor Hotel'); 
 
 #2 List all guests currently staying at the Grosvenor Hotel. 
 
 SELECT * FROM guest
 WHERE guest_no =
 (SELECT guest_no FROM booking
 WHERE date_from <= CURRENT_DATE AND
 date_to >= CURRENT_DATE AND
 hotel_no =
 (SELECT hotel_no FROM hotel
 WHERE name = 'Grosvenor Hotel')); 
 
 #3 List the details of all rooms at the Grosvenor Hotel, including the name of the guest staying in the room, if the room is occupied. 
 
 SELECT r.* FROM room r LEFT JOIN
 (SELECT g.name, h.hotel_no, b.room_no FROM guest g, booking b, hotel h
 WHERE g.guest_no = b.guest_no AND b.hotel_no = h.hotel_no AND
 h.name= 'Grosvenor Hotel' AND
 date_from <= CURRENT_DATE AND
 date_to >= CURRENT_DATE) AS XXX
 ON r.hotel_no = XXX.hotel_no AND r.room_no = XXX.room_no;
 
 #4 What is the total income from bookings for the Grosvenor Hotel today? 


SELECT SUM(price) FROM booking b, room r, hotel h
WHERE (b.date_from <= CURRENT_DATE AND
b.date_to >= CURRENT_DATE) AND
r.hotel_no = h.hotel_no AND r.room_no = b.room_no;

 #5 List the rooms that are currently unoccupied at the Grosvenor Hotel. 
 
SELECT * FROM room r
WHERE room_no NOT IN
(SELECT room_no FROM booking b, hotel h
WHERE (date_from <= CURRENT_DATE AND
date_to >= CURRENT_DATE) AND
b.hotel_no = h.hotel_no AND h.name = 'Grosvenor');

#6 What is the lost income from unoccupied rooms at the Grosvenor Hotel?

SELECT SUM(price) FROM room r
WHERE room_no NOT IN
(SELECT room_no FROM booking b, hotel h
WHERE (date_from <= CURRENT_DATE AND
date_to >= CURRENT_DATE) AND
b.hotel_no = h.hotel_no AND h.name = 'Grosvenor');

/*Grouping*/

#1 List the number of rooms in each hotel. 

SELECT hotel_no, COUNT(room_no) AS count FROM room
GROUP BY hotel_no;

#2 List the number of rooms in each hotel in London. 

SELECT hotel.hotel_no, COUNT(room_no)
AS count FROM hotel, room
WHERE room.hotel_no = hotel.hotel_no
AND address LIKE '%London%'
GROUP BY hotel_no;

#3 What is the average number of bookings for each hotel in August? 

SELECT AVG(X) AS AveNumBook FROM
(SELECT hotel_no, COUNT(hotel_no) AS X
FROM booking b
WHERE (b.date_from >= DATE'04-08-01' AND b.date_from <= DATE'04-08-31')
GROUP BY hotel_no) AS AnotherThing;

#4 What is the most commonly booked room type for each hotel in London? 

SELECT MAX(X) AS MostlyBook
FROM (SELECT type, COUNT(type) AS X
FROM booking b, hotel h, room r
WHERE r.room_no = b.room_no AND b.hotel_no = h.hotel_no AND
h.address LIKE '%London%'
GROUP BY type) AS Dummy;

#5 What is the lost income from unoccupied rooms at each hotel today?

SELECT hotel_no, SUM(price) FROM room r
WHERE room_no NOT IN
(SELECT room_no FROM booking b, hotel h
WHERE (date_from <= CURRENT_DATE AND
date_to >= CURRENT_DATE) AND
b.hotel_no = h.hotel_no)
GROUP BY hotel_no;

 