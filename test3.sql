Requirement meaning below
Write down Query that look up the animal most primary move into the animal protection center

-ORACLE
select name from (select * from animal_ins 
order by datetime)
where rownum = 1

-MYSQL
select name from animal_ins
order by datetime
limit 1



Requirement meaning below
What time the animal comes latest in the center

-ORACLE
select datetime as protecttime from (select * from animal_ins order by datetime desc)
where rownum = 1

-MYSQL
select max(datetime) from animal_ins
order by name desc
limit 1



Requirement meaning below
What time the animal comes earliest in the center

-ORACLE
select datetime as protecttime from (select * from animal_ins order by datetime asc)
where rownum = 1

-MYSQL
select min(datetime) from animal_ins
order by name asc
limit 1



Requirement meaning below

-ORACLE
select count(animal_type) count from animal_ins

-MYSQL
select count(animal_type = 'Dog') from animal_ins
where datetime
limit 4



Requirement meaning below
Query that how many animals comes and given protection in the center without duplicate count

-ORACLE
select count(distinct name) from (select name from animal_ins where name is not null)

-MYSQL
select count(distinct name) from animal_ins
where name is not null
order by name



Requirement meaning below
Query that how many dogs and cats given protection that accessed by their own name in the center

-ORACLE
select count(distinct name) from (select name from animal_ins where name is not null)

-MYSQL
select count(distinct name) from animal_ins
where name is not null
order by name


Requirement meaning below
Query that how many dogs and cats given protection in the center

-ORACLE
select animal_type, count(animal_id) from animal_ins
where animal_type in ('Dog', 'Cat')
group by animal_type
order by animal_type asc

-MYSQL
1. 
select animal_type, count(animal_id) from animal_ins
where animal_type in ('Dog', 'Cat')
group by animal_type
order by animal_type asc
2. 
select
case when ANIMAL_TYPE = 'Cat' then 'Cat'
when ANIMAL_TYPE = 'Dog' then 'Dog' end as 'ANIMAL_TYPE',
count(ANIMAL_TYPE)
from ANIMAL_INS
group by 1
order by ANIMAL_TYPE




Requirement meaning below
The query that measures the each names has been counted in the data

-ORACLE
1.
select name, count(name) from animal_ins
group by name
having count(name) > 1
order by name asc
2.
with new_table as 
(select name, count(name) as count from animal_ins
where name is not null group by name order by name asc)
select * from new_table
where count > 0
and name in ('Lucy', 'Raven')

-MYSQL
1. 
select name, count(name) from animal_ins
group by name
having count(name) >= 2
order by name asc

2.
with new_table as 
(select name, count(name) as count from animal_ins where name is not null group by name order by name)
select * from new_table
where count > 1
