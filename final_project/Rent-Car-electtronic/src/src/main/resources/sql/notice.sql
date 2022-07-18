use teamproject;
select * from notice

create database teamproject;
drop table projectNotice;
create table projectNotice(

noticeno int auto_increment primary key,
title varchar(300) not null,
wname varchar(30) not null,
content varchar(1000) not null,
passwd varchar(20),
wdate  date not null,
fname varchar(100) default "파일이 없습니다." not null

);

insert into projectNotice(title, wname, content, passwd, wdate)
values ('공지합니다', '관리자', '누구세요?', 1234, sysdate());

select * from projectNotice;
