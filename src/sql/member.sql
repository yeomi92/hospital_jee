SELECT * FROM tab;
CREATE TABLE Member(
	id VARCHAR2(10) PRIMARY KEY,
	name VARCHAR2(10),
	ssn VARCHAR2(10),
	password VARCHAR2(10),
	profileImg VARCHAR2(20),
	phone VARCHAR2(13),
	email VARCHAR2(20),
	rank VARCHAR2(2)
);
INSERT INTO Member(id,name,ssn,password,profileImg,phone,email,rank)
VALUES('hong','ȫ�浿','800101-1','1','default.jpg','010-1234-5678','hong@test.com','C');
SELECT * FROM Member;
UPDATE MEMBER SET name='������' WHERE id='yeom';