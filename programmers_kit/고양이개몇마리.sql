#프로그래머스
#SQL 고득점 킷
#group by 
#고양이와 개는 몇마리 있을까


SELECT ANIMAL_TYPE, COUNT(ANIMAL_TYPE) AS count FROM ANIMAL_INS GROUP BY ANIMAL_TYPE ORDER BY ANIMAL_TYPE;