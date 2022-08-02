CREATE TABLE carinfo (
    carnumber VARCHAR(8) NOT NULL PRIMARY KEY,
    carname VARCHAR(100) NOT NULL,
    carimage VARCHAR(100) NULL,
    rentcost int not null,               -- rentcost 비용 컬럼 추가
    carseate VARCHAR(4) NOT NULL,
    carpoint VARCHAR(8) NOT NULL,
    caryearmodel	varchar(5) NOT NULL,
    category VARCHAR(40) NOT NULL,
    rentstatus int not null                   -- 0이면 대여 가능, 1이면 불가능
);

CREATE TABLE IF NOT EXISTS `rent_car`.`caroption` (
bluetooth varchar(4), -- 블루투스
rear_sensor varchar(4), -- 후방센서
rear_camera varchar(5), -- 후방카메라
black_box varchar(4), -- 블랙박스
heated_seat varchar(4),  -- 열선시트
heated_handle varchar(4), -- 열선핸들
ventilated_seat varchar(4), -- 통풍시트
navigation varchar(5), -- 네비게이션
non_smoking_vehicle varchar(4), -- 금연차량
smart_key varchar(4), -- 스마트키
sunroof varchar(3), -- 선루프
rear_warning_light varchar(5), -- 후방경고등
lane_departure_prevention varchar(6), -- 차선방지이탈
carnumber VARCHAR(8) not null,
 CONSTRAINT fk_caroption_carinfo1
    FOREIGN KEY (carnumber)
        REFERENCES rent_car.carinfo (`carnumber`)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

alter table caroption
rename column Lane_Departure_Prevention to lane_departure_prevention;

insert into caroption(bluetooth, rear_sensor, rear_camera, black_box, heated_seat, heated_handle, ventilated_seat, navigation, non_smoking_vehicle,
smart_key, sunroof, rear_warning_light, carnumber)
values('블루투스', '후방센서', '후방카메라', '블랙박스', '열선시트', '열선핸들', '통풍시트', '네비게이션', '금연차량', '스마트키', '선루프', '후방경고등', '97박0327');

select * from carinfo;
select * from caroption;

update caroption
set black_box = '블랙박스'
where carnumber = '4';


use rent_car;

update carinfo
set 
carpoint = '서울 화곡동',
carnumber = '2'
where carnumber = '1';


select c.carnumber, c.carname, c.carprice, c.category, c.carpoint, c.caryearmodel, c.carimage,
o.bluetooth, o.rear_sensor, o.rear_camera, o.black_box, o.heated_seat, o.heated_handle, o.ventilated_seat, o.navigation, o.non_smoking_vehicle,
o.smart_key, o.sunroof, o.rear_warning_light, o.Lane_Departure_Prevention
from carinfo c inner join caroption o
on c.carnumber = o.carnumber
where c.carnumber = '95장0311';

select c.carnumber, c.carname, c.carprice, c.category, c.carpoint, c.caryearmodel, c.carimage, c.carseate
o.bluetooth, o.rear_sensor, o.rear_camera, o.black_box, o.heated_seat, o.heated_handle, o.ventilated_seat, o.navigation, o.non_smoking_vehicle,
o.smart_key, o.sunroof, o.rear_warning_light, o.lane_departure_prevention
from carinfo c inner join caroption o
on c.carnumber = o.carnumber;

