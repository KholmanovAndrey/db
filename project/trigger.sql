delimiter $$
create trigger 'check_user_age_before_update'
before update
on profiles for each row
begin
	if new.birthday >= current_date() then
		signal sqlstate '45000' set message_text = 'Неправильная дата';
	end if;
end $$
delimiter ;