# Week 02 과제
---
## 문제1. 
다음과 같은 스키마를 보고 student_info 테이블을 생성하는 명령어를 작성하라.   
```sql
 show databases;
 
 #haksa_databes에 새로운 테이블을 만듦.
 use haksa_database;
 show tables;

 #새로운 테이블 생성.
 create table student_info(
	stu_no char(10) not null,
    stu_name char(10) not null,
    sex char(2) not null,
    birth_date char(6) not null,
    fee_enter int(7), 
    address varchar(100),
    phone_no varchar(14),
    primary key(stu_no)
 );
 
 #만들어진 테이블 확인
 show tables;
 select * from student_info;
 ```
![result1](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week02/image/ex_01.JPG?raw=true)


## 문제2. 
1번에서 생성한 student_info 테이블에 다음 5개의 데이터를 삽입하는 명령어를 작성하고 student_info 테이블의 모든 데이터를 출력하라.   
```sql
insert into student_info values('20001001', '김유신', '남', '811007', '3000000', '마포', '011-617-1290');
insert into student_info values('20001015', '박도준', '남', '780116', '2500000', '양재', '011-611-9884');
insert into student_info values('20001021', '이상길', '남', '750819', null, '강남', null);
insert into student_info values('20041002', '김유미', '여', '830207', '1000000', '인천', '010-617-1290');
insert into student_info values('20041007', '정인정', '여', '830315', '2000000', '과천', '018-641-9304');

select * from student_info;
```
![result2](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week02/image/ex_02.JPG?raw=true)


## 문제3. 
student_info의 테이블의 null 값이 존재하는 데이터를 삭제하는 명령어를 작성하여라.   
```sql
set sql_safe_updates=0;
delete from student_info where phone_no is null;
select * from student_info;
```
![result3](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week02/image/ex_03.JPG?raw=true)


## 문제4. 
phone_no가 011으로 시작하는 데이터의 stu_no, stu_name, fee_enter을 조회하고 fee_enter 기준으로 오름차순 정렬하라.   
```sql
select stu_no, stu_name, fee_enter
from student_info
where substr(phone_no, 1, 4) = 011
order by fee_enter asc;
```
![result4](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week02/image/ex_04.JPG?raw=true)


## 문제5. 
fee_enter의 값이 2000000 이상 ~ 3000000 이하의 값을 가지는 데이터의 stu_name, fee_enter 를 조회하고 fee_enter는 숫자 3번째 자리마다 ,를 표시하라.   
```sql
select stu_name, format(fee_enter, 0) from student_info where fee_enter >= 2000000 and fee_enter <= 3000000;
```
![result5](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week02/image/ex_05.JPG?raw=true)


## 문제6. 
성별을 기준으로 fee_enter의 총합을 구하고 다음과 같이 출력하라. 
```sql
select sex, sum(fee_enter) from student_info group by sex;
```
![result6_1](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week02/image/ex_06_1.JPG?raw=true)


성별을 기준으로 fee_enter의 최댓값을 구하라.   
```sql
select sex, max(fee_enter) from student_info group by sex;
```
![result6_2](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week02/image/ex_06_2.JPG?raw=true)


## (도전문제) 문제 7.
생년월일(birth_date)이 1980년 이후인 사람들의 fee_enter의 평균값을 조회하는 명령어를 작성하라.   
```sql
select avg(fee_enter) from student_info where birth_date like '8%' order by birth_date;
```
![result7](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week02/image/ex_07.JPG?raw=true)


## (도전문제) 문제 8.
MySQL 사용시 테이블의 내용을 제거 하기 위한 명령으로 'DELETE' 와 'TRUNCATE' 가 있다. student_info의 모든 데이터를 삭제하고 delete와 truncate의 차이점을 설명하라.   
```sql
#delete
delete from student_info;
show tables;

#truncate
truncate student_info;
show tables;
select * from student_info;
```
![result8](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week02/image/ex_08.JPG?raw=true)   

- delete는 rollback으로 복구가 되지만 trancate 작업 후에는 rollback으로도 복구가 되지 않는다.