-- CREATING A LIBRARY DATABASE

CREATE DATABASE library_demo

USE library_demo

CREATE TABLE readers
(
reader_id VARCHAR(6),
fname VARCHAR(30),
mname VARCHAR(30),
ltname VARCHAR(30),
city VARCHAR(15),
mobileno VARCHAR(10),
occupation VARCHAR(10),
dob DATE,
CONSTRAINT readers_pk PRIMARY KEY(reader_id)
);


INSERT INTO readers VALUES('C00001','Ramesh','Chandra','Sharma','Delhi','9903216678','Service','1976-12-06');
INSERT INTO readers VALUES('C00002','Avinash','Sundar','Minha','Delhi','9903216671','Service','1974-10-16');
INSERT INTO readers VALUES('C00003','Rahul',null,'Rastogi','Delhi','9903216672','Student','1981-09-26');
INSERT INTO readers VALUES('C00004','Siya',null,'Sharma','Delhi','9903216673','Housewife','1976-11-03');
INSERT INTO readers VALUES('C00005','Naveen','Chandra','Ambedkar','Mumbai','9903216674','Service','1976-09-19');
INSERT INTO readers VALUES('C00006','Suresh',null,'Borkar','Mumbai','9903216675','Student','1992-11-06');
INSERT INTO readers VALUES('C00007','Yogesh','Narayan','Sharma','Bangalore','9903216676','Student','1981-09-06');
INSERT INTO readers VALUES('C00008','Ramesh',null,'Sekhar','Delhi','9903216677','Service','1975-12-03');
INSERT INTO readers VALUES('C00009','Abhishek',null,'Das','Kolkata','9903216611','Service','1973-05-22');
INSERT INTO readers VALUES('C00010','Krishnan','Subramaniyam','Iyer','Chennai','9903216648','Service','1976-07-12');

SELECT * FROM readers


CREATE TABLE book
(
bid VARCHAR(6),
bname VARCHAR(40),
bdomain VARCHAR(30),
CONSTRAINT book_bid_pk PRIMARY KEY(bid)
);

INSERT INTO book VALUES('B00001','The Cat in the Hat','Story');
INSERT INTO book VALUES('B00002','Charlie and the Chocolate Factory','Story');
INSERT INTO book VALUES('B00003','The Very Hungry Caterpillar','Story');

SELECT * FROM book

CREATE TABLE active_readers
(
account_id VARCHAR(6),
reader_id VARCHAR(6),
bid VARCHAR(6),
atype VARCHAR(10),
astatus  VARCHAR(10),
CONSTRAINT activereaders_acnumber_pk PRIMARY KEY(account_id),
CONSTRAINT account_readerid_fk FOREIGN KEY(reader_id) REFERENCES readers(reader_id),
CONSTRAINT account_bid_fk FOREIGN KEY(bid) REFERENCES book(bid)
);

INSERT INTO active_readers VALUES('A00001','C00001','B00001','Premium','Active');
INSERT INTO active_readers VALUES('A00002','C00002','B00002','Regular','Active');
INSERT INTO active_readers VALUES('A00003','C00003','B00002','Premium','Active');
INSERT INTO active_readers VALUES('A00004','C00002','B00003','Premium','Active');
INSERT INTO active_readers VALUES('A00005','C00006','B00002','Regular','Active');
INSERT INTO active_readers VALUES('A00006','C00007','B00001','Premium','Suspended');
INSERT INTO active_readers VALUES('A00007','C00007','B00001','Premium','Active');
INSERT INTO active_readers VALUES('A00008','C00001','B00003','Regular','Terminated');
INSERT INTO active_readers VALUES('A00009','C00003','B00002','Premium','Terminated');
INSERT INTO active_readers VALUES('A00010','C00004','B00002','Regular','Active');

SELECT * FROM ACTIVE_READERS

CREATE TABLE bookissue_details
(
issuenumber VARCHAR(6),
account_id VARCHAR(6),
bid VARCHAR(20),
bookname VARCHAR(50),
number_of_book_issued INT(7),
CONSTRAINT trandetails_tnumber_pk PRIMARY KEY(issuenumber),
CONSTRAINT trandetails_acnumber_fk FOREIGN KEY(account_id) REFERENCES active_readers(account_id)
);

INSERT INTO bookissue_details VALUES('T00001','A00001','B00001','The Cat in the Hat','1');
INSERT INTO bookissue_details VALUES('T00002','A00001','B00002','Charlie and the Chocolate Factory','1');
INSERT INTO bookissue_details VALUES('T00003','A00002','B00001','The Cat in the Hat','1');
INSERT INTO bookissue_details VALUES('T00004','A00002','B00003','The Very Hungry Caterpillar','1');

SELECT * FROM bookissue_details

SELECT * FROM active_readers

SELECT * FROM active_readers WHERE astatus = 'Terminated';

SELECT * FROM active_readers WHERE astatus = 'ACTIVE';

SELECT COUNT(account_id) FROM active_readers WHERE atype = 'Premium';