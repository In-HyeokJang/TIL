use webtest;
 
create table reply(
   rnum int not null auto_increment primary key,
   content varchar(500) not null,
   regdate date not null,
   id varchar(10) not null,
   bbsno int(7) not null,
   foreign key(bbsno) references bbs(bbsno)
);
 
select * from bbs;
 
insert into reply(content, regdate, id, bbsno)
values('의견입니다.3',sysdate(),'user1',4);

select * from bbs;
 
select nvl(max(rnum),0)+1 from reply;
 
insert into reply(rnum, content, regdate, id, bbsno)
values((select nvl(max(rnum),0)+1 from reply),
'의견입니다.',sysdate,'user1',1
) ;
 
 
-- list(목록)
select rnum, content, regdate, id, bbsno
from REPLY
where bbsno = 4
order by rnum DESC
limit 0, 3;
 
 
-- total(목록)
select count(*) from reply
where bbsno = 34;