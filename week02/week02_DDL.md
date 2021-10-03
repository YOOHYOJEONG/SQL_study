# Week 02. DDL 명령어
---
## 데이터 정의 언어(DDL)
- 데이터베이스 구조 및 수정에 사용.
- 데이터 저장 구조, 데이터 접근 방법, 데이터 형식 등을 정의.
   
1. CREATE
- 데이터베이스 생성 시 
```sql
CREATE DATABASE 데이터베이스_이름;
``` 
- 테이블 생성 시 
```sql
CREATE TABLE 테이블_이름(속성_이름 테이터_타입 [NOT NULL] [DEFAULT 기본값]
[PRIMARY KEY (속성_리스트)]
[UNIQUE (속성_리스트)]
[FOREIGN KEY (속성_리스트) REFERENCES 테이블_이름 (속성_리스트)] [ON DELETE 옵션] [ON UPDATE 옵션]
[CONSTRAINT 이름] [CHECK(조건)]
); 
#NOT_NULL : 속성이 널 값을 허용하지 않음을 의미.
#DEFAULT : 속성의 기본 값을 지정.
#PRIMARY KEY : 기본키를 지정.
#UNIQUE : 대체키를 지정.
#FOREIGN KEY : 외래키를 지정.
#CONSTRAINT : 제약조건, 데이터 입력 받을 때 실행되는 검사 규칙을 의미.
```
2. ALTER
- 새로운 속성을 추가하거나 기존 속성을 변경, 삭제 할 수 있는 명령어.
``` sql
#새로운 속성 추가
ALTER TABLE 테이블_이름
    ADD 속성_이름 데이터_타입 [NOT NULL] [DEFAULT기본값];

#기존 속성 변경
ALTER TABLE 테이블_이름
    ALTER COLUMN 속성_이름 데이터_타입 [NOT NULL] [DEFAULT 기본값];

#기존 속성 삭제
ALTER TABLE 테이블_이름
	DROP COLUMN 속성_이름;
### 속성 삭제 시 속성과 관련된 제약조건이 존재한다면 속성 삭제가 안되므로 관련된 제약 조건을 먼저 삭제해야 함.
```

3. DROP
- 삭제 기능
```sql
#데이터베이스 삭제
##데이터베이스 삭제 시 해당 데이터베이스의 모든 테이블과 데이터가 함께 삭제 됨.
DROP DATABASE 데이터베이스_이름;

#테이블 삭제
#테이블 삭제 시 해당 테이블의 모든 데이터가 같이 삭제 됨.
DROP TABLE 테이블_이름;

#테이블 자체가 아닌, 테이블의 데이터만 삭제
TRUNCATE TABLE 테이블_이름;

#삭제하려는 이름의 데이터베이스나 테이블이 없을 때 뜨는 에러 방지
DROP DATABASE I EXISTS ITEM;

DROP TABLE IF EXISTS STUDENT;
```

4. RENAME
- 이름 변경 및 테이블 이동
```sql
#단일 테이블 이름 변경
RENAME TABLE old_table TO new_table;
ALTER TABLE old_table RENAME new_table;

#다수 테이블 이름 변경
RENAME TABLE old_table1 TO new_table1, old_table2 TO new_table2, old_table3 TO new_table3;

#다른 데이터베이스로 테이블 이동
RENAME TABLE current_db.table_name TO other_db.table_name;
```

5. COMMENT
- Comment 설정
```sql
CREATE TABLE 테이블_이름 (
속성_이름 테이터_타입 [NOT NULL] [DEFAULT 기본값] - (1)
[PRIMARY KEY (속성_리스트)] - (2)
[UNIQUE (속성_리스트)]
[FOREIGN KEY (속성_리스트) REFERENCES 테이블_이름 (속성_리스트)] [ON DELETE 옵션] [ON UPDATE 옵션]
[CONSTRAINT 이름] [CHECK(조건)] - (3)
) COMMENT = 'comment';

# 특정 테이블만 COMMENT 설정
ALTER TABLE 테이블_이름 COMMENT = 'comment';

# 속성 COMMENT

CREATE TABLE 테이블_이름 (
	속성_이름 INT COMMENT 'comment',
	...
);

# 특정 속성만 COMMENT 설정
ALTER TABLE 테이블_이름 MODIFY 속성_이름 데이터_타입 [NOT NULL] [DEFAULT 기본값] COMMENT 'comment'
```

- Comment 조회
```sql
SELECT TABLE_SCHEMA,TABLE_NAME,TABLE_COMMENT
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA='database_name';

# 속성 comment 조회
SELECT  TABLE_SCHEMA,TABLE_NAME,COLUMN_NAME,COLUMN_COMMENT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='database_name' AND TABLE_NAME='table_name';
```

- Comment 삭제
```sql
# 테이블 comment 삭제
ALTER TABLE 테이블_이름 COMMENT = '';

# 속성 comment 삭제
ALTER TABLE 테이블_이름 MODIFY 속성_이름 데이터_타입 [제약조건];
```