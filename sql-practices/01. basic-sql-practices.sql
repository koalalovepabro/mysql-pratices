-- pet table 생성
create table pets(
name varchar(20),
owner varchar(20),
species varchar(20),
gender char(1),
birth date,
death date
);

-- table scheme 확인
desc pets;

-- insert(C)
 insert
   into pets
 values('메리', 'dorothy', 'dog', 'm', '2010-12-25', null);
 
 insert
   into pets(owner, name, species, gender, birth)
 values('dorothy', '금동이', 'cat', 'm', '2015-01-01');

 insert
   into pets
 values('코코', 'dorothy', 'dog', 'f', '2012-12-25', '2021-03-30');

-- select(R)
select * from pets;

select name, birth from pets;

select name, birth from pets order by birth asc; -- 생년월일 오름차순

select count(*) from pets;
select count(*) from pets where death is not null;

-- update(U)
update pets
set species='monkey'
where name='금동이';

-- delete(D)
delete 
  from pets 
where death is not null; -- death값이 있는 행 삭제

show tables;
select * from pets;
