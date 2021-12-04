# Week 03 DML 명령어
---
## 데이터 조작 언어(Data Manipulation Language, DML)
: 데이터 조작 언어(Data Manipulation Language, DML)는 데이터베이스 사용자 또는 응용 프로그램 소프트웨어가 컴퓨터 데이터베이스에 대해 데이터 검색, 등록, 삭제, 갱신을 위한, 데이터베이스 언어 또는 데이터베이스 언어 요소이다.   

---

    
### SELECT
데이터베이스에 들어있는 데이터를 조회하거나 검색하기 위한 명령어    

➡ SELECT 문장 실행 순서    
: FROM ➡ WHERE ➡ GROUP BY ➡ HAVING ➡ SELECT ➡ ORDER BY   


```sql
#[]는 선택 사항
SELECT [ALL | DISTINCT] 해당 칼럼명 #(1)
FROM 해당 칼럼들이 있는 테이블명 #(2)
[WHERE 조건] #(3)
[GROUP BY 속성_리스트 [HAVING 조건]] #(4)
[ORDER BY 속성_리스트 [ASC | DESC]] #(5)
```

(1)    
DISTINCT : 중복된 데이터가 있는 경우 중복을 전부 제거하고 하나의 결과만 출력.    

AS : 결과 테이블에서 속성 이름 변경. 새로운 이름에 공백 있으면 따옴표로 묶어줘야 함.    

집계 함수 : 특정 속성 값을 통계적으로 계산한 결과를 검색하기 위해 집계 함수 사용함.(개수, 합계, 평균, 최댓값, 최솟값 등)     

    
(2)    
검색하고 싶은 속성이 있는 테이블 이름을 나열.     

    
(3)    
WHERE : 검색 조건 제시 가능. NULL을 이용하여 검색을 할 수도 있으며 AND, OR, NOT을 이용하여 조건을 생성할 수 있음.     

    
(4)    
GROUP BY : 그룹 별 검색이 가능함. 특정 속성의 값이 같은 튜플을 모아 그룹을 만들고, 그룹별로 검색함.     

HAVING : GROUP BY와 함께 이용해 그룹에 대한 조건을 작성함.    

    
(5)    
ORDER BY : 정렬 기능. 결과 테이블 내용을 사용자가 원하는 순서로 출력할 수 있음.     

ASC : 오름차순    
DESC : 내림차순    

---
    

### INSERT 
: 데이터를 직접 삽입하는 명령어.    

```sql
INSERT INTO 테이블_이름[(속성_리스트)] VALUES (속성값_리스트);
```

INTO 키워드와 함께 튜플을 삽입할 테이블의 이름과 속성의 이름을 나열하고 VALUES 키워드와 함께 삽입할 속성 값들을 나열함.    

INTO 절의 속성 이름과 VALUES 절의 속성 값은 순서대로 일대일 대응되어야 함!!    

---

    
### UPDATE
: 테이블에 저장된 튜플에서 특정 속성의 값을 수정함.    

```sql
UPDATE 테이블_이름
SET 속성_이름1 = 값1, 속성_이름2 = 값2
[WHERE 조건];
```

SET 키워드 다음에 속성 값을 어떻게 수정할 것인지를 결정하고 WHERE 절에 제시된 조건을 만족하는 튜플에 대해서만 속성 값을 수정함.    

❗ WHERE 절을 생략하면 테이블에 존재하는 모든 튜플을 대상으로 수정함.    


--- 


### DELETE
: 테이블에 저장된 데이터를 삭제함.    

```sql
DELETE
FROM 테이블_이름
[WHERE 조건];
```

WHERE 절에 제시한 조건을 만족하는 튜플만 삭제하며 WHERE 절을 생략하면 테이블에 존재하는 모든 튜플을 삭제해 빈 테이블이 됨.    


---

    
### EXPLAIN
: MySQL 서버가 어떠한 쿼리를 실행할 것인가, 실행 계획이 무엇인지 알고 싶을 때 사용함.   

---

    
### LOCK TABLE
: 테이블에 접근할 수 있는 권한을 잠그는 명렁어.   
➡ [MySQL 테이블 잠금](https://blog.appkr.dev/cheatsheet/understanding-mysql-db-lock/)   

---
    
## MySQL에 없는 구문
    
### MERGE
: 대상 테이블의 해당 Key에 맞는 데이터가 이미 존재하면 UPDATE, 존재하지 않으면 INSERT를 하여 테이블 ROW가 충돌나지 않고 데이터를 UPDATE, INSERT 등의 작업을 한번에 할 수 있음.    


