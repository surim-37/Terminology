조건문은 제한적으로 가능한데 반복문까지 쓰려 할 때 '프로시저'가 필요하다.

--흐름제어: if, ifnull, case when(실전x, 문제풀이o)
--if(a,b,c): a조건이 참이면 b반환, 그렇지 않으면 c를 반환
select id, name from author

//id조회, 이름조회(이름이 null이면 '익명사용자'라고 출력해라)
select id, if(name is null, '익명사용자', name)from author; //삼항연산자와 유사
select id, if(name is null, '익명사용자', name)as name from author; // 깔끔하게 as

--ifnull(a,b): a가 null이면 b를 반환, null이 아니면 a를 그대로 반환
select id, ifnull(name, '익명사용자') as name from author;

--case when
select id, 
case 
when name is null then '익명사용자'
when name ='houg1' then '홍길동1'
when name ='houg2' then '홍길동2'
else name
end as name // 깔끔하게
from author; //줄바꿔도 문제 없다 // 조건이 많아지면 when 추가

-- 경기도에 위치한 식품창고 목록 출력하기
-- 조건에 부합하는 중고거래 상태 조회하기
-- 12세 이하인 여자 환자 목록 출력하기

--쿼리 순서!!!!!!!!
select 컬럼명 from 테이블명 where 조건 order by(항상 마지막 )


DDL -잘 안바꾼다
DML -select 초점