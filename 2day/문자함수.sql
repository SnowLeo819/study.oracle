-- 대문자 변환 UPPER
SELECT * FROM EMP
WHERE ENAME = UPPER('smith');

-- 소문자 변환 LOWER
SELECT * FROM EMP
WHERE ENAME = LOWER('SMITH');

-- 값을 가져오면서 첫글자만 대문자로
SELECT INITCAP(ENAME) FROM EMP;

-- 데이터의 길이 가져오기
SELECT ENAME, LENGTH(ENAME) AS LENGTH FROM EMP;

-- LENGTH 는 숫자비교 가능
SELECT ENAME, LENGTH(ENAME) AS LENGTH FROM EMP
WHERE LENGTH(ENAME) <= 4;

-- DUAL은 출력결과 확인용 DUMMY TABLE...  TEST
-- LENGTH 는 단순 문자 개수..  LENGTHB 는 문자의 바이트수..
SELECT LENGTH('한글'), LENGTHB('한글'), LENGTHB('하나') FROM DUAL;

-- 문자 추출하기.. SUBSTR(대상, 시작위치, 추출문자수)
SELECT JOB, SUBSTR(JOB,1,2) AS ONE, SUBSTR(JOB,3,2) AS THREE FROM EMP;

-- 이름중에 3번부터 마지막까지    / 기본값이 끝까지.. 문자수 안넣어도 됨...
SELECT ENAME, SUBSTR(ENAME,3,LENGTH(ENAME)-2) FROM EMP;
SELECT ENAME, SUBSTR(ENAME,3) FROM EMP;

-- INSTR  문자 찾기 (문자열 , 대상문자)     // 문자 위치를 숫자로 반환함
SELECT INSTR('HELLO ORACLE','L') FROM DUAL;
-- INSTR  문자 찾기 (문자열 , 대상문자 , 검색시작위치)
SELECT INSTR('HELLO ORACLE','L' ,5) FROM DUAL;
-- INSTR  문자 찾기 (문자열 , 대상문자 , 검색시작위치 ,n번째 나오는 문자)
SELECT INSTR('HELLO ORACLE','L' ,2,2) FROM DUAL;

--검색
SELECT * FROM EMP
WHERE ENAME LIKE '%S%';

SELECT * FROM EMP
WHERE INSTR(ENAME,'S') > 0;

-- REPLACE(문자열,찾는문자,바꿀문자)
SELECT '010-2564-4897' AS REPLACE_BEFORE,
REPLACE('010-2564-4897','-',' ')AS REPLACE_AFTER,
REPLACE('010-2564-4897','-','')AS REPLACE_AFTER2
FROM DUAL;

-- FILTERING
-- LPAD / RPAD  공백메꾸기
SELECT RPAD('901212-',14,'*') AS JUMIN,
       RPAD('010-2564-',13,'*') AS PHONE FROM DUAL;
SELECT 'ORACLE', LPAD('ORACLE',10,'#') AS LPADTEST FROM DUAL;     

-- CONCAT 문자열 연결하기  || 2개씩만 연결, 내부에 중복사용 가능
SELECT CONCAT(EMPNO, ENAME)FROM EMP;
SELECT EMPNO||ENAME FROM EMP;
SELECT CONCAT(EMPNO,CONCAT(' : ',ENAME))AS NONAME FROM EMP;

--TRIM () 자르기..공백제거..
SELECT '['||'      --ORACLE--     '||']' AS NOTTRIM,
       '['|| TRIM('      --ORACLE--     ')||']' AS TRIM01,
       TRIM('['||'      --ORACLE--     '||']') AS TRIM02  -- 이건 안됨..
FROM DUAL;
--  지울 문자 지정하기 가능. 삭제할 문자 FROM 대상문자열
SELECT  '['|| TRIM('-' FROM '--ORACLE--')||']' AS TRIM03 FROM DUAL;
SELECT  '['|| TRIM(LEADING '-' FROM '--ORACLE--')||']' AS TRIM03 FROM DUAL;   -- 왼쪽제거 2문자 이상은 오류남..
SELECT  '['|| TRIM(TRAILING '-' FROM '--ORACLE--')||']' AS TRIM03 FROM DUAL;  -- 오른쪽제거 2문자 이상은 오류남..

-- LTRIM / RTRIM    (대상문자열,지울문자) // 2문자 이상도 삭제가능
SELECT LTRIM('ORACLE STUDY OOPS' , 'OO') AS LTRIM FROM DUAL;
SELECT LTRIM('ORACLE STUDY OOPS' , 'ORLE') AS LTRIM FROM DUAL; --오타가 생겨도 맞는 문자까진 삭제처리

SELECT RTRIM('ORACLE STUDY OOPS' , 'OOPS') AS RTRIM FROM DUAL; -- RTRIM 뒤부터 삭제
SELECT RTRIM('ORACLE STUDY OOPS' , 'OOP') AS RTRIM FROM DUAL;  -- 뒤 철자 안맞으면 삭제 X

