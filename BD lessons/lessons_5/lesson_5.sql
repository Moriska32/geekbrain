SELECT id, firstname, lastname, email, phone,created_at,updated_at
FROM vk.users limit 100;



--����� � ������� users ���� created_at � updated_at ��������� ��������������. ��������� �� �������� ����� � ��������.
ALTER TABLE vk.users 
     ADD created_at datetime DEFAULT NULL;
     
    
    
ALTER TABLE vk.users 
     ADD updated_at datetime DEFAULT NULL;
     
    
update vk.users set created_at = NOW(), updated_at = NOW();


--������� users ���� �������� ��������������. ������ created_at � updated_at ���� ������ ����� VARCHAR � � ��� ������ ����� ���������� �������� � ������� "20.10.2017 8:10". ���������� ������������� ���� � ���� DATETIME, �������� �������� ����� ��������.

UPDATE vk.users
SET created_at = str_to_date(created_at`, '%d-%m-%Y' ),updated_at = str_to_date(updated_at, '%d-%m-%Y' );

--(�� �������) �� ������� users ���������� ������� �������������, ���������� � ������� � ���. ������ ������ � ���� ������ ���������� �������� ('may', 'august')
select firstname, lastname from vk.users 
where users.id in  
(select user_id from vk.profiles where monthname(birthday) = "May" or monthname(birthday) = "April");

--����������� ������� ������� ������������� � ������� users
select avg((select TIMESTAMPDIFF(YEAR, birthday, NOW()) from vk.profiles where user_id = users.id)) as age from vk.users;


-- ����������� ���������� ���� ��������, ������� ���������� �� ������ �� ���� ������. ������� ������, ��� ���������� ��� ������ �������� ����, � �� ���� ��������.

select weekday(birthday) as week, count(birthday) from vk.profiles group by week;
