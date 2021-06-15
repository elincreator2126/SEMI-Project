semiproject.sql 

select * from c_emp;

-- board 테이블 -번호 제목 내용 작성자 작성시간 글암호 조회수
--member 테이블 - id, password, name
create table member(
id varchar2(30) constraint member_id_pk primary key,
password number(10),
name varchar2(30)
);

insert into member values('semi', 1111, '프로젝트');
insert into member values('oracle', 1111, '김회원');
insert into member values('java', 1111, '박신입');
insert into member values('spring', 1111, '홍회원');
insert into member values('jdbc', 1111, '최회원');
insert into member values('python', 1111, '이회원');

select * from member;

create table board(
seq number(5) constraint board_seq_pk primary key,
title varchar2(200) constraint board_title_nn not null,
contents varchar2(4000),
writer varchar2(30) constraint board_writer_fk references member(id),
time date default sysdate,
password number(4),
viewcount number(5)
);

/*시퀸스 생성*/
CREATE SEQUENCE BOARD_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 10000
NOCYCLE

insert into board (seq, title, contents, writer, password, viewcount) values(board_seq.nextval,'제목', '내용', 'semi', 1234, 0)
insert into board (seq, title, contents, writer, password, viewcount) values(board_seq.nextval,'안녕하세요', '세미프로젝트입니다', 'semi', 2222, 0)