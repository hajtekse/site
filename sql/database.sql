-- Database
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
-- Create tables
CREATE TABLE users (
id integer AUTO_INCREMENT,
username varchar(20),
firstname varchar(20),
lastname varchar(20),
email varchar(20),
PRIMARY KEY (id, username)
);

CREATE TABLE superadmin (
id integer AUTO_INCREMENT,
userId int default 0,
username varchar(20),
PRIMARY KEY (id),
FOREIGN KEY (userId, username) REFERENCES users(id, username)
);

CREATE TABLE supermoderator(
id integer AUTO_INCREMENT,
userId int default 0,
username varchar(20),
PRIMARY KEY (id),
FOREIGN KEY (userId, username) REFERENCES users(id, username)
);

CREATE TABLE groupadmin (
id integer AUTO_INCREMENT,
userId int default 0,
username varchar(20),
PRIMARY KEY (id),
FOREIGN KEY (userId, username) REFERENCES users(id, username)
);

CREATE TABLE groupmoderator (
id integer AUTO_INCREMENT,
userId int default 0,
username varchar(20),
PRIMARY KEY (id),
FOREIGN KEY (userId, username) REFERENCES users(id, username)
);

CREATE TABLE profile (
id integer AUTO_INCREMENT,
userId int default 0,
username varchar(20),
profiletext text,
PRIMARY KEY(id),
FOREIGN KEY (userId, username) REFERENCES users(id, username)
);

CREATE TABLE msgs (
id integer AUTO_INCREMENT,
receiverId int default 0,
senderId int default 0,
header varchar(30),
textfield text,
PRIMARY KEY (id),
FOREIGN KEY (receiverId, senderId) REFERENCES users(id)
);