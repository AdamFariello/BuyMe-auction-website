/*---------------------------------------
				Root Access
----------------------------------------
-- TODO figure out if it should be included
use mysql;
update user set authentication_string=password('root1') where user='root';
flush privileges;
*/

/*---------------------------------------
		       Database Setup
-----------------------------------------*/
drop database if exists auction;
create database auction;
use auction;

-- fix all foriegn keys


/*User information*/
CREATE TABLE user (
	username varchar(20) primary key,
    password varchar(20)
);
CREATE TABLE endUser (
    username varchar(20) primary key,
    foreign key (username) references user(username) 
);
CREATE TABLE customerRep (
	username varchar(20) primary key,
	foreign key (username) references user(username) 
);
CREATE TABLE admin (
	username varchar(20) primary key,
	foreign key (username) references user(username) 
);

/*Auction*/
CREATE TABLE category(
	categoryID 	 int auto_increment,
    mainCategory varchar(45),
    subCategory  varchar(45),
    primary key(categoryID)
);
CREATE TABLE item(
	itemID 	   int 			auto_increment,
	vendorName varchar(20),
    itemName   		varchar(30),
    caption			varchar(100),
    closingDate 	datetime,
	minimumIncrease float,
    reservePrice 	float,
    categoryID 	 	int,
    
    primary key(itemID),
    foreign key(vendorName) references endUser(username),
    foreign key(categoryID) references category(categoryID)
);
CREATE TABLE openAuction(
	itemID int,
    primary key(itemID),
    foreign key(itemID) references item(itemID)
);
CREATE TABLE closeAuction(
	itemID int,
    wasSold bool,
    primary key(itemID),
    foreign key(itemID) references item(itemID)
);
/*
CREATE TABLE tag (
	itemID 	 int,
    gender  varchar(30),
    quality varchar(30),
    size varchar(30),
    color varchar(30),
    
    primary key(itemID),
    foreign key (itemID) references item(itemID)
);
*/
CREATE TABLE tag (
	itemID 	 int(11),
    tagType  varchar(30),
    tagValue varchar(30),
    
    primary key(itemID, tagType, tagValue),
    foreign key (itemID) references item(itemID)
);
CREATE TABLE bid(
	itemID 		   int         not null,
	bidID  		   int  	   not null auto_increment,
    bidAmount 	   float 	   not null,
    bidderUsername varchar(20) not null,
    
    primary key(bidID),
    foreign key(bidderUsername) references endUser(username),
    foreign key(itemID) references item(itemID)
);

/*user features*/
-- TODO make a inbox table
CREATE TABLE wishList (
	username varchar(20),
    itemID 	 int,
	primary key(username, itemID),
    foreign key (username) references endUser(username),
    foreign key (itemID) references item(itemID)
);
CREATE TABLE autoBid (
	username 	 varchar(20),
    itemID 		 int,
    bidLimit 	 float,
	bidIncrement float,
    primary key(username, itemID),
    foreign key (username) references endUser(username),
    foreign key (itemID) references item(itemID)
);

/*Questions*/
CREATE TABLE question (
	-- This is for a faq page 
    questionId int auto_increment,
    question varchar(20),
    questionReply varchar(1000),
   
    primary key(questionId)
);

/*---------------------------------------
				SCRIPT	 
---------------------------------------*/
/*User creation*/
-- Admin can't be created in gui
insert into user values ("admin", "admin");
insert into admin values ("admin");
-- The "user." isn't final, it's just for testing
insert into user values 
	("user.star", "wars"),
    ("user.the", "room"),
    ("user.one", "piece");
insert into endUser values ("user.star"), ("user.the"), ("user.one");

/*General Table Stuff*/
insert into category(mainCategory, subCategory) values
	("clothes", "t-shirt"),
    ("clothes", "blouse"),
    ("clothes", "pants"),
    ("clothes", "shorts"),
    ("clothes", "skirts"),
    ("clothes", "sweaters"),
    ("clothes", "longsleeve"),
    ("clothes", "tanktops");
    
-- TODO replace with logic (i.e.: auto_incremental fields not being given direct values)
-- DATE_FORMAT("2022-04-29", "%M %d %Y")
insert into item value 
	(1, "user.the", "White Nike Sneakers", "Shoes", '2022-04-29', .01, 4, 1);
insert into bid (itemID, bidAmount, bidderUserName) values 
	(1, 4, "user.star"),
    (1, 6, "user.one")
; 
insert into tag values
	(1, "Color", "red"),
    (1, "Gender", "women"),
    (1, "Quality", "new"),
    (1, "Size", "xs")
;

insert into item value 
	(2, "user.the", "purple Nike Sneakers", "Shoes", '2022-04-29', .01, 4, 2);
insert into bid (itemID, bidAmount, bidderUserName) values 
	(2, 2, "user.star"),
    (2, 8, "user.one")
; 
insert into tag values
	(2, "Color", "blue"),
    (2, "Gender", "men"),
    (2, "Quality", "used"),
    (2, "Size", "L")
;