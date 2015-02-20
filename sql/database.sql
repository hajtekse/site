-- DATABASE
use hajtek;

-- Delete the tables if they exist. Set foreign_key_checks = 0 to
-- disable foreign key checks, so the tables may be dropped in
-- arbitrary order
SET foreign_key_checks = 0;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS superadmin;
DROP TABLE IF EXISTS supermoderator;
DROP TABLE IF EXISTS groupadmin;
DROP TABLE IF EXISTS groupmoderator;
DROP TABLE IF EXISTS profile;
DROP TABLE IF EXISTS msgs,
SET foreign_key_checks = 1;

-- CREATE TABLES

-- All users 
CREATE TABLE users (
id integer AUTO_INCREMENT,
userName varchar(20),
firstName varchar(20),
lastName varchar(20),
email varchar(20),
PRIMARY KEY (id),
UNIQUE (userName)
);

-- Groups
CREATE TABLE groups (
id integer AUTO_INCREMENT,
groupName varchar(20),
);

-- User Groups
CREATE TABLE userGroups (

);

-- Superadmin users
CREATE TABLE superAdmin (
id integer AUTO_INCREMENT,
userId int default 0,
userName varchar(20),
PRIMARY KEY (id),
FOREIGN KEY (userId) REFERENCES users(id)
);

-- Supermoderator users
CREATE TABLE supermoderator(
id integer AUTO_INCREMENT,
userId int default 0,
userName varchar(20),
PRIMARY KEY (id),
FOREIGN KEY (userId) REFERENCES users(id)
);

-- Groupadmin users
CREATE TABLE groupadmin (
id integer AUTO_INCREMENT,
userId int default 0,
userName varchar(20),
PRIMARY KEY (id),
FOREIGN KEY (userId) REFERENCES users(id)
);

-- Groupmoderator users
CREATE TABLE groupmoderator (
id integer AUTO_INCREMENT,
userId int default 0,
userName varchar(20),
PRIMARY KEY (id),
FOREIGN KEY (userId) REFERENCES users(id)
);

-- User profiles
CREATE TABLE profiles (
id integer AUTO_INCREMENT,
userId int default 0,
userName varchar(20),
profiletext text,
PRIMARY KEY(id),
FOREIGN KEY (userId) REFERENCES users(id)
);

-- User messages
CREATE TABLE msgs (
id integer AUTO_INCREMENT,
receiverId int default 0,
senderId int default 0,
header varchar(30),
msgText text,
PRIMARY KEY (id),
FOREIGN KEY (receiverId) REFERENCES users(id)
);

-- Forum threads
CREATE TABLE threads (
id integer AUTO_INCREMENT,
userId int default 0,
PRIMARY KEY (id)
);

-- Forum thread replies
CREATE TABLE threadReplies (
id integer AUTO_INCREMENT,
threadId int default 0,
replytext text,
PRIMARY KEY (id),
FOREIGN KEY threadId REFERENCES threads(id)
);