use litres;

-- СТРАНИЦА КНИГ - ВЫВОД ВСЕХ КНИГ С ПОСТРАНИЧНОЙ НАВИГАЦИЕЙ
-- ЗАПРОС все книги с постраничной навигацией
select 
	b.*,
	GROUP_CONCAT(distinct w.name order by w.name asc separator ",") as writers,
	GROUP_CONCAT(distinct g.name order by g.name asc separator ",") as genres,
	GROUP_CONCAT(distinct s.name order by s.name asc separator ",") as series
from books as b
left outer join books_writers as bw on b.id = bw.book_id
left outer join writers as w on bw.writer_id = w.id
left outer join books_genres as bg on b.id = bg.book_id
left outer join genres as g on bg.genre_id = g.id
left outer join books_series as bs on b.id = bs.book_id
left outer join series as s on bs.series_id = s.id
group by b.id
limit 10 offset 0;

-- СТРАНИЦА КНИГИ - ВЫВОД КОНКРЕТНОЙ КНИГИ
-- ЗАПРОС на книгу с выводом в строку все: жанры, циклы, авторы через представления
select * from v_books where id = 2;

-- ЗАПРОС на циклы книги
select
	*
from series s
join books_series bs
on s.id = bs.series_id
where bs.book_id = 1;
-- ЗАПРОС на писателей книги
select
	*
from writers s
join books_writers bw
on s.id = bw.writer_id
where bw.book_id = 1;
-- ЗАПРОС на жанры книги
select
	*
from genres s
join books_genres bg
on s.id = bg.genre_id
where bg.book_id = 1;
-- ЗАПРОС на случайные другие книги
select 
	*
from books b
order by RAND() 
limit 5;

-- СТРАНИЦА ПИСАТЕЛЕЙ - ВЫВОД ВСЕХ ПИСАТЕЛЕЙ С ПОСТРАНИЧНОЙ НАВИГАЦИЕЙ
-- ЗАПРОС на всех писателей
select * from writers
limit 10 offset 0;

-- СТРАНИЦА ПЕСАТЕЛЯ - ВЫВОД КОНКРЕТНОГО ПИСАТЕЛЯ
-- ЗАПРОС на пасателя
select * from writers where id = 1;
-- ЗАПРОС на книги писателя
select * from books b
join books_writers bw
on b.id = bw.book_id
where bw.writer_id = 1;

-- СТРАНИЦА ЖАНРЫ - ВЫВОД ВСЕХ ЖАНРОВ
-- ЗАПРОС на все жанры с количеством книг в них
select 
	g.*,
	count(*) as count_books
from genres g
join books_genres bg
on g.id = bg.genre_id
group by bg.genre_id
;

-- СТРАНИЦА ЖАНР - ВЫВОД КОНКРЕТНОГО ЖАНРА
-- ЗАПРОС на жанр
select * from writers where id = 2;
-- ЗАПРОС на книги жанра
select * from books b
join books_genres bg
on b.id = bg.book_id
where bg.genre_id = 2
limit 10 offset 0;

-- СТРАНИЦА ЦИКЛОВ КНИГ - ВЫВОД ВСЕХ ЦИКЛОВ С ПОСТРАНИЧНОЙ НАВИГАЦИЕЙ
-- ЗАПРОС на все циклы с количеством книг в них с постраничной навигацией
select 
	s.*,
	count(*) as count_books
from series s
join books_series bs
on s.id = bs.series_id
group by bs.series_id
order by s.id
limit 10 offset 0;

-- СТРАНИЦА ЦИКЛА - ВЫВОД КОНКРЕТНОГО ЦИКЛА
-- ЗАПРОС на цикл с количеством книг
select 
	s.*,
	count(*) as count_books
from series s
join books_series bs
on s.id = bs.series_id
group by bs.series_id
having bs.series_id = 1;
-- ЗАПРОС на книги цикла 1, с указанием цикла
select
	b.*,
	bs.series_id,
	(select name from series where bs.series_id = id) as series
from books b
join books_series bs
on b.id = bs.book_id
where bs.series_id = 1;