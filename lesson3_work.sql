-- Практическое задание
--  1. База данных «Страны и города мира»:
--   1. Сделать запрос, в котором мы выберем все данные о городе – регион, страна.
--   2. Выбрать все города из Московской области.
--  2. База данных «Сотрудники»:
--   1. Выбрать среднюю зарплату по отделам.
--   2. Выбрать максимальную зарплату у сотрудника.
--   3. Удалить одного сотрудника, у которого максимальная зарплата.
--   4. Посчитать количество сотрудников во всех отделах.
--   5. Найти количество сотрудников в отделах и посмотреть, сколько всего денег получает отдел.

use geodata;
-- 1.1
select
 ci.id AS 'ID',
 ci.country_id AS 'country ID',
 ci.region_id AS 'region ID',
 ci.important AS ' is capital',
 ci.title AS city,
 co.title AS country,
 re.title AS region
from _cities ci
	left join _countries co ON ci.country_id = co.id
    left join _regions re ON ci.region_id = re.id
;

-- 1.2
select
 ci.*,
 re.title AS region
from _cities ci
    left join _regions re
        ON ci.region_id = re.id
where
	re.title like 'московская%'   
;
-- или так
select 	*
from _cities
where region_id =
		(
		select id
		from _regions
		where title like 'московская%'
            )
-- into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/out.log'
;
-- или так
select 	*
from _cities
where exists
		(
		select id
		from _regions
		where id = _cities.region_id and title like 'москов%'
            )
-- into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/out3.log'           
;

-- 2.1

