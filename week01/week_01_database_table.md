# Week 01 데이터 베이스 및 테이블 생성 실습
---
데이터베이스를 생성하기 위해 MySQL에 데이터베이스를 생성해야 함.   
- 하나의 MySQL에는 여러 개의 데이터베이스가 존재할 수 있으며 각 데이터 베이스의 이름은 사용자가 지정할 수 있음. 
- 하나의 데이터 베이스에 여러개의 테이블이 존재할 수 있음.
   
해당 실습은 테이블을 만들고 간단한 명령어를 익혀 봄.   

---   
## 학사 데이터베이스 생성 작업

1. 새로운 데이터베이스 생성   
``` sql
create database file_name;
``` 

2. 생성된 데이터베이스 확인   
``` sql
show databases;
```

![1,2 result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/01.JPG?raw=true)

3. 생성된 데이터베이스를 사용하기 위해 변경   
``` sql
use file_name;
```

![3 result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/02.JPG?raw=true)

4. 테이블 생성 및 데이터 입력
```sql
#insa 테이블 생성
create table insa(
bunho int(1) auto_increment,
name char(8) not null,
e_name char(4) not null,
town char(6) not null,
primary key(bunho)
)
```

```sql
#데이터 입력
insert into insa values('1', '홍길동', 'Hong', '순천');
insert into insa values('2', '제갈공명', 'Je', '여수');
insert into insa values('3', '순자', 'Soon', '부산');
insert into insa values('4', '이순신', 'Lee', '여수');
```

![4 result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/04.JPG?raw=true)

5. Commit 과 Rollback
- commit은 변경된 데이터를 데이터베이스에 적용 시킴. MySQL은 명령어를 실행하면 자동(Default)로 Commit을 하게 되어 있으므로
```sql 
set autocommit = 0;
```
해당 명령어로 AutoCommit을 하지 않도록 한 후 실습을 진행함.   
![autocommit = 0](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/05.JPG?raw=true)

- Rollback 은 변경된 데이터를 취소시킴. 직전에 commit이 수행된 시점까지 취소시키는 것.

6. 데이터 변경
```sql
update insa
set town = '서울'
where bunho = 4;
```

insa 테이블의 4번 도시를 서울로 변경 후 변경된 내용을 복구 하면 아래와 같은 결과물을 얻을 수 있음.   

![6 result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/06.JPG?raw=true)


```sql
update insa
set town = '대구'
where town = '여수';
```

```sql
#테이블 내용을 데이터베이스에 저장
commit;
``` 

![commit 예제](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/07.JPG?raw=true)   

위와 같이 여수를 대구로 변경 후 commit을 하면  rollback을 해도 되돌아 가지 않음.   
   

7. Savepoint & Truncate 작업

```sql
update insa
set town = '여수'
where bunho = 2;
```

![save point 예제](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/08.JPG?raw=true)   

번호 2의 도시를 여수로 바꾼 후 바뀐 테이블 확인을 하면 위와 같은 결과를 볼 수 있다.   

여기서 savepoint 'aa'를 지정하고 savepoint를 저장한다.
```sql
savepoint aa;
```
![savepoint](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/09.JPG?raw=true)


```sql
delete from insa
where bunho = 3;
select * from insa;
```

```sql
rollback to aa;
select * from insa;
```

번호 3의 행을 삭제 한 후 savepoint 'aa'까지 rollback을 하면 이전으로 복구된 것을 아래와 같이 볼 수 있다.

![복구 예제](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/10.JPG?raw=true)


Truncate 작업을 하면 rollback을 사용해도 복구가 되지 않으며 이는 delete와는 차이가 있음을 인지하여야 한다.

```sql
#Trancate 작업 : insa 테이블의 삭제
truncate table insa;
```

```sql
rollback;
select * from insa;
#trancate 작업 후에는 복구가 되지 않음.
```

![trancate 예제](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/11.JPG?raw=true)