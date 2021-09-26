# Week 01 -1 실습
---
## 학사 관리 예제 데이터베이스 만들기
- 데이터베이스 생성 및 사용자 계정 생성

1. mysql 접속 후 새로운 데이터베이스 생성하고 확인.
```sql
create database haksa_database;
```

```sql
show database;
```

![1 result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/1_01.JPG?raw=true)

2. 시스템에 존재하는 Host와 user 확인하고 haksa_admin이라는 유저 만듦.
```sql
#시스템에 존재하는 Host, User 확인
select Host, User from mysql.user;
```

```sql
#haks_admin이라는 유저를 만들고 비밀번호를 설정함.
create user 'haksa_admin'@'localhost' identified by '비밀번호';
```

![2 result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/1_02.JPG?raw=true)

3. haksa_admin에게 haksa_database에 대한 모든 권한을 부여함.
```sql
grant all privileges on haksa_database.* to 'haksa_admin'@'localhost' with grant option;
```

권한 부여 후  haksa_admin이라는 정보로 haksa_database에 접속함. 비밀번호는 위에서 설정한 대로 입력하면 됨.   
```sql
mysql -u haksa_admin -p haksa_database
```
![3 result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/1_03.JPG?raw=true)


4. table.sql 파일을 이용해서 데이터를 입력할 수도 있지만 집적 하나씩 다 입력해서 table을 만들고 데이터가 잘 들어갔는지 확인함.
```sql
INSERT INTO CIRCLE VALUES
    -> (7,'PHP길라잡이','20001021','이상길','0');
```
위와 같이 각 항목에 대한 데이터를 전부 입력하고
```sql
select * from attend;
```
해당 항목들에 데이터가 잘 들어갔는지 확인 함.

![4 results1](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/1_04.JPG?raw=true)

![4 results2](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/1_05.JPG?raw=true)

---
헤당 table로 과제를 진행할 것.