-- 현재 근무하고 있는 여직원의 이름과 직책을 직원 이름 순으로 출력하세요.
  select a.first_name, b.title
    from employees a, titles b    -- table a와 b를 병합한다는 의미. 함부로 했다가 서버 마비됨..! 조심!!
   where a.emp_no = b.emp_no      -- join condition (equijoin) 두 테이블을 붙이는 조건
     and b.to_date = '9999-01-01' -- select condition
     and a.gender = 'F'           -- select condition
order by a.first_name;
   
-- 부서별로 현재 직책이 Engineer인 직원들에 대해서만 평균 급여를 구하세요.
  select a.dept_no, d.dept_name, avg(b.salary) as avg_salary
    from dept_emp a, salaries b, titles c, departments d
   where a.emp_no = b.emp_no        -- join condition
     and b.emp_no = c.emp_no        -- join condition
     and a.dept_no = d.dept_no      -- join condition
     
     and a.to_date = '9999-01-01'   -- select condition (현재 근무 중)
     and b.to_date = '9999-01-01'   -- select condition (현재 근무 중)
     and c.to_date = '9999-01-01'   -- select condition (현재 근무 중)
     and c.title = 'Engineer'
group by a.dept_no
order by avg_salary desc;

-- 현재 직책별로 급여의 총합을 구하되, Engineer 직책은 제외 하세요.
-- 단, 총 합이 2,000,000,000 이상인 직책만 나타내며 급여의 총합에 대해서는 내림차순으로 정렬하세요(DESC)
  select b.title, sum(a.salary)
	from salaries a, titles b
   where a.emp_no = b.emp_no       -- join condition
	 and a.to_date = '9999-01-01'  -- select condition
	 and b.to_date = '9999-01-01'  -- select condition
	 and b.title != 'Engineer'     -- select condition
  having sum(a.salary) > 2000000000  -- select condition
order by sum(a.salary) desc;

--
-- ANSI / ISO SQL 1999 JOIN 문법
--

-- join ~ on
-- 현재 근무하고 있는 여직원의 이름과 직책을 직원 이름 순으로 출력하세요.
  select a.first_name, b.title
    from employees a
    join titles b
      on a.emp_no = b.emp_no      -- join condition
   where b.to_date = '9999-01-01' -- select condition
     and a.gender = 'F'           -- select condition
order by a.first_name;

-- natural join
      select a.first_name, b.title
        from employees a
natural join titles b                 -- 같은 칼럼을 자동으로 join함. 따로 join condition 필요없긴하지만
									  -- join조건으로 걸리면 안되는 항목까지 join되는 것이 단점!!
                                      -- (여기에서는 겹치는 주키가 emp_no밖에 없어서 문제가 되지 않음)
       where b.to_date = '9999-01-01' -- select condition
         and a.gender = 'F'           -- select condition
    order by a.first_name;			

-- natural join 단점 확인
-- titles와 salaries 조인하기 (주키가 2개 겹침 - emp_no, from_date) 
-- count(*)결과값_" join ~ on 일 때 " : 240124
select count(*)
  from titles a
  join salaries b
    on a.emp_no = b.emp_no  -- join condition (직원이 같은 사람)
 where a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01';

-- count(*)결과값_" natural join 일 때 " : 4
select count(*)
  from titles a
natural join salaries b  -- join condition이 따로 없기때문에, emp_num과 from_date가 같은 사람만 걸러짐
 where a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01';
   
-- count(*)결과값_" join  ~ using 일 때 " : 240124 (join ~ in과 동일함)
select count(*)
  from titles a
  join salaries b
 using (emp_no)   -- join condition
 where a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01';

-- outer join

-- 1. 테스트 데이터 넣기
-- insert into dept values(null, '총무'); 
-- insert into dept values(null, '개발'); 
-- insert into dept values(null, '영업'); 

-- insert into emp values(null, '둘리', 2);
-- insert into emp values(null, '마이콜', 3);
-- insert into emp values(null, '또치', 2);
-- insert into emp values(null, '도우넛', 3);
-- insert into emp values(null, '길동', null);

-- 현재 회사의 직원의 이름과 부서이름을 출력하세요.
select a.name, b.name
  from emp a
  join dept b
    on a.dept_no = b.no;
    
    

 