CREATE TABLE IF NOT EXISTS `webtest`.`category` (
  `cateno` INT NOT NULL AUTO_INCREMENT, -- 분류번호
  `catename` VARCHAR(50) NOT NULL,      -- 분류명
  `categrpno` INT NULL, -- 상위번호
  PRIMARY KEY (`cateno`),
  FOREIGN KEY (`categrpno`) REFERENCES category(`cateno`)
);
 
 use webtest;
 
insert into category(catename, categrpno)
values('Jean', null);
insert into category(catename, categrpno)
values('Bag', null);
insert into category(catename, categrpno)
values('Shoes', null);
        
select cateno, catename
from category
where categrpno is null;