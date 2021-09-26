# Week 01 과제
---
## 문제1. 
student 테이블로부터 성별이 남자인 각 학생의 학번, 이름, 영문이름, 학년, 주민등록번호를 영문이름 순서대로 출력.

```sql
select stu_no, stu_name, stu_ename, grade, id_num
from student
where substring(id_num, 8, 1) = 1
order by stu_ename;
```

![1 result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/ex01/01.JPG?raw=true)


## 문제2. 
student 테이블로부터 학년이 1학년이고 성별이 남자인 각 학생의 학번과 이름을 출력하는데, 출력 순서는 학번을 기준으로 내림차순으로 정렬.

```sql
select stu_no, stu_name
from student
where grade = 1
and substring(id_num, 8, 1) = 1
order by stu_no desc;
```

![2 result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/ex01/02.JPG?raw=true)


## 문제3. 
subject 테이블로 부터 과목 이름이 프로그래밍으로 끝나는 데이터를 모두 출력.

```sql
select * from subject
where RIGHT(sub_name, 5) = '프로그래밍';
```

![3 result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/ex01/03.JPG?raw=true)


## 문제4. 
subject 테이블로 부터 운영체제 과목의 생성 년도를 2006년으로 변경하고 변경된 결과를 출력.

```sql
update subject set create_year='2006' where sub_name='운영체제';
select * from subject where
    -> sub_name = '운영체제';
```

![4 result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/ex01/04.JPG?raw=true)


## 문제5. 
subject 테이블로부터 과목명(sub_name)이 UML인 과목을 삭제하고 subject 테이블을 출력. (에러가 발생할 경우 과목코드를 참조하는 테이블의 행을 먼저 삭제하고 진행)

```sql
SET foreign_key_checks = 0;
delete from subject where sub_name = 'UML';
select * from subject;
SET foreign_key_checks = 1;
```

![5 result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/ex01/05.JPG?raw=true)


## 문제6. 
subject 테이블에 교과목 코드(4007), 교과목명(UML), 교과목영문이름(Unified Modeling Language), 생성년도(2005)인 새로운 행을 삽입하는 명령어를 작성.

```sql
INSERT INTO SUBJECT VALUES
    -> (4007, 'UML', 'Unified Modeling Language', 2005)
    -> ;
```

![6 result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/ex01/06.JPG?raw=true)


## 문제7(도전 문제).  
student 테이블의 학번, 이름 출생년도, 나이를 출력.

```sql
select stu_no, stu_name, birth_year "출생년도", year(now()) - birth_year + 1 "나이" from student;
```

![7 result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week01/images/ex01/07.JPG?raw=true)