create table users(
	id SERIAL primary key,
	email VARCHAR(120) unique,
	password_hash VARCHAR(100)
) comment = 'Пользователи' ENGINE=InnoDB;

create table profiles(
	user_id SERIAL primary key,
	firstname VARCHAR(100) comment 'Имя',
	lastname VARCHAR(100) comment 'Фамилия',
	phone VARCHAR(20),
	address VARCHAR(100),
	created_at DATETIME default current_timestamp,
	updated_at DATETIME default current_timestamp on update current_timestamp,
	index (firstname, lastname),
	foreign key (user_id) references users(id)
) comment = 'Профиль пользователя' ENGINE=InnoDB;

create table books(
	id SERIAL primary key,
	name VARCHAR(255) comment 'Название книги',
	description TEXT comment 'Описание книги',
	price DECIMAL(11,2) comment 'Цена книги',
	poster VARCHAR(50) comment 'Картинка книги',
	created_at DATETIME default current_timestamp,
	updated_at DATETIME default current_timestamp on update current_timestamp,
	INDEX (name),
	INDEX (price)
) comment = 'Книги' ENGINE=InnoDB;

create table writers(
	id SERIAL primary key,
	name VARCHAR(255) comment 'Название автора',
	description TEXT comment 'Описание автора',
	poster VARCHAR(50) comment 'Фотография автора',
	INDEX (name)
) comment = 'Писатели' ENGINE=InnoDB;

create table books_writers(
	book_id BIGINT unsigned not null,
	writer_id BIGINT unsigned not null,
	primary key (book_id, writer_id),
	foreign key (book_id) references books(id),
	foreign key (writer_id) references writers(id)
) comment = 'Связь книги с писателем' ENGINE=InnoDB;

create table series(
	id SERIAL primary key,
	name VARCHAR(255) comment 'Название серии книг',
	description TEXT comment 'Описание серии книг',
	poster VARCHAR(50) comment 'Картинка серии книг',
	INDEX (name)
) comment = 'Цикл книг' ENGINE=InnoDB;

create table books_series(
	book_id BIGINT unsigned not null,
	series_id BIGINT unsigned not null,
	primary key (book_id, series_id),
	foreign key (book_id) references books(id),
	foreign key (series_id) references series(id)
) comment = 'Связь книги с циклом' ENGINE=InnoDB;

create table genres(
	id SERIAL primary key,
	name VARCHAR(255) comment 'Название жанра',
	description TEXT comment 'Описание жанра',
	INDEX (name)
) comment = 'Жанры' ENGINE=InnoDB;

create table books_genres(
	book_id BIGINT unsigned not null,
	genre_id BIGINT unsigned not null,
	primary key (book_id, genre_id),
	foreign key (book_id) references books(id),
	foreign key (genre_id) references genres(id)
) comment = 'Связь книги с жанром' ENGINE=InnoDB;

create table orders(
	id SERIAL primary key,
	user_id BIGINT unsigned not null,
	created_at DATETIME default current_timestamp,
	updated_at DATETIME default current_timestamp on update current_timestamp,
	foreign key (user_id) references users(id)
) comment = 'Заказы' ENGINE=InnoDB;

create table orders_books(
	id SERIAL primary key,
	order_id BIGINT unsigned not null,
	book_id BIGINT unsigned not null,
	total INT unsigned default 1 comment 'Количество заказанных товарных позиций',
	created_at DATETIME default current_timestamp,
	updated_at DATETIME default current_timestamp on update current_timestamp,
	foreign key (order_id) references orders(id),
	foreign key (book_id) references books(id)
) comment = 'Состав заказа' ENGINE=InnoDB;

create table ratings(
	id SERIAL primary key,
	user_id BIGINT unsigned not null,
	book_id BIGINT unsigned not null,
	total INT unsigned default 0 comment 'Оценка книги, по умолчанию 0 (0 - в поиске не учитывать)',
	created_at DATETIME default current_timestamp,
	index (total),
	foreign key (user_id) references users(id),
	foreign key (book_id) references books(id)
) comment = 'Рейтинг книги' ENGINE=InnoDB;


