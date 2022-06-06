-- 게시물의 번호를 일괄적으로 주기위한 시퀀스 생성
DROP SEQUENCE BOARD_SEQ;
CREATE SEQUENCE BOARD_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 10000
NOCYCLE;


-- 게시물 테이블
DROP TABLE BOARD;
CREATE TABLE BOARD (
	NUM NUMBER(20),       -- 게시번호 (BOARD_SEQ를 이용해서 일괄 생성)
	NAME VARCHAR(50),     -- 게시자 이름
	SUBJECT VARCHAR(50),  -- 제목
	CONTENT VARCHAR(200), -- 본문 내용
	POS NUMBER(10),       -- 게시물의 상대적인 위치 값 저장 (화면에 순서대로 뿌려주는 역할)
	REF NUMBER(10),      -- 답변 글일 경우 소속된 부모 글을 가리키는 번호
	DEPTH NUMBER(10),     -- 답변 글일 경우 답변의 깊이를 저장
	REGDATE DATE,     -- 작성된 날짜 저장
	PASS VARCHAR(15), -- 작성자의 패스워드 저장
	IP   VARCHAR(15), -- 저장할 때 작성자의 IP주소 저장
	COUNT NUMBER(10), -- 게시물의 조회수 저장
	FILENAME VARCHAR(30), -- 업로드된 파일 이름 저장
	FILESIZE NUMBER(20),  -- 업로드된 파일 크기 저장
	PRIMARY KEY(NUM)
);

SELECT * FROM BOARD;

