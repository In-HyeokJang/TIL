-- DDL
use webtest;
drop table if exists notice;
CREATE TABLE notice(
  noticeno      INT                        NOT NULL AUTO_INCREMENT COMMENT '글 번호',
  title             VARCHAR(300)         NOT NULL COMMENT '제목',
  content       TEXT                       NOT NULL COMMENT '내용',
  wname        VARCHAR (20)           NOT NULL COMMENT '작성자',
  passwd        VARCHAR (20)           NULL COMMENT '패스워드',
  cnt             SMALLINT                 NOT NULL DEFAULT '0' COMMENT '조회수',
  rdate          DATETIME                  NOT NULL COMMENT '등록일',
  PRIMARY KEY (noticeno)  
);

-- 등록
INSERT INTO notice(title, content, wname, passwd, cnt, rdate)
VALUES('spring 시즌 접수 안내 1', '10% 할인 실시!', '왕눈이', '1234', 0, NOW());
INSERT INTO notice(title, content, wname, passwd, cnt, rdate)
VALUES('spring 시즌 접수 안내 2', '10% 할인 실시!', '아로미', '1234', 0, NOW());
INSERT INTO notice(title, content, wname, passwd, cnt, rdate)
VALUES('spring 시즌 접수 안내 3', '10% 할인 실시!', '투투투', '1234', 0, now());
-- 목록
SELECT noticeno, title, content, wname, passwd, cnt, rdate
FROM notice
ORDER BY noticeno DESC;
-- 조회
SELECT noticeno, title, content, wname, passwd, cnt, rdate
FROM notice
WHERE noticeno=1;
-- 조회수증가
UPDATE notice
SET cnt = cnt + 1
WHERE noticeno=1;
-- 수정
UPDATE notice
SET title='추가 공지', content='5% 추가 할인!', wname='아로미'
WHERE noticeno=1;
-- 패스워드 확인
SELECT COUNT(*) AS cnt
FROM notice
WHERE noticeno=1 AND passwd='1234';
-- 삭제
DELETE FROM notice
WHERE noticeno=3;
 
SELECT * FROM notice;