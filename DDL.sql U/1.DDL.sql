
-- mariadb 서버에 터미널창에서 접속(db gui툴로 접속시에는 커넥션 객체 생성하여 연결)
mariadb -u root -p --엔터 후 비밀번호 별도 입력

-- 스키마 (database) 생성
crdate database board; (sql문부터 ;)

-- 스키마 삭제
drop database board;

-- 스키마 목록 조회
show databases;

-- 스키마 선택
use 스키마명;

--------여기까지 외우기

--DDL: 구조(DB,테이블)생성/변경/삭제 작업
create,alter,drop    (sql문= 대문자로 쓰는 것이 관례)
--DML: 데이터 생성/변경/조회/삭제
insert,updqte,select,delate


--문자 인코딩 세팅조회(외우기x) if 초반에 확인못하고 나중에 바꾸려하면 하나하나 바꿔야한다
show variables like 'character_set_server';

--문자인코딩 변경
alter database board default character set = utf8mb4

--테이블목록조회
show tables;

-- saq문은 대문자관례이고 시스템에서 대소문자를 구분하지는 않음.
-- 테이블명/컬럼명 등은 소문자가 관례이고, 대소문자 차이가 있다.

--테이블 생성
create table author(id int primary key, name varchar(255), email varchar(255), password varchar(255));   (CREATE TABLE 대문자가 관례가 관례)
pk: uniquk(고유), not null(공백x) 제약사항이 걸린다, 유일한 식별자


--테이블 컬럼정보 조회 (테이블 명 but관계성은 보기 힘들다)
describe author;

--테이블 데이터 전체 조회
select*from author;

--테이블 생성명령문 조회(안중요-수업목적)
show create table author;

--posts테이블 신규 생성(id, title, contents, author_id)
create table posts(id int, title varchar(255),contents varchar(255), author_id int, primary key(id), foreign key (author_id) references author(id));

//--테이블 삭제
//drop table posts;

--테이블 생성문 설명
1. 간단한 제약조건: 컬럼옆에 - not null
2. 복잡한 제약조건: 테이블 차원에 -fk

--테이블 제약조건 조회 (스키마까지 치고 들어가는 것.)
select*from information_schema.key_column_usage where table_name='posts';

--테이블 index 조회 (index: 목차,색인 -따로따로 조회가능)
show index from posts;


--alter: 테이블의 구조를 변경
--테이블의 이름 변경
alter table posts rename post;

--테이블의 컬럼 추가
alter table author add column age int not null; (나이, 타입, 제약조건 변경)

--테이블의 컬럼 삭제
alter table author drop column age;

--테이블의 컬럼명 변경
alter table post change column contents content varchar(255);

--테이블 컬럼의 타입과 제약조건 변경
alter table post modify column content varchar(3000); (추가 변경 시 타입을 꼭 써줘야한다)
제약조건까지: alter table author modify column email varchar(255) not null unique;

--추가 지식
제약조건까지: not null unique;(not null에 unique까지 제약 두개 넣은 것) 위에 해석
not null이라고 해서 무조건 pk는 아니다(pk면 not null이 맞긴함)


modify: 타입, 제약조건 수정시
change: 이름 바꿀라는데 타입을 같이 써야되는거다


--실습1 author테이블에 address컬럼을 추가(varchar 255). name은 not null로 변경.
alter table author add column address varchar (255);
alter table author modify column name varchar(255) not null;
조회: describe author;

--실습2 post테이블에 title을 not null로 변경 content는 contents로 이름 변경.
alter table post modify column title varchar(255) not null;
alter table post change column content contents varchar(3000);

--테이블 삭제
drop table abc;
있으면 삭제하고 없으면 에러터짐
--일련의 쿼리를 실행시킬때 특정 쿼리에서 에러가 나지 않도록 if exists를 많이 사용
drop table if exists abc;
있으면 삭제하고 없으면 넘어간다
----------지금까자ㅣ DDL: 스키마 생성+테이블 생성,변경,삭제 ----실무에서 별로 안쓴다

제약조건설정: pk, fk, unique(자주쓰인다)






-----DML: 에이터 넣고, 조회, .... 많이 쓰는것 특히 조회

DML
삽입: insert vs create
수정: update vs alter
삭제: delate vs drop
조회: select

