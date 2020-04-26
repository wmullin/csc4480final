DROP TABLE ORDERS CASCADE CONSTRAINTS;    
DROP TABLE CUSTOMER CASCADE CONSTRAINTS;
DROP TABLE CHEF CASCADE CONSTRAINTS;
DROP TABLE TICKET CASCADE CONSTRAINTS;
DROP TABLE DELIVERY CASCADE CONSTRAINTS;

--Collects all food in one spot
CREATE TABLE ORDERS(
    OrderID             Int             NOT NULL,
    Item1               VarChar(20)     NULL,
    Item2               VarChar(20)     NULL,
    Price               Int             NOT NULL,
    CONSTRAINT          ORDER_PK        PRIMARY KEY(OrderID)
    );

--Links the customer to their order    
CREATE TABLE CUSTOMER(
	CustomerID			Int			    NOT NULL,
	CustomerName	    VarChar(20)		NOT NULL,
	OrderID			    Int             NOT NULL,
	CONSTRAINT			CUSTOMER_PK		PRIMARY KEY(CustomerID),
    CONSTRAINT          CUSTOMER_FK     FOREIGN KEY(OrderID) REFERENCES ORDERS(OrderID)
	);

--Creates chefs with different names and prep times for the queries later        
CREATE TABLE CHEF(
    ChefID              Int             NOT NULL,
    ChefName            VarChar(20)     NOT NULL,
    PrepTime            Int             NOT NULL,
    CONSTRAINT          CHEF_PK         PRIMARY KEY(ChefID)
    );
    
--Shows which order is made by which chef    
CREATE TABLE TICKET(
    TicketID            Int             NOT NULL,
    OrderID             Int             NOT NULL,
    ChefID              Int             NOT NULL,
    CONSTRAINT          TICKET_PK       PRIMARY KEY(TicketID),
    CONSTRAINT          TICKET_FK1      FOREIGN KEY(OrderID) REFERENCES ORDERS(OrderID),
    CONSTRAINT          TICKET_FK2      FOREIGN KEY(ChefID) REFERENCES CHEF(ChefID)
    );

--Gives and eta for the order based on address   
CREATE TABLE DELIVERY(
    DeliveryID          Int             NOT NULL,
    OrderID             Int             NOT NULL,
    Address             VarChar(50)     NOT NULL,
    ETAMIN              Int             NOT NULL,
    CONSTRAINT          DELIVERY_PK     PRIMARY KEY(DeliveryID),
    CONSTRAINT          DELIVERY_FK1    FOREIGN KEY(OrderID) REFERENCES ORDERS(OrderID)
    );