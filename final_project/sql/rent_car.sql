use rent_car;

create table category(
carno int not null auto_increment,
catename varchar(50), 		
cargrpno int null,
primary key(carno),
foreign key(cargrpno) references category(carno)
);

insert into category(catename, cargrpno)
values('소형', null);
insert into category(catename, cargrpno)
values('중형', null);
insert into category(catename, cargrpno)
values('대형', null);
insert into category(catename, cargrpno)
values('SUV', null);

use rent_car;

select carno, catename
from category
where cargrpno is null;

----------------------------------

create table carinfo(
carinfono int not null auto_increment, -- 차정보번호
carno int null,			 -- 차분류번호
carname varchar(50) not null, 	-- 차이름
filename varchar(50) not null, 	-- 차사진
cardetail longtext not null,    	-- 상세내용
carpoint varchar(50) not null,  	-- 차 위치 (지점)
rdate date not null, 		-- 등록일
primary key (carinfono),
foreign key (carno) references category (carno)
);

insert into carinfo
(carno, carname, filename, cardetail, carpoint, rdate)
values(1, 'morning', 'morning.jpg', '소형차 모닝, 4인승', '서울 마포구', sysdate());
insert into carinfo
(carno, carname, filename, cardetail, carpoint, rdate)
values(2, 'g70', 'g70.jpg', '중형차g70, 5인승, 세단', '서울 동작구', sysdate());
insert into carinfo
(carno, carname, filename, cardetail, carpoint, rdate)
values(3, 'g90', 'g90.jpg', '대형차 g90, 5인승, 세단', ' 서울 강남구' , sysdate());
insert into carinfo
(carno, carname, filename, cardetail, carpoint, rdate)
values(4, 'IONIQ5', 'IONIQ5.jsp', 'SUV IONIQ5, 5인승', '서울 성동구' ,sysdate());
use rent_car;

insert into carinfo
(carno, carname, filename, cardetail, carpoint, rdate)
values(3, '스타렉스', '스타렉스.jsp', '승합차, 5인승', '서울 성동구' ,sysdate());


select carinfono, carno, carname, filename, carpoint, cardetail, rdate
from carinfo;

update carinfo
set detail = '소형차 모닝, 4인승, 범퍼기스, 에어컨 고장'
where carinfono = 1;

delete from carinfo
where carinfono = 3;

select carinfono, carno, carname, filename, carpoint, cardetail
from carinfo
where carinfono = 1;

update carinfo
set carpoint = '서울 화곡동'
where carinfono = 1;

delete from carinfo
where carinfono =1;

select carinfono, carno, carname, filename, carpoint
from carinfo
order by carinfono desc
limit 0,12;

select a.carno, a.catename, b.carname, b.filename, b.cardetail, b.carpoint, b.rdate
from category a
join carinfo b
on a.carno = b.carno;

-------------------------------------------------------
-- 이거 수정 필요
-- carno -> carinfono로 수정 해야함 
use rent_car;
drop table carcondition;
create table carcondition(
		carinfono int not null primary key,
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
        foreign key (carinfono) references carinfo (carinfono)
);

insert into carcondition(carinfono, wheel, windows, bumper, sideMirror, cardoor, airconditioner, safetyBelt, bluetooth, rearSensor, rearCamera, sunroof, blackbox,chargeState)
values(1, '좋음','좋음','좋음','좋음','좋음','있다', '없다', '없다', '없다', '없다', '없다', '없다','3');
insert into carcondition(carinfono, wheel, windows, bumper, sideMirror, cardoor, airconditioner, safetyBelt, bluetooth, rearSensor, rearCamera, sunroof, blackbox,chargeState)
values(6, '좋음','좋음','좋음','좋음','좋음','있다', '없다', '없다', '없다', '없다', '없다', '없다','3');

select * from category left join carinfo 
on category.carno = carinfo.carno 
join carcondition on category.carno = carcondition.carno;


-- 3개 조인
select a.catename, b.carname, b.filename, b.cardetail, b.carpoint, b.rdate,
c.wheel, c.windows, c.bumper, c.sideMirror, c.cardoor, c.airconditioner, c.safetyBelt, 
c.bluetooth, c.rearSensor, c.rearCamera, c.sunroof, c.blackbox, c.chargeState
from category a
left join carinfo b
on a.carno = b.carno
join carcondition c
on b.carinfono = c.carinfono;