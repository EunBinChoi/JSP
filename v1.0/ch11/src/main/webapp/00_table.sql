DROP TABLE tblMember;

CREATE TABLE tblMember(
	id VARCHAR(20) NOT NULL,
	pwd VARCHAR(20) NOT NULL,
	name VARCHAR(20)  NOT NULL,
	gender VARCHAR(1) NOT NULL,
	birthday VARCHAR(6) NOT NULL,
	email VARCHAR(30) NOT NULL,
	zipcode VARCHAR(5) NOT NULL,
	address VARCHAR(60)  NOT NULL,
	hobby VARCHAR(5)  NOT NULL,
	job VARCHAR(30) NOT NULL,
	PRIMARY KEY (id)
);

INSERT INTO tblMember
VALUES ('admin', '1234', 'eunbin',
'1', '901234', 'qwe@gmail.com',
'1234', 'seoul', '00000', 'lecturer');

select * from tblMember;


DROP TABLE tblZipcode;

CREATE TABLE tblZipcode(
  zipcode char(5) NOT NULL,
  -- ��
  area1 char(50) DEFAULT NULL,
  -- ��
  area2 char(50) DEFAULT NULL,
  -- ��
  area3 char(50) DEFAULT NULL
);


insert into tblZipcode values ('06133','����Ư����','������','�������');
insert into tblZipcode values ('06307','����Ư����','������','������');
insert into tblZipcode values ('06361','����Ư����','������','�����');
insert into tblZipcode values ('06327','����Ư����','������','������');
insert into tblZipcode values ('06027','����Ư����','������','�б�����');
insert into tblZipcode values ('05264','����Ư����','������','�ø��ȷ�');
insert into tblZipcode values ('08384','����Ư����','���α�','���ε���');
insert into tblZipcode values ('08264','����Ư����','���α�','���Ϸ�');
insert into tblZipcode values ('08596','����Ư����','��õ��','���ɷ�');
insert into tblZipcode values ('01691','����Ư����','�����','����');
insert into tblZipcode values ('06960','����Ư����','���۱�','�����');
insert into tblZipcode values ('06936','����Ư����','���۱�','��¹���');
insert into tblZipcode values ('02446','����Ư����','���빮��','�̹���');
insert into tblZipcode values ('04386','����Ư����','��걸','�Ѱ����');



COMMIT