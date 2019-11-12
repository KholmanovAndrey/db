use vk;

insert into users (id, firstname, lastname, email, phone)
values (1, 'Andrei', 'Kholmanov', 'ashjas@mail.ru', '45784534');

insert into users (id, firstname, lastname, email, phone)
values 
	(1, 'Andrei', 'Kholmanov', 'ashjas1@mail.ru', '45784534'),
	(2, 'Andrei', 'Kholmanov', 'ashjas2@mail.ru', '45784534'),
	(3, 'Andrei', 'Kholmanov', 'ashjas3@mail.ru', '45784534')
;

insert into users
set
	firstname = 'Alex',
	lastname = 'Popov',
	email = 'popov@mail.ru'
;

insert into users
	(id, firstname, lastname, email, phone)
select
	id, firstname, lastname, email, phone
from vk2.users
where id = 100;


insert into users
	(id, firstname, lastname, email, phone)
select
	3, 'Andrei', 'Kholmanov', 'ashjas3@mail.ru', '45784534'
;


select distinct
	firstname
from users;

select * from users;

select * from users
limit 2 offset 2;

select * from users
where id in (2,5);

select * from litres.profiles
where year(birthday) in (1990, 1980, 2000);

update vk.freind_requests
set 
	status = 'approved'
where
	intiator_user_id = 1
	and target_user_id = 2
;
