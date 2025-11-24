
--not null 제약 조건 추가
name 컬럼에 not null제약조건 추가
alter table author modify column name varchar(255) not null;
--not null 제약 조건 삭제
alter table author modify column name varchar(255); //없던 걸로 덮어쓰기 // 다른 4개는 덮어쓰기x, 제거방법이 각각 다 다르다
--not null, unique 동시 추가
alter table author modify column email varchar(255) not null unique; 

--pk/fk 추가/제거 :add constraint 
--pk 제약조건 삭제
alter table post drop primary key;
         1. descfibe post;
         2.제약조건 테이블 조회
            select*from information_schema.key_column_usage where table_name='post';
         3.제약조건을 별도 조회
--fk 제약조건 삭제
alter table post drop foreign key fk명
--pk 제약조건 추가
alter table post add constraint post_pk primary key(id); //primary key(id)에다가 post_pk라는 이름으로 pk만든다 // creat할땐 이름 안붙여도 외는데 따로 넣을때는 지정해야한다
--fk 제약조건 추가
alter table post add constraint post_fk foreign key(author_id) references author(id);

1)not null 추가/삭제: modify column
2)unique추가: modify column (삭제는 index에서 한다)
3)pk 추가 삭제: alter table drop
pk는 
fk는 이름을 알아야 삭제할 수 있다

--on delete/on update 제약조건 변경 테스트
alter table post add constraint post_fk foreign key(author_id) references author(id) on delate set null on update cascad;

--실습
1.기존 fk 삭제
alter table post drop foreign key post_fk;
2.새로운 fk추가
alter table post add constraint post_fk foreign key(aasdf) references author(id);
3. 새로운 fk에 맞는 테스트 
3-1)삭제 테스트
3-2)수정 테스트