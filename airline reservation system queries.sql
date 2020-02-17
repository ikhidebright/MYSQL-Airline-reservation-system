CREATE TABLE passengers (
passenger_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(45),
middle_name VARCHAR(45),
last_name VARCHAR(45),
dob DATE NOT NULL,
phone_number VARCHAR(50) NOT NULL,
email VARCHAR(255) NOT NULL,
state VARCHAR(45) NOT NULL,
country VARCHAR(255) NOT NULL,
passport VARCHAR(50) NOT NULL
);

INSERT INTO passengers (first_name,
						middle_name,
						last_name, 
                        dob, 
                        phone_number, 
                        email, 
                        state, 
                        country, 
                        passport)
VALUES('Bright', 'Ikhide', 'Orina', '2000-05-15', '09061779856', 'ikhidebright@gmail.com', 'Enugu', 'Nigeria', 'A40904'),
	  ('Samuel', 'Dada', 'Aina', '1998-08-23', '07085455258', 'samdada@gmail.com', 'Edo', 'Nigeria', 'A97785'),
      ('Helen', 'Abiola', 'Olu', '1991-01-13', '09085757454', 'henloo@gmail.com', 'Kano', 'Nigeria', 'A83332');

CREATE TABLE bookings (
booking_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
passenger_id INT(11),
agent_id INT(11),
flight_number INT(11),
seat_number INT(11),
aircraft_code INT(11),
payment_id INT(11),
baggage VARCHAR(45),
airport_code INT(11),
ticket_id INT(11),
airline_code INT(11),
travel_class_id INT(11),
FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id)
);

INSERT INTO bookings   (passenger_id,
						agent_id,
						flight_number, 
                        seat_number, 
                        aircraft_code, 
                        payment_id, 
                        baggage, 
                        airport_code, 
                        ticket_id,
                        airline_code,
                        travel_class_id)
VALUES(1, 1, 1, 25, 1, 1, 'very heavy', 1, 1, 1, 1),
	  (2, 2, 2, 89, 2, 2, 'light', 2, 2, 2, 2),
      (3, 3, 3, 39, 3, 3, 'very light', 3, 3, 3, 3);


ALTER TABLE `tiideair`.`bookings` 
ADD INDEX `bookings_ibfk_8_idx` (`flight_number` ASC) VISIBLE;
;
ALTER TABLE `tiideair`.`bookings` 
ADD CONSTRAINT `bookings_ibfk_8`
  FOREIGN KEY (`flight_number`)
  REFERENCES `tiideair`.`flightschedules` (`flight_number`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;


CREATE TABLE travelClass (
travel_class_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
class_name VARCHAR(45),
class_description VARCHAR(255)
);

INSERT INTO travelclass (class_name, class_description)
VALUES('Economy', 'Travel in comfort'),
	  ('Business', 'Travel in style'),
      ('Business', 'Travel in style');

CREATE TABLE payments (
payment_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
payment_amount DECIMAL(15,2),
payment_status VARCHAR(45),
payment_date TIMESTAMP
);

INSERT INTO payments (payment_amount, payment_status, payment_date)
VALUES(36000.25, 'payed', '2020-02-14'),
	  (65222.89, 'payed', '2020-02-10'),
      (98524.87, 'payed', '2020-02-07');


CREATE TABLE aircraft (
aircraft_code INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
aircraft_model VARCHAR(45),
aircraft_producer VARCHAR(45),
aircraft_capacity INT(11)
);

INSERT INTO aircraft (aircraft_model, aircraft_producer, aircraft_capacity)
VALUES('Boeing 363', 'Boeing', 150),
	  ('Airbus 344', 'Airbus', 250),
      ('Jetmi', 'Innoson', 320);

CREATE TABLE airlines (
airline_code INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
airline_name VARCHAR(45),
airline_country VARCHAR(45)
);

INSERT INTO airlines (airline_name, airline_country)
VALUES('Ethiopia Airways', 'Ethiopia'),
	  ('Air Rwanda', 'Rwanda'),
      ('British Airways', 'Britain');

CREATE TABLE ticket (
ticket_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
ticket_type VARCHAR(45)
);

INSERT INTO ticket (ticket_type)
VALUES('one-way'),
	  ('round-trip'),
      ('one-way');

CREATE TABLE booking_agents (
agent_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
agent_name VARCHAR(45)
);

INSERT INTO booking_agents (agent_name)
VALUES('Dele'),
	  ('Sunday'),
      ('mohammed');

CREATE TABLE flightschedules (
flight_number INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
airline_code VARCHAR(45),
aircraft_type VARCHAR(45),
departure_date_time DATETIME,
arival_date_time DATETIME,
origin_airport_code VARCHAR(45),
destination_airport_code VARCHAR(45),
destination VARCHAR(50),
arrival_city VARCHAR(50),
departure_city VARCHAR(45)
);

ALTER TABLE flightschedules
DROP COLUMN aircraft_type;

INSERT INTO flightschedules (airline_code,
						departure_date_time,
						arival_date_time, 
                        origin_airport_code, 
                        destination_airport_code, 
                        destination, 
                        arrival_city, 
                        departure_city)
VALUES('GH3255', '2020-03-10 02:30:30', '2020-03-10 06:20:30', 'MMA2', 'GHA524', 'Canada', 'Ontario', 'Abuja' ),
	  ('VS141', '2020-04-08 07:00:20', '2020-04-08 09:00:00', 'EIA', 'DAL444', 'USA', 'Dallas', 'Enugu'),
      ('YUY523', '2020-02-25 12:09:10', '2020-02-25 02:45:10', 'MMI', 'KUM23', 'Ghana', 'Accra', 'Lagos');


CREATE TABLE airports (
airport_code INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
airport_name VARCHAR(45),
airport_location VARCHAR(45)
);

INSERT INTO airports (airport_name,
						airport_location)
VALUES('MMA2', 'Abuja'),
	  ('EIA', 'Enugu'),
      ('MMI', 'Lagos');


ALTER TABLE `tiideair`.`bookings` 
ADD INDEX `bookings_ibfk_2_idx` (`travel_class_id` ASC) VISIBLE;
;
ALTER TABLE `tiideair`.`bookings` 
ADD CONSTRAINT `bookings_ibfk_2`
  FOREIGN KEY (`travel_class_id`)
  REFERENCES `tiideair`.`travelclass` (`travel_class_id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;
  
  ALTER TABLE `tiideair`.`bookings` 
ADD INDEX `bookings_ibfk_4_idx` (`payment_id` ASC) VISIBLE;
;
ALTER TABLE `tiideair`.`bookings` 
ADD CONSTRAINT `bookings_ibfk_4`
  FOREIGN KEY (`payment_id`)
  REFERENCES `tiideair`.`payments` (`payment_id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;
  
  ALTER TABLE `tiideair`.`bookings` 
ADD INDEX `bookings_ibfk_5_idx` (`agent_id` ASC) VISIBLE;
;
ALTER TABLE `tiideair`.`bookings` 
ADD CONSTRAINT `bookings_ibfk_5`
  FOREIGN KEY (`agent_id`)
  REFERENCES `tiideair`.`booking_agents` (`agent_id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;


ALTER TABLE `tiideair`.`bookings` 
ADD INDEX `bookings_ibfk_6_idx` (`airport_code` ASC) VISIBLE;
;
ALTER TABLE `tiideair`.`bookings` 
ADD CONSTRAINT `bookings_ibfk_6`
  FOREIGN KEY (`airport_code`)
  REFERENCES `tiideair`.`airports` (`airport_code`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;


ALTER TABLE `tiideair`.`bookings` 
ADD INDEX `bookings_ibfk_7_idx` (`aircraft_code` ASC) VISIBLE;
;
ALTER TABLE `tiideair`.`bookings` 
ADD CONSTRAINT `bookings_ibfk_7`
  FOREIGN KEY (`aircraft_code`)
  REFERENCES `tiideair`.`aircraft` (`aircraft_code`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

SELECT first_name, 
	   last_name, 
       phone_number, 
       passport, 
       seat_number, 
       class_name, 
       ticket_type, 
       payment_amount, 
       agent_name, 
       airport_name, 
       airline_name, 
       aircraft_model,
       departure_date_time,
       arival_date_time,
       departure_city,
       arrival_city,
       destination
FROM passengers
JOIN bookings ON bookings.passenger_id = passengers.passenger_id
JOIN travelclass ON bookings.travel_class_id = travelclass.travel_class_id
JOIN ticket ON bookings.ticket_id = ticket.ticket_id
JOIN payments ON bookings.payment_id = payments.payment_id
JOIN booking_agents ON bookings.agent_id = booking_agents.agent_id
JOIN airports ON bookings.airport_code = airports.airport_code
JOIN airlines ON bookings.airline_code = airlines.airline_code
JOIN aircraft ON bookings.aircraft_code = aircraft.aircraft_code
JOIN flightschedules ON bookings.flight_number = flightschedules.flight_number;