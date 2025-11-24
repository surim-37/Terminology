정수(tityint,int.bihint), 실수(decimal),문자(char,varchar,)...

--tinyint: 1바이트 사용. -128~127까지의 정수표현 가능.-첫자리를 음양 결정용으로 넣어서.(무조건 양일 시 unsignedv 0~255)
--author테이블에 age컬럼 추가


--int : 4바이트 사용. 대략 40억 숫자범위 표현 가능.

--bigint: 8바이트 사용. (아무때나 쓰면 공간낭비)
--author, post테이블의 id값을 bigint로 변경
alter table author modify column id bigint; 안됌 fk때문에
alter table post modify column author_id bigint; 안됌
alter table post modify column id bigint; 참조관계 안걸려있어서 O

이화여대 반효경 교수님 운영체제


--deciaml(총자리수, 소수부자리수) //넘어가면 들어가긴 하되 데이터가 잘림 -//안짤리고 반올림 //고정소수점VS부동소수점
alter table author add column height deciaml(4,1);
--정상적으로 insert
insert into author(id,name,email,height) values(7,'홍길동3','sss@naver.com',175.5);
--데이터가 잘리도록 insert
select*from author;
insert into author(id,name,email,height) values(7,'홍길동3','ss@naver.com',175.55);

문자: 3개
char: 고정길이 //공백 포함 //데이터 무결성 때문에 고정된 길이에서는 상징적으로 쓰기도 한다 ex. 주민등록
varchar: 가변길이 //기본 //메모리 위주로 저장(디스크 저장은 한다)-조회성능 좋지만 메모리를 잡아먹음,빈번히 조회되는 짧은 길이의 데이터
text: 가변길이 //storage 저장,최대길이 지정불가//디스크 싸다//빈번히 조회되지 않는 데이터 ex.소설,자소서,contents(성능 높이고 싶으면 varchar)
너무 길면 longtext등
1)길이가 딱 정해진 짧은 단어 char(상징일땐 char) 또는 varchar
2)장문의 데이터: text or varchar
3)그 외 전부: varchar 
2-2)빈번히 조회가 되는 사항->성능좋은 varchar
2-3)text는 indexing처리가 어려움 (목차 처리가 어렵다)

--문자타입: 고정길이(char-길이 지정해줘야됌),가변길이(varchar,text)
alter table author add column id_number char(16)    (의미가 있으면 _)
alter table author add column self_introduction text

--blob(바이너리데이터) 실습
--일반적으로 blob으로 저장하기 보다는, 이미지를 별도로 저장하고, 이미지경로를 verchar로 저장
alter table author add column profile_image longblob;
insert into author(id,name,email,ptofile_image) values(10,'abc','abcfasdfaf@naver.com',LOAD_FILE('C:\\FDS.png')); <-LOAD_FILE 함수

--enum: 삽입될 수 있는 데이터의 종류를 한정하는 데이터 타입
--role 컬럼 추가 (중요!!!!권한분리 등)
alter table author add column role enum('admin', 'user') not null default 'user'//현재 null도 들어갈 수 있는 것
값 설정 후 바꿀 때 modify
--enum에서 지정된 role을 지정해서 insert
insert into author(id,name,email, role) values(11, 'ddd','ddd@naver.com,admin');
만약에 비워져 있으면 user가 기본이다
--enum에서 지정되지 않은 값을 insert
insert into author(id,name,email, role) values(12, 'ddd','ddd@naver.com,super- admin');->에러발생
없는, 지정되지 않은 값 super-admin=에러난다
--role을 지정하지 않고 insert
insert into author(id,name,email) values(13, 'ddd','ddd@naver.com');

--data(연월일)와 daterime(연월일시분초)
--날짜타입의 입력, 수정, 조회시에는 문자열 형식을 사용
alter table author add column birthday date;
alter table post add column created_time datetime;
insert into post(id, title,contents, author_id, created_time) values(4,'hellow','hellow...',1,'2019-01-01 14:00:30'); //날짜 형식 맞춰야된다
--datetime과 default 현재시간 입력은 많이 사용되는 패턴
alter table post modify column created_time datetime default current_timestamp(); //현재 시간 자동으로 넣어주는 함수
insert into post(id, title,contents, author_id) values(6,'hello','hello..',1);

--비교연산자
| select*form author where id>=2 and id<=4;
| select*form author where id in (2,3,4) // (select하면서 쿼리 들어오는 경우가 흔하다)
| select*form author where id between 2 and 4; //헷갈려서 잘 안씀

--like: 특정 문자를 포함하는 데이터를 조회하기 위한 키워드 (많이 씀!!)
select*from post where title like "h%"; //h로 시작하는
select*from post where title like "%h"; //h로 끝나는
select*from post where title like "%h%"; //h가 포함되어있는

--regexp: 정규표현식을 활용한 조회
select*from author shere nave regexp '[a-z]'--  <-알파벳으로 이루어진 정규표현식: 이름에 소문자 알파벳이 포함되어 있으면 찾아준다
select*from author shere nave regexp '[가-힣]'--  <-이름으로 이루어진 정규표현식: 이름에 한글이 포함되어 있으면 찾아준다
RegularExpression: 자주 사용되는 패턴
regexp: 정규표현식

--타입 변환 - cast 형변환 하는 함수
--문자-> 숫자
select cast('12' as unsigned) //int쓰면 에러나는 경우가 있어서 unsigned로 하는 것이 관례
--숫자-> 날짜
select cast(20251121 as date)as date; : -2025-11-21 //as date )뒤에 붙이면 깔끔하게 나온다
--문자-> 날짜
select cast('20251121' as date);:2025-11-21

-- 날짜타입변환 - date_format(Y, m, d, H, i, s) //내가 원하는 포맷으로 설정
select created_time from post;
select date_format(created_time, '%Y-%m-%d') from post; //날짜만 꺼내는것
select date_format(created_time, '%H-i-%s') from post; //
select*from post where date_format(created_time, '%Y')='2025'; 해당 값(2025)이 있는 것을 찾는 것
select*from post where date_format(created time, '%m')='05';
select*from post where cast(date_format(created time, '%m') as unsigned)='1'; //01이런게 아니라 1이렇게 입력을 보통 받아서 cast로 형변환을 한번 더 해주는 것이 관례다

--실습: 2025-11월 등록된 게시글 조회
select contents from post where date_format(created_time, '%m')='11';

|select*from post where date_format(created_time, '%Y %m')='2025-11';
|select*from post where created_time like '2025-11%' //<<편하게 

--실습: 2025년 11월1일부터 11월 19일까지의 데이터를 조회
select*from post where created_time >= '2025-11-01' and created_time < '2025-11-20' : 기본 2025-11-20 00:00:00 깔려있다 //범위 구하는 것
따라서 19일 조회되게 하고 싶으면 <20일로 설정

between은 안쓰는 것을 추천


---제약조건
not null, unique라고 해서 pk인것은 아니다
pk=not null, unique인것은 맞춰야된다
PK,FK,unique => index //이 중에 index를 만들 수 없는 것은
FK=PK나 unique에 건다

-FK 부연설명
부모테이블에서 수정, 삭제 -> 자식테이블 영향

삭제,수정: 회원 1번이 삭제하면 -> post테이블 영향?
1)삭제 불가(restrict)
2)같이 삭제(cascading) 가능
3)null로 세팅(set null)가능

수정(update) 1)restrict(기본) 2)cascading(적합 예상) 3) set null
삭제(delet) 1)restrict(기본) 2)cascading 3) set null(적합 예상)

