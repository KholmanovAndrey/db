drop database if exists vk;
create database vk;
use vk;

drop table if exists users;
create table users(
	id SERIAL primary key,
	firstname VARCHAR(100) comment 'Имя',
	lastname VARCHAR(100) comment 'Фамилия',
	email VARCHAR(120) unique,
	password_hash VARCHAR(100),
	phone VARCHAR(20),
	index (phone),
	index (firstname, lastname)
);

drop table if exists profiles;
create table profiles(
	user_id SERIAL primary key,
	gender CHAR(1),
	bithday DATE,
	photo_id BIGINT unsigned null,
	hometown VARCHAR(100),
	created_at DATETIME default current_timestamp,
	updated_at DATETIME default current_timestamp on update current_timestamp
);

alter table profiles
add constraint fk_user_id
foreign key (user_id) references users(id)
on update cascade
on delete restrict
;

drop table if exists messages;
create table messages(
	id SERIAL primary key,
	from_user_id BIGINT unsigned not null,
	to_user_id BIGINT unsigned not null,
	body TEXT,
	created_at DATETIME default now(),
	index (from_user_id),
	index (to_user_id),
	foreign key (from_user_id) references users(id),
	foreign key (to_user_id) references users(id)
);

drop table if exists freind_requests;
create table freind_requests(
	intiator_user_id BIGINT unsigned not null,
	target_user_id BIGINT unsigned not null,
	status ENUM('requested', 'approved', 'declined', 'unfriened'),
	requested_at DATETIME default now(),
	updated_at DATETIME default current_timestamp on update current_timestamp,
	primary key (intiator_user_id, target_user_id),
	index (intiator_user_id),
	index (target_user_id),
	foreign key (intiator_user_id) references users(id),
	foreign key (target_user_id) references users(id)
);

drop table if exists communities;
create table communities(
	id SERIAL primary key,
	name VARCHAR(150),
	index (name)
);

drop table if exists users_communities;
create table users_communities(
	user_id BIGINT unsigned not null,
	community_id BIGINT unsigned not null,
	primary key (user_id, community_id),
	foreign key (user_id) references users(id),
	foreign key (community_id) references communities(id)
);

drop table if exists media_types;
create table media_types(
	id SERIAL primary key,
	name VARCHAR(150)
);

drop table if exists media;
create table media(
	id SERIAL primary key,
	media_type_id BIGINT unsigned not null,
	user_id BIGINT unsigned not null,
	body TEXT,
	filename VARCHAR(255),
	`size` INT,
	metadata JSON,
	created_at DATETIME default current_timestamp,
	updated_at DATETIME default current_timestamp on update current_timestamp,
	index(user_id),
	foreign key (user_id) references users(id),
	foreign key (media_type_id) references media_types(id)
);

drop table if exists likes;
create table likes(
	id SERIAL primary key,
	user_id BIGINT unsigned not null,
	created_at DATETIME default current_timestamp,
	foreign key (user_id) references users(id)
);

drop table if exists likes_types;
create table likes_types(
	like_id SERIAL primary key,
	likes_type ENUM('media', 'user', 'post'),
	element_id BIGINT unsigned not null,
	foreign key (like_id) references likes(id)
);

drop table if exists photo_albums;
create table photo_albums(
	id SERIAL primary key,
	user_id BIGINT unsigned not null,
	name VARCHAR(150),
	foreign key (user_id) references users(id)
);

drop table if exists photos;
create table photos(
	id SERIAL primary key,
	album_id BIGINT unsigned not null,
	media_id BIGINT unsigned not null,
	foreign key (album_id) references photo_albums(id),
	foreign key (media_id) references media(id)
);

alter table profiles
add constraint fk_media_id
foreign key (photo_id) references media(id)
on update cascade
on delete restrict
;
