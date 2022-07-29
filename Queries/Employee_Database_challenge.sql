select e.emp_no, 
e.first_name, 
e.last_name,
t.title, 
t.from_date,
t.to_date
into retirement_titles
from employees as e
join titles as t
on (e.emp_no = t.emp_no)
where (birth_date between '1952-01-01' and '1955-12-31')
order by emp_no;

-- Use Distinct with Orderby to remove duplicate rows
select distinct on (emp_no) emp_no,
first_name,
last_name,
title
into unique_titles
from retirement_titles
where to_date = '9999-01-01'
order by emp_no, to_date desc;

--Retiring Titles
select count(title), title
into retiring_titles
from unique_titles
group by title
order by count(title) desc;

--Mentorship Eligibility
select distinct on (e.emp_no) e.emp_no, 
e.first_name, 
e.last_name, 
e.birth_date,
d.from_date,
d.to_date,
t.title
into mentorship_eligibility
from employees as e
join dept_emp as d
on (e.emp_no = d.emp_no)
join titles as t
on (e.emp_no = t.emp_no)
where d.to_date = '9999-01-01'
and (e.birth_date between '1965-01-01' and '1965-12-31')
order by emp_no;