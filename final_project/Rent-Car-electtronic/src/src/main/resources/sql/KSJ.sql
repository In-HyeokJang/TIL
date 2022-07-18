use project;
drop table list;
drop table review;

create table list(
 listno int NOT NULL AUTO_INCREMENT COMMENT '글 번호',
  title varchar(300) NOT NULL COMMENT '제목',
  content text NOT NULL COMMENT '내용',
wname varchar(20) NOT NULL COMMENT '작성자',
  cnt smallint NOT NULL DEFAULT '0' COMMENT '조회수',
  rdate datetime NOT NULL COMMENT '등록일',
	primary KEY(listno)
    );

    -- create
		INSERT INTO list (title, content, wname, cnt,rdate)
        VALUES( "이게제목이지", "내용", "이름", 0, DATE(NOW()));

        select*from list;

        -- read

		SELECT listno,title, content, wname,cnt , rdate
        FROM list
        WHERE listno = 1;

        -- update
		update list
        set mname = "",
            title = "",
            content = ""
            where listno = 1;

        -- delete
        DELETE FROM list
        WHERE listno = 1;

        -- upAnsnum
		update list
        set ansnum =
        ansnum + 1
        where grpno = 1
        and ansnum > 0;


create table review(
rnum int NOT NULL AUTO_INCREMENT,
  content varchar(500) NOT NULL,
  regdate date NOT NULL,
  id     varchar(15) NOT NULL,
  listno int not null ,
  PRIMARY KEY (rnum),
  FOREIGN KEY (listno) REFERENCES list (listno)
    );

    -- create
	insert into review(content, regdate, id,listno)
    values("누구보다 빠르게 남들과는 다르게 색다르게 리듬을 타는 비트위에 나그네", sysdate(),"sss",  1);

    select *from review;


    -- read
	select * from review
    where rnum = 1;

    -- update
update review
set content = "예ㅂ압"
where rnum = 1
and id = "sss";


    -- delete
delete from review
where rnum = 1
and id = "sss";


