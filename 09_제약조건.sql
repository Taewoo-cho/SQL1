-- 제약조건

-- NOT NULL : 널 값은 입력 안됨

DESC departments;

-- UK 유니크 : 중복되지 않음

CREATE TABLE emp1 (
    eno         NUMBER(3),
    emp_name    VARCHAR2(20) CONSTRAINT emp1_ename_nn NOT NULL,
    email       VARCHAR2(30),
    CONSTRAINT  emp1_email_uk UNIQUE (email)
);

-- 데이터 입력
INSERT INTO emp1 VALUES(208, 'KIM', 'KJS@naver.com');
INSERT INTO emp1 VALUES(209, NULL, 'ABC@naver.com');

