# Week 03 과제
---
## 문제 1. 이름이 없는 동물의 아이디
```sql
SELECT ANIMAL_ID FROM ANIMAL_INS
WHERE NAME IS NULL ORDER BY ANIMAL_ID;
```

![1result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week03/images/1.JPG?raw=true)   


## 문제 2. 이름이 있는 동물의 아이디
```sql
SELECT ANIMAL_ID FROM ANIMAL_INS
WHERE NAME IS NOT NULL ORDER BY ANIMAL_ID;
```

![2result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week03/images/2.JPG?raw=true)   

➡ [문제1,2 풀이](https://iambeginnerdeveloper.tistory.com/138?category=925257)   
     


## 문제 3. NULL 처리하기
```sql
SELECT ANIMAL_TYPE, IFNULL(NAME, 'No name'), SEX_UPON_INTAKE FROM ANIMAL_INS
ORDER BY ANIMAL_ID;
```
![3result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week03/images/3.JPG?raw=true)

➡ [문제 3 풀이](https://iambeginnerdeveloper.tistory.com/136?category=925257)   
     



## 문제 4. 고양이와 개는 몇 마리 있을까
```sql
SELECT ANIMAL_TYPE, COUNT(ANIMAL_TYPE) AS count FROM ANIMAL_INS 
GROUP BY ANIMAL_TYPE 
ORDER BY ANIMAL_TYPE;
```

![4result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week03/images/4.JPG?raw=true)   

➡ [문제 4 풀이](https://iambeginnerdeveloper.tistory.com/130?category=925257)   
    
     


## 문제 5. 동명 동물 수 찾기
```sql
SELECT NAME, COUNT(NAME) AS COUNT FROM ANIMAL_INS
GROUP BY NAME
HAVING COUNT(NAME) > 1 
ORDER BY NAME;
```

![5result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week03/images/5.JPG?raw=true)   

➡ [문제 5 풀이](https://iambeginnerdeveloper.tistory.com/139?category=925257)   
     



## 문제 6. 입양 시각 구하기(1)
```sql
SELECT HOUR(DATETIME), COUNT(DATETIME) FROM ANIMAL_OUTS
WHERE HOUR(DATETIME) > 8 AND HOUR(DATETIME) < 20
GROUP BY HOUR(DATETIME)
ORDER BY HOUR(DATETIME);
```
![6result](https://github.com/YOOHYOJEONG/SQL_study/blob/master/week03/images/6.JPG?raw=true)    

➡ [문제 6 풀이](https://iambeginnerdeveloper.tistory.com/140?category=925257)     


