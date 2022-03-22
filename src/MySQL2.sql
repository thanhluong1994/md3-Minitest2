create database QuanLyDuLich;
use QuanLyDuLich;

create table Tour(
    tID int not null auto_increment primary key ,
    idTour varchar(20),
    ttID int,
    tPrice int,
    idStartDate date,
    idEndDate date,
    foreign key (ttID) references TourType(ttID)
);


create table TourType(
    ttID int not null auto_increment primary key ,
    idType varchar(20),
    nameType varchar(50)
);

create table Address(
    aID int not null auto_increment primary key ,
    aName varchar(50) not null ,
    description varchar(250),
    averagePrice int,
    ciID int,
    foreign key (ciID) references City(ciID)
);

create table City(
    ciID int not null auto_increment primary key ,
    ciName varchar(50) not null
);

create table Customer(
    cID int not null auto_increment primary key ,
    cName varchar(50) not null ,
    idNumber varchar(50),
    yearOfBirth year,
    ciID int,
    foreign key (ciID) references City(ciID)
);


create table Oder(
    odID int not null auto_increment primary key ,
    tID int,
    cID int,
    status boolean,
    foreign key (tID) references Tour(tID),
    foreign key (cID) references Customer(cID)
);

#them hai loai
insert into TourType values (1,'Type1','Tron goi'),(2,'Type2','Theo ngay');

#them 15 Tour
insert into Tour values (1,'T1',1,2000000,'2022/3/21','2022/3/23');
insert into Tour values (2,'T2',1,2000000,'2022/3/24','2022/3/26');
insert into Tour values (3,'T3',1,2000000,'2022/3/26','2022/3/29');
insert into Tour values (4,'T4',1,2000000,'2022/3/29','2022/4/1');
insert into Tour values (5,'T5',1,2000000,'2022/4/1','2022/4/3');
insert into Tour values (6,'T6',1,2000000,'2022/4/3','2022/4/5');
insert into Tour values (7,'T7',1,2000000,'2022/4/5','2022/4/7');
insert into Tour values (8,'T8',2,500000,'2022/4/7','2022/4/8');
insert into Tour values (9,'T9',2,500000,'2022/4/8','2022/4/9');
insert into Tour values (10,'T10',2,500000,'2022/4/9','2022/4/10');
insert into Tour values (11,'T11',2,500000,'2022/4/11','2022/4/12');
insert into Tour values (12,'T12',2,500000,'2022/4/12','2022/4/13');
insert into Tour values (13,'T13',2,500000,'2022/4/13','2022/4/14');
insert into Tour values (14,'T14',2,500000,'2022/4/14','2022/4/15');
insert into Tour values (15,'T15',2,500000,'2022/4/15','2022/4/16');

#them 5 ban ghi cua diem den du lich
insert into Address values (1,'Sam son','dia danh nay o TP Thanh Hoa',600000,1);
insert into Address values (2,'Cua Lo','dia danh nay o Nghe An',600000,2);
insert into Address values (3,'Nui Ngu Hanh Son','dia danh nay o Da Nang',600000,3);
insert into Address values (4,'Lang chu tich HCM','dia danh nay o Thu do Ha Noi',600000,4);
insert into Address values (5,'Den Hung','dia danh nay o Phu Tho',600000,5);

#Them 5 thanh pho
insert into City values (1,'Thanh Hoa'),(2,'Nghe An'),(3,'Da Nang'),(4,'Ha Noi'),(5,'Phu Tho');

#them 10 khach hang
insert into Customer values (1,'Nam','175678356','1990',1);
insert into Customer values (2,'Hung','187546835','1992',3);
insert into Customer values (3,'Manh','175678358','1994',5);
insert into Customer values (4,'Diep','175688356','1990',2);
insert into Customer values (5,'Tuan','123678356','1996',2);
insert into Customer values (6,'Long','175678306','1998',4);
insert into Customer values (7,'Ha','177678356','1980',1);
insert into Customer values (8,'Lan','175678309','1998',3);
insert into Customer values (9,'Dat','175038356','1999',5);
insert into Customer values (10,'Thai','175678946','1993',4);

#them 10 hoa don dat
insert into Oder values (1,2,1,true);
insert into Oder values (2,5,4,true);
insert into Oder values (3,3,2,false);
insert into Oder values (4,5,5,false);
insert into Oder values (5,7,6,true);
insert into Oder values (6,1,3,false);
insert into Oder values (7,8,7,false);
insert into Oder values (8,10,9,true);
insert into Oder values (9,12,10,false);
insert into Oder values (10,14,8,true);

#Thong ke so luong tour cua cac thanh pho
select * from City join Customer C on City.ciID = C.ciID join Oder O on C.cID = O.cID;
select ciName,count(odID) from City join Customer C on City.ciID = C.ciID join Oder O on C.cID = O.cID group by ciName;

#tinh so tour bat dau trong thang 3
select count(idTour) from Tour where month(idStartDate)=3;
#tinh so tour ket thuc trong thang 4
select count(idTour) from Tour where month(idEndDate)=4;