CREATE TABLE carinfo (
    carnumber VARCHAR(8) NOT NULL PRIMARY KEY,
    carname VARCHAR(100) NOT NULL,
    carimage VARCHAR(100) NULL,
    carseate VARCHAR(4) NOT NULL,
    carpoint VARCHAR(8) NOT NULL,
    rdate 	DATE NOT NULL,                    -- 등록일
    category VARCHAR(40) NOT NULL
);


CREATE TABLE caroption (
bluetooth char(4), -- 블루투스
rear_sensor char(4), -- 후방센서
rear_camera char(5), -- 후방카메라
black_box char(4), -- 블랙박스
heated_seat char(4),  -- 열선시트
heated_handle char(4), -- 열선핸들
ventilated_seat char(4), -- 통풍시트
navigation char(5), -- 네비게이션
non_smoking_vehicle char(4), -- 금연차량
smart_key char(4), -- 스마트키
sunroof char(3), -- 선루프
rear_warning_light char(5), -- 후방경고등
Lane_Departure_Prevention char(6), -- 차선방지이탈
     carnumber VARCHAR(8),
    FOREIGN KEY (carnumber)
        REFERENCES carinfo (carnumber)
);