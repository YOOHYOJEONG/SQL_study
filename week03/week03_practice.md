# Week 03 GROUP BY 실습
---

## 열의 그룹화
하나의 열에 대해 그룹화 해 보기.   

1. student 테이블에 있는 학생의 학년 별 그룹과 인원을 출력하고 학년을 기준으로 정렬.   
![1result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week03/images/p_1.JPG?raw=true)    


2. 각 입학년도별 총 학생 수를 출력.   
![2result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week03/images/p_2.JPG?raw=true)    


3. fee 테이블로부터 등록년도(fee_year)에 대하여 등록횟수를 출력.   
![3result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week03/images/p_3.JPG?raw=true)   

4. fee 테이블에서 학번을 기준으로  학번, 등록횟수, 각 학생이 받은 장학금의 전체 합을 출력하라.    
![3_1result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week03/images/p_3_1.JPG?raw=true)    


5. 박정인 학생에 대하여 학번,  등록횟수를 출력. (fee, student 테이블 사용, 서브쿼리 사용)      
![4result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week03/images/p_4.JPG?raw=true)   


## 2개 이상의 열에 대한 그룹화

1. student 테이블로부터 학년(grade)별, 주야(juya)별 인원수를 출력하라. 단 출력 순서는 학년별 오름차순, 주야 오름차순이다.      
![5result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week03/images/p_5.JPG?raw=true)   


2. student 테이블로부터  학년(grade), 반(class), 주야(juya)구분이 서로 다른 모든 조합을 인원수로 출력하라. 단 출력 순서는 학년별 오름차순이다.   
![6result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week03/images/p_6.JPG?raw=true)   


3. fee 테이블로부터 각 학생별로 대학 재학시 납입금(fee_pay) 총액과 등록금(fee_total) 최대값, 가장 적게 받은 장학금(jang_total), 등록 횟수를 출력하라.
![7result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week03/images/p_7.JPG?raw=true)    


4. 등록한 학생에 대하여 학번, 이름, 납입금(fee_pay) 총액을 출력하라. (이름 정보는 student 테이블에 존재한다)    
![8result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week03/images/p_8.JPG?raw=true)   


## NULL 값의 그룹화
NULL 값을 가진 열을 그룹화하면 NULL값은 하나의 그룹으로 구성됨.   


1. fee 테이블로부터 서로 다른 장학코드(jang_code)를 그룹화하고 인원수를 출력하라. 단 jang_code의 값이 null인 경우 null로 표시하라.   
![9result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week03/images/p_9.JPG?raw=true)   


## HAVING
HAVING 절을 사용하여 GROUP BY를 통해 그룹화된 그룹에 대해 조건문을 실행할 수 있음.   


1. fee 테이블로부터 세 번 이상 등록한 학생의 학번과 등록 횟수를 출력.   
![10result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week03/images/p_10.JPG?raw=true)   


2. fee 테이블로부터 2006년에 등록한 학생의 학번과 등록 횟수를 출력하라.    
![11result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week03/images/p_11.JPG?raw=true)   


3. fee 테이블로부터 납입금(fee_pay)의 총액이 5,000,000원 이상인 각 학생에 대하여 출력하라.    
![12result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week03/images/p_12.JPG?raw=true)    