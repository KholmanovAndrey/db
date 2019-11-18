use litres;

CREATE OR REPLACE VIEW litres.v_books AS 

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

;
