
-- Create User table--

CREATE TABLE User (
  ID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Email VARCHAR(50) NOT NULL UNIQUE,
  Password VARCHAR(50) NOT NULL,
  ContactDetails VARCHAR(100)
);


-- Create Ticket table--

CREATE TABLE Ticket (
  ID INT PRIMARY KEY,
  Source VARCHAR(50) NOT NULL,
  Destination VARCHAR(50) NOT NULL,
  Date DATE NOT NULL,
  Time TIME NOT NULL,
  SeatNumber INT NOT NULL,
  Fare DECIMAL(8, 2) NOT NULL
);


-- Create Payment table--

CREATE TABLE Payment (
  ID INT PRIMARY KEY,
  TicketID INT NOT NULL,
  Amount DECIMAL(8, 2) NOT NULL,
  PaymentMethod VARCHAR(50) NOT NULL,
  TransactionDetails VARCHAR(100)
);

-- Create Schedule table--

CREATE TABLE Schedule (
  ID INT PRIMARY KEY,
  RouteID INT NOT NULL,
  DepartureTime TIME NOT NULL,
  ArrivalTime TIME NOT NULL,
  Availability INT NOT NULL
);


-- Create Booking table--

CREATE TABLE Booking (
  ID INT PRIMARY KEY,
  UserID INT NOT NULL,
  TicketID INT NOT NULL,
  BookingDate DATE NOT NULL,
  Status VARCHAR(50) NOT NULL
);


-- Create CustomerSupport table--

CREATE TABLE CustomerSupport (
  ID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  ContactDetails VARCHAR(100),
  Department VARCHAR(50)
);


-- Create Admin table--

CREATE TABLE Admin (
  ID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Email VARCHAR(50) NOT NULL UNIQUE,
  Password VARCHAR(50) NOT NULL,
  Role VARCHAR(50) NOT NULL
);


-- Add foreign key constraints--

ALTER TABLE Ticket
ADD CONSTRAINT FK_Ticket_User FOREIGN KEY (UserID) REFERENCES User(ID);

ALTER TABLE Payment
ADD CONSTRAINT FK_Payment_Ticket FOREIGN KEY (TicketID) REFERENCES Ticket(ID);

ALTER TABLE Schedule
ADD CONSTRAINT FK_Schedule_Route FOREIGN KEY (RouteID) REFERENCES Route(ID);

ALTER TABLE Booking
ADD CONSTRAINT FK_Booking_User FOREIGN KEY (UserID) REFERENCES User(ID),
ADD CONSTRAINT FK_Booking_Ticket FOREIGN KEY (TicketID) REFERENCES Ticket(ID);

