
-- 유저 테이블 
CREATE TABLE user (
    id VARCHAR(10) NOT NULL PRIMARY KEY,
    passwd VARCHAR(24) NOT NULL,
    mname VARCHAR(20) NOT NULL,
    phone VARCHAR(14) NOT NULL,
    email VARCHAR(50) NOT NULL,
    license VARCHAR(20) NOT NULL,
    grade VARCHAR(10) NOT NULL DEFAULT 'H',
    pnt VARCHAR(10000) NOT NULL DEFAULT '0',
    fname VARCHAR(50) NOT NULL,
    zipcode VARCHAR(7) NULL,
    address1 VARCHAR(150) NULL,
    address2 VARCHAR(50) NULL
);
    
    
insert into user (id, passwd, mname, phone, email, license, grade, pnt, fname, zipcode, address1,address2)
values ('user1', '1234','김길동','010-0000-0001', 'mail1@mail.com', '13-11-123456-78', 'H', '0', 'license.jpg',  
'123-123','서울시','강남구');
insert into user (id, passwd, mname, phone, email, license, grade, pnt, fname, zipcode, address1,address2)
values ('user2', '1234','홍길동','010-0000-0002', 'mail2@mail.com', '13-11-123456-79', 'H', '0', 'license.jpg',  
'123-123','서울시','용산구');
insert into user (id, passwd, mname, phone, email, license, grade, pnt, fname, zipcode, address1,address2)
values ('user3', '1234','박길동','010-0000-0003', 'mail3@mail.com', '13-11-123456-80', 'H', '0', 'license.jpg',  
'123-123','서울시','동작구');

insert into user (id, passwd, mname, phone, email, license, grade, pnt, fname, zipcode, address1,address2)
VALUES('admin', '1234', '관리자', '02-1234-1234', 'admin@mail.com','0', 'A','0', 'license.jpg',
'123-123','서울시','서초구');
use rent_car;
drop table carcondition;
drop table carinfo;
-- =====================================================
-- 차량 관리 테이블 
CREATE TABLE carinfo (
    carnumber VARCHAR(8) NOT NULL PRIMARY KEY,
    carname VARCHAR(100) NOT NULL,
    carimage VARCHAR(100) NULL,
    carseate VARCHAR(4) NOT NULL,
    carpoint VARCHAR(8) NOT NULL,
    category VARCHAR(40) NOT NULL
);

create table carCondition(
	wheel varchar (5),
    windows varchar (5),
    bumper varchar (5),
    sideMirror varchar (5),
    cardoor varchar (5),
	airconditioner varchar(2),
    safetyBelt varchar (2),
    bluetooth varchar (2),
    rearSensor varchar(2),
    rearCamera varchar(2),
    sunroof varchar(2),
    blackbox varchar(2),
     carnumber VARCHAR(8),
    FOREIGN KEY (carnumber)
        REFERENCES carinfo (carnumber)
);


insert into carinfo(carname, carimage, carseate, carnumber, carpoint, category)
values('k5', 'k5.jpg', '4인승','12가1234', '서울 동작구', '중형차');

insert into carCondition(wheel, windows, bumper, sideMirror, cardoor, airconditioner, safetyBelt, bluetooth, rearSensor, rearCamera, sunroof, blackbox,chargeState,carnumber)
values(1,2,3,1,2,'있다', '없다', '없다', '없다', '없다', '없다', '없다','3', '12가1234');


-- =====================================================
-- 공지사항 테이블
CREATE TABLE Notice (
    noticeno INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(300) NOT NULL,
    wname VARCHAR(30) NOT NULL,
    content VARCHAR(1000) NOT NULL,
    passwd VARCHAR(20),
    wdate DATE NOT NULL,
    fname VARCHAR(100) DEFAULT '파일이 없습니다.'
);

insert into Notice(title, wname, content, passwd, wdate)
values ('공지합니다', '관리자', '누구세요?', 1234, sysdate());

-- =====================================================
-- 예약 테이블 
CREATE TABLE IF NOT EXISTS booking (
    booking_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rent_day DATE NOT NULL,
    rent_time TIME NOT NULL,
    return_day DATE NOT NULL,
    return_time TIME NOT NULL,
    user_id VARCHAR(10),
    reserved_car VARCHAR(8),
    insurance VARCHAR(20),
    FOREIGN KEY (user_id)
        REFERENCES user (id),
    FOREIGN KEY (reserved_car)
        REFERENCES car_info (carnumber)
);

insert into booking (rent_day, rent_time, return_day, return_time, user_id, reserved_car, insurance)
values (20220702, 100000, 20220703, 110000, 'user1', '12가1234', '완전자차');


  -- =====================================================
CREATE TABLE `list` (
    listno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    mname VARCHAR(100) NOT NULL,
    title VARCHAR(100) NULL,
    content VARCHAR(3000) NOT NULL,
    viewcnt INT DEFAULT '0',
    wdate DATE NOT NULL,
    grpno INT NOT NULL,
    ansnum INT DEFAULT '0',
    filename VARCHAR(8) NOT NULL,
    filesize INT DEFAULT '0',
    user_id VARCHAR(10),
    FOREIGN KEY (user_id)
        REFERENCES user (id)
);
    
CREATE TABLE reply (
    rnum INT NOT NULL AUTO_INCREMENT,
    content VARCHAR(500) NOT NULL,
    regdate DATE NOT NULL,
    id VARCHAR(10) NOT NULL,
    listno INT NOT NULL,
    PRIMARY KEY (rnum),
    FOREIGN KEY (listno)
        REFERENCES list (listno)
);
 
INSERT INTO `list` (mname, title, content, wdate,grpno,filename, filesize)
VALUES( "이름", "제목", "내용",  DATE(NOW()),
(SELECT ifnull(MAX(grpno),0) + 1 FROM list b),"어디인가",1 );
        
insert into reply(content, regdate, id, listno)
values("", sysdate(), "", 1);
    
 -- =====================================================
CREATE TABLE IF NOT EXISTS surpport (
    carnum VARCHAR(10) PRIMARY KEY,
    rx VARCHAR(20),
    ry VARCHAR(20),
    state VARCHAR(10)
);

-- 처리가 종료된 요청에 관한 정보만 저장 
CREATE TABLE IF NOT EXISTS surpport_log (
    no INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45),
    reason VARCHAR(1000),
    request DATETIME,
    accept DATETIME,
    processed DATETIME
);

insert into surpport(carnum, rx, ry, state) 
values('12가1234', '37.769976567342',"126.693326928942", "request");


SELECT 
    *
FROM
    booking b,
    user u,
    car_info c
WHERE
    (b.user_id = u.id)
        AND (b.reserved_car = c.carnumber);

