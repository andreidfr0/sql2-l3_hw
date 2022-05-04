-- Практическое задание
--   База данных «Страны и города мира»:
--   1. Сделать запрос, в котором мы выберем все данные о городе – регион, страна.
--   2. Выбрать все города из Московской области.
--   База данных «Сотрудники»:
--   1. Выбрать среднюю зарплату по отделам.
--   2. Выбрать максимальную зарплату у сотрудника.
--   3. Удалить одного сотрудника, у которого максимальная зарплата.
--   4. Посчитать количество сотрудников во всех отделах.
--   5. Найти количество сотрудников в отделах и посмотреть, сколько всего денег получает отдел.

use geodata;

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
limit 10000;