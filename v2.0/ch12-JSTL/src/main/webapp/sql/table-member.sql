drop table member;
create table member (
	id varchar(20),
	pass varchar(20),
	primary key(id)
);

insert into member values ('admin', '1234');
select id, pass from member;
commit