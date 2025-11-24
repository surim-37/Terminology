DML
삽입: insert vs create
수정: update vs alter
삭제: delate set vs drop
조회: select


DML
--insert: 테이블에 데이터 삽입 (-없던 데이터에 삽입) (쓸일 거진 없음)
insert into 테이블명(컬럼1,컬럼2,컬럼3) values(데이터1,데이터2,데이터3);
--문자열은 일반적으로 작은 따옴표 사용
insert into author(id, name, email) values(4,'hongildong4','hongildong@naver.com4');

--update: 테이블에 데이터를 변경 (-있는 데이터에 변경 where(어디에))(위험)
update author set name='홍길동' email='hongildong@naver.com' where id=3;

--delete: 삭제 (이름, 이메일 지우는건 그냥 공백으로 업데이트. 따라서 여긴 column이 없다. ) (이름만 이메일만 지울 수 없다. ) (위험)
delete from 테이블명 where 조건;
delete from author where id=4;

--select: 조회(제일 많이 쓰임)
select 컬럼1, 컬럼2 from 테이블명;
select name, email from author; 
--*은 모든 컬럼을 의미
select * from author; (위험)
(개개인으로 조회하기 *=모든, *from = 전체데이터 *from where ?? =열의 전체 데이터)


--select 조건절(where) 활용 (**중요**)
select*from author where id =1;
select*from author where name='surim';
select*from author where id>1 and name='s';
select*from author where id in (1,3,5);

--이름이 '홍길동'인 글쓴이가 쓴 글 목록을 조회하시오
select * from post where where author_id in(select id from author where name='홍길동');
서브쿼리: select id from author where name='홍길동'

--중복제거 조회: distinct
select name from author;
select distinct name from author;

--정렬: order by + 컬럼명
select *from author order by+컬럼명
--asc: 오름차순, desc: 내림차순, 안붙이면 오름차순(default)
--아무런 정렬조건 없이 조회할 경우에는 pk기준 오름차순 (ex.id (pk))
select*from author order by name desc;

--멀티컬럼 order by: 여러컬럼으로 정렬시에, 먼저 쓴 컬럼 우선 정렬하고, 중복 시 컬럼으로 정렬적용.(**)
select*from author order by name desc, email asc; (중복 시 email로 정렬하겠다는 뜻)

--결과값 개수 제한
--ex.가장 최근에 가입한 회원 1명만 조회
select*from author order by id desc limit 1;

--별칭(alias)를 이용한 select
select name as '이름', email as '이메일' from author;
select a.name, a.email from author as a; (테이블 이름도 a라는 별칭으로 만들 수 있다)
select a.name, a.email from author a (뒤는 as빼도 된다) 

--null을 조회조건으로 활용
select*from author where password is null;
select*from author where password is not null;

완전 지우기: hard delete 
남아있는데 상태만 바꾸기: soft delete 귀찮긴하다

select*=모든 컬럼
whrer이 안붙으면 전체가 되는것, 붙으면 조건