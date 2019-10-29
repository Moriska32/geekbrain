SELECT id, firstname, lastname, email, phone,created_at,updated_at
FROM vk.users limit 100;



--ѕусть в таблице users пол€ created_at и updated_at оказались незаполненными. «аполните их текущими датой и временем.
ALTER TABLE vk.users 
     ADD created_at datetime DEFAULT NULL;
     
    
    
ALTER TABLE vk.users 
     ADD updated_at datetime DEFAULT NULL;
     
    
update vk.users set created_at = NOW(), updated_at = NOW();


--“аблица users была неудачно спроектирована. «аписи created_at и updated_at были заданы типом VARCHAR и в них долгое врем€ помещались значени€ в формате "20.10.2017 8:10". Ќеобходимо преобразовать пол€ к типу DATETIME, сохранив введеные ранее значени€.

UPDATE vk.users
SET created_at = str_to_date(created_at`, '%d-%m-%Y' ),updated_at = str_to_date(updated_at, '%d-%m-%Y' );

--(по желанию) »з таблицы users необходимо извлечь пользователей, родившихс€ в августе и мае. ћес€цы заданы в виде списка английских названий ('may', 'august')
select firstname, lastname from vk.users 
where users.id in  
(select user_id from vk.profiles where monthname(birthday) = "May" or monthname(birthday) = "April");

--ѕодсчитайте средний возраст пользователей в таблице users
select avg((select TIMESTAMPDIFF(YEAR, birthday, NOW()) from vk.profiles where user_id = users.id)) as age from vk.users;


-- ѕодсчитайте количество дней рождени€, которые приход€тс€ на каждый из дней недели. —ледует учесть, что необходимы дни недели текущего года, а не года рождени€.

select weekday(birthday) as week, count(birthday) from vk.profiles group by week;
