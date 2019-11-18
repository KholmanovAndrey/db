use litres;


-- при записи книги в базу, необходимо внести записи в writers и genres, т.к. книга без них не может быть
drop procedure if exists `sp_add_book`;
delimiter $$
create procedure sp_add_book(
	name varchar(255),
	description text,
	price decimal(11,2),
	poster varchar(50),
	writer_id bigint,
	series_id bigint,
	out tran_result varchar(200))
begin
	
	declare `_rollback` bool default 0;
	declare code varchar(100);
	declare error_string varchar(100);

	declare continue HANDLER for sqlexception
	begin
		set `_rollback` = 1;
	
		get stacked diagnostics condition 1
			code = RETURNED_SQLSTATE, error_string = MESSAGE_TEXT;
		
		set tran_result := concat('Error occured. Code: ', code, '. Text: ', error_string);
	end;
	
	start transaction;

		insert into books (name, description, price, poster)
		values (name, description, price, poster);
		
		insert into books_writers (book_id, writer_id)
		values 
			(last_insert_id(), writer_id);
		
		insert into books_series (book_id, series_id)
		values 
			(last_insert_id(), series_id);
		
		if `_rollback` then
			rollback;
		else
			set tran_result := 'ok';
			commit;
		end if;
end $$
delimiter ;

call sp_add_book('авровэ', 'dsfdsjhkf jsahd sadkj asdsa ds', '300.00', 'poster.jpg', 1, 1, @tran_result);

select @tran_result;