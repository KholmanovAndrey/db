create table users(
	id SERIAL primary key,
	email VARCHAR(120) unique,
	password_hash VARCHAR(100)
) comment = '������������' ENGINE=InnoDB;

create table profiles(
	user_id SERIAL primary key,
	firstname VARCHAR(100) comment '���',
	lastname VARCHAR(100) comment '�������',
	phone VARCHAR(20),
	address VARCHAR(100),
	created_at DATETIME default current_timestamp,
	updated_at DATETIME default current_timestamp on update current_timestamp,
	index (firstname, lastname),
	foreign key (user_id) references users(id)
) comment = '������� ������������' ENGINE=InnoDB;

create table books(
	id SERIAL primary key,
	name VARCHAR(255) comment '�������� �����',
	description TEXT comment '�������� �����',
	price DECIMAL(11,2) comment '���� �����',
	poster VARCHAR(50) comment '�������� �����',
	created_at DATETIME default current_timestamp,
	updated_at DATETIME default current_timestamp on update current_timestamp,
	INDEX (name),
	INDEX (price)
) comment = '�����' ENGINE=InnoDB;

create table writers(
	id SERIAL primary key,
	name VARCHAR(255) comment '�������� ������',
	description TEXT comment '�������� ������',
	poster VARCHAR(50) comment '���������� ������',
	INDEX (name)
) comment = '��������' ENGINE=InnoDB;

create table books_writers(
	book_id BIGINT unsigned not null,
	writer_id BIGINT unsigned not null,
	primary key (book_id, writer_id),
	foreign key (book_id) references books(id),
	foreign key (writer_id) references writers(id)
) comment = '����� ����� � ���������' ENGINE=InnoDB;

create table series(
	id SERIAL primary key,
	name VARCHAR(255) comment '�������� ����� ����',
	description TEXT comment '�������� ����� ����',
	poster VARCHAR(50) comment '�������� ����� ����',
	INDEX (name)
) comment = '���� ����' ENGINE=InnoDB;

create table books_series(
	book_id BIGINT unsigned not null,
	series_id BIGINT unsigned not null,
	primary key (book_id, series_id),
	foreign key (book_id) references books(id),
	foreign key (series_id) references series(id)
) comment = '����� ����� � ������' ENGINE=InnoDB;

create table genres(
	id SERIAL primary key,
	name VARCHAR(255) comment '�������� �����',
	description TEXT comment '�������� �����',
	INDEX (name)
) comment = '�����' ENGINE=InnoDB;

create table books_genres(
	book_id BIGINT unsigned not null,
	genre_id BIGINT unsigned not null,
	primary key (book_id, genre_id),
	foreign key (book_id) references books(id),
	foreign key (genre_id) references genres(id)
) comment = '����� ����� � ������' ENGINE=InnoDB;

create table orders(
	id SERIAL primary key,
	user_id BIGINT unsigned not null,
	created_at DATETIME default current_timestamp,
	updated_at DATETIME default current_timestamp on update current_timestamp,
	foreign key (user_id) references users(id)
) comment = '������' ENGINE=InnoDB;

create table orders_books(
	id SERIAL primary key,
	order_id BIGINT unsigned not null,
	book_id BIGINT unsigned not null,
	total INT unsigned default 1 comment '���������� ���������� �������� �������',
	created_at DATETIME default current_timestamp,
	updated_at DATETIME default current_timestamp on update current_timestamp,
	foreign key (order_id) references orders(id),
	foreign key (book_id) references books(id)
) comment = '������ ������' ENGINE=InnoDB;

create table ratings(
	id SERIAL primary key,
	user_id BIGINT unsigned not null,
	book_id BIGINT unsigned not null,
	total INT unsigned default 0 comment '������ �����, �� ��������� 0 (0 - � ������ �� ���������)',
	created_at DATETIME default current_timestamp,
	index (total),
	foreign key (user_id) references users(id),
	foreign key (book_id) references books(id)
) comment = '������� �����' ENGINE=InnoDB;


