CREATE TABLE carinfo (
    carnumber VARCHAR(8) NOT NULL PRIMARY KEY,
    carname VARCHAR(100) NOT NULL,
    carimage VARCHAR(100) NULL,
    carseate VARCHAR(4) NOT NULL,
    carpoint VARCHAR(8) NOT NULL,
    caryearmodel	varchar(5) NOT NULL,               -- rdate 빼고 차 연식으로 바꾸기car_year_model // value는 2019년 이런식으로
    category VARCHAR(40) NOT NULL
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
Lane_Departure_Prevention varchar(6), -- 차선방지이탈
carnumber VARCHAR(8) not null,
 CONSTRAINT fk_caroption_carinfo1
    FOREIGN KEY (carnumber)
        REFERENCES rent_car.carinfo (`carnumber`)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);