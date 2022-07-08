-- 차량 관리 테이블 
CREATE TABLE carinfo (
    carnumber VARCHAR(8) NOT NULL PRIMARY KEY,
    carname VARCHAR(100) NOT NULL,
    carimage VARCHAR(100) NULL,
    carseate VARCHAR(4) NOT NULL,
    carpoint VARCHAR(8) NOT NULL,
    category VARCHAR(40) NOT NULL
);

CREATE TABLE carCondition (
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
    	chargeState varchar(2),
    carnumber VARCHAR(8),
    FOREIGN KEY (carnumber)
        REFERENCES carinfo (carnumber)
);

insert into car_info(carname, carimage, carseate, carnumber, carpoint, category)
values('k5', 'k5.jpg', '4인승','12가1234', '서울 동작구', '중형차');

insert into carCondition(wheel, windows, bumper, sideMirror, cardoor, airconditioner, safetyBelt, bluetooth, rearSensor, rearCamera, sunroof, blackbox,chargeState,carnumber)
values('좋음','좋음','좋음','좋음','좋음','있다', '없다', '없다', '없다', '없다', '없다', '없다','3', '12가1234');

select * from carinfo
order by carnumber desc
limit 0,12;

update carinfo
set  carpoint = '서울 강서구'
where carnumber = '12가1111';

delete from carinfo
where carunmber ='12가1111';