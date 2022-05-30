create database  BloodBankk

use BloodBankk
CREATE TABLE Admins
(
A_id int Primary Key identity(1,1),
A_name varchar(20) not null,
A_password varchar(20) not null
)


insert into Admins values('Admin','admin')
select * from Admins

create trigger Adminlog
on Admins
after insert ,update,delete
AS print 'you can not insert, update and delete this table Admin'        
rollback;
CREATE TABLE Staff
(
S_id int Primary Key identity(1,1),
S_name varchar(20),
S_age int,
S_phnnum varchar(11),
S_address varchar(50),
A_id int FOREIGN KEY (A_id) REFERENCES Admins(A_id)
)

insert into Staff values('Ali',20,01245245,'gulshan',1)
insert into Staff values('Ahmed',22,0331111,'clifton',1)
insert into Staff values('Ayesha',25,01245245,'gulshan',1)
insert into Staff values('Moheen',21,03312222,'garden',1)
insert into Staff values('Arhum',26,03459999,'csd',1)
Select * from Staff

select Staff.S_name,Staff.S_age,Staff.S_address,Admins.A_name from Staff 
inner join  Admins on Admins.A_id=Staff.A_id
CREATE TABLE BloodBankk
(
bb_id int Primary key identity(1,1),
bb_address varchar(100),
bb_zipcode int,
Adminid int FOREIGN KEY  REFERENCES Admins(A_id),
stockid int foreign key references Stock(st_id),
donorId int foreign key references Donor(D_id) 
)
insert into BloodBankk values('Saddar',1234,1,1,1)
insert into BloodBankk values('Malir',2344,1,2,2)
Insert into BloodBankk values('Clifton',2024,1,3,3)
Insert into BloodBankk values('3 talwaar',2024,1,4,4)
Insert into BloodBankk values('new karachi',2024,1,5,5)

delete from BloodBankk where bb_id=18
select BloodBankk.bb_address,BloodBankk.bb_zipcode,Admins.A_name,Stock.St_bloodname,Stock.St_bloodquantity,Donor.D_name from BloodBankk
inner join Admins on Admins.A_id=BloodBankk.Adminid
inner join Stock on Stock.St_id=BloodBankk.stockid
inner join Donor on Donor.D_id=BloodBankk.donorId
Select * from BloodBankk

drop table Admins
drop table Stock
drop table Donor
CREATE TABLE Donor
(
D_id int Primary key identity(1,1),
D_name varchar(20),
D_age int,
D_weight float,
D_haemoglobin float,
)
--- not inserted help
Insert into Donor values ('Tehrim',20,11.1,15.1)
Insert into Donor values ('Ahmed',21,20.1,13.47)
Insert into Donor values ('Filza',20,15.1,13.2)
Insert into Donor values ('Saeed',25,100.1,14.1)
Insert into Donor values ('Jawad',24,30.1,15.2)
Select * from Donor

select * from BloodBankk
CREATE TABLE Stock
(
St_id int Primary key identity(1,1),
St_bloodname varchar(10),
St_bloodquantity int,
)
insert into Stock values('O+',10)
insert into Stock values('O-',20)
insert into Stock values('AB+',30)
insert into Stock values('B+',5)
insert into Stock values('B-',7)


CREATE TABLE Reciever
(
R_id int Primary Key identity(1,1),
R_name varchar(20),
R_bloodname varchar(20),
R_age int,
R_phnnum varchar(30)
)
insert into Reciever values('Ayan','O+',21,'021010101')
insert into Reciever values('Eishal','B+',20,'01010101')
insert into Reciever values('Hasham','AB+',26,'12345678')
insert into Reciever values('Rayyan','O-',21,'09876541')
insert into Reciever values('Razia','B-',29,'08097976')
select * from reciever

CREATE TABLE Request
(
Req_id int Primary Key identity(1,1),
Req_blood varchar(20),	
R_id int FOREIGN KEY (R_id) REFERENCES Reciever(R_id)
)

select Request.Req_blood,Reciever.R_name,Reciever.R_bloodname from Request
inner join Reciever on Request.R_id=Reciever.R_id


insert into Request values('O+',1)
insert into Request values('O-',2)
insert into Request values('AB+',3)
insert into Request values('B+',4)
insert into Request values('B-',5)
delete from Request where Req_id=1

Select * from Request
CREATE TABLE ReqDetail
(
ReqD_id int Primary Key identity,
ReqD_Bloodname varchar(20),
bbid int foreign key references BloodBankk(bb_id),
Req_id int FOREIGN KEY (Req_id) REFERENCES Request(Req_id)
)
insert into ReqDetail values('O+',3,1)
insert into ReqDetail values('O-',1003,2)
insert into ReqDetail values('AB+',1004,3)
insert into ReqDetail values('B+',1005,4)
insert into ReqDetail values('B-',1006,5)
delete from ReqDetail where ReqD_id=1009
select * from ReqDetail

truncate table reqDetail
select Donor.D_name,ReqDetail.ReqD_Bloodname,BloodBankk.bb_address,Request.Req_blood,Reciever.R_bloodname,Reciever.R_name from ReqDetail
inner join BloodBankk on BloodBankk.bb_id=ReqDetail.bbid
inner join Stock on Stock.St_id=BloodBankk.stockid
inner join Donor on Donor.D_id=BloodBankk.donorId
inner join Request on Request.R_id=ReqDetail.Req_id
inner join Reciever on Reciever.R_id=Request.Req_id

select * from Reciever
