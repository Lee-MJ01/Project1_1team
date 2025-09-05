-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2025-09-05 17:13:53 KST
--   사이트:      Oracle Database 21c
--   유형:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE college (
    college_name    VARCHAR2(20 BYTE) NOT NULL,
    college_name_en VARCHAR2(50 BYTE),
    intro_title     VARCHAR2(100 BYTE) NOT NULL,
    intro_body      VARCHAR2(200 BYTE) NOT NULL,
    image_path      VARCHAR2(255 BYTE)
);

ALTER TABLE college ADD CONSTRAINT college_pk PRIMARY KEY ( college_name );

CREATE TABLE course (
    crs_cd   NUMBER NOT NULL,
    dept_id  NUMBER NOT NULL,
    grade    NUMBER(1) NOT NULL,
    div      VARCHAR2(50 BYTE),
    crs_name VARCHAR2(100 BYTE) NOT NULL,
    p_code   VARCHAR2(50 BYTE) NOT NULL,
    credit   NUMBER(1) NOT NULL,
    crs_time VARCHAR2(100 BYTE),
    crs_room VARCHAR2(50 BYTE),
    capacity NUMBER(3)
);

ALTER TABLE course ADD CONSTRAINT course_pk PRIMARY KEY ( crs_cd );

CREATE TABLE department (
    dept_id              NUMBER NOT NULL,
    college_college_name VARCHAR2(20 BYTE) NOT NULL,
    depte_name           VARCHAR2(30) NOT NULL,
    dept_name_en         VARCHAR2(50),
    established          DATE NOT NULL,
    chair_name           VARCHAR2(5) NOT NULL,
    dept_phone           CHAR(12) NOT NULL,
    dept_office          VARCHAR2(50) NOT NULL
);

ALTER TABLE department ADD CONSTRAINT department_pk PRIMARY KEY ( dept_id );

CREATE TABLE enrollment (
    e_id       VARCHAR2(10 BYTE) NOT NULL,
    year       NUMBER,
    semester   NUMBER,
    std_id     NUMBER NOT NULL,
    department VARCHAR2(50 BYTE),
    crs_cd     NUMBER NOT NULL,
    r_date     DATE
);

ALTER TABLE enrollment ADD CONSTRAINT enrollment_pk PRIMARY KEY ( e_id );

CREATE TABLE notice (
    n_no   NUMBER NOT NULL,
    n_type VARCHAR2(20 BYTE) NOT NULL,
    title  VARCHAR2(100 BYTE),
    writer VARCHAR2(20 BYTE),
    wdate  VARCHAR2(10 BYTE),
    hits   NUMBER
);

ALTER TABLE notice ADD CONSTRAINT notice_pk PRIMARY KEY ( n_no,
                                                          n_type );

CREATE TABLE professor (
    p_code          VARCHAR2(50 BYTE) NOT NULL,
    nation          VARCHAR2(20 BYTE),
    name_ko         VARCHAR2(20 BYTE),
    name_en         VARCHAR2(20 BYTE),
    gender          VARCHAR2(10 BYTE),
    jumin           VARCHAR2(30 BYTE),
    hp              VARCHAR2(30),
    email           VARCHAR2(50 BYTE),
    addr_code       NUMBER(10),
    addr            VARCHAR2(100 BYTE),
    addr_detail     VARCHAR2(30 BYTE),
    dept_id         NUMBER NOT NULL,
    position_code   VARCHAR2(20 BYTE),
    position_detail VARCHAR2(30 BYTE),
    hire_date       DATE,
    status          VARCHAR2(20 BYTE),
    univ            VARCHAR2(30 BYTE),
    graduate_date   DATE,
    course          VARCHAR2(30 BYTE),
    ing             VARCHAR2(30 BYTE)
);

ALTER TABLE professor ADD CONSTRAINT professor_pk PRIMARY KEY ( p_code );

CREATE TABLE score (
    score_no       VARCHAR2(10 BYTE) NOT NULL,
    student_std_id NUMBER NOT NULL,
    course_crs_cd  NUMBER NOT NULL,
    mid_score      NUMBER,
    final_score    NUMBER,
    total_score    NUMBER,
    grade          CHAR(2 BYTE)
);

ALTER TABLE score ADD CONSTRAINT score_pk PRIMARY KEY ( score_no );

CREATE TABLE student (
    std_id          NUMBER NOT NULL,
    regident_number VARCHAR2(14 BYTE) NOT NULL,
    name            VARCHAR2(20 BYTE) NOT NULL,
    e_name          VARCHAR2(30 BYTE),
    gender          VARCHAR2(5 BYTE),
    email           VARCHAR2(30 BYTE),
    address         VARCHAR2(100 BYTE) NOT NULL,
    entryyear       VARCHAR2(5 BYTE) NOT NULL,
    graduationyear  VARCHAR2(5 BYTE) NOT NULL,
    division        VARCHAR2(5 BYTE) NOT NULL,
    dept_id         NUMBER NOT NULL,
    entryterm       VARCHAR2(3 BYTE),
    entrygrade      VARCHAR2(10 BYTE),
    advisor         VARCHAR2(10 BYTE) NOT NULL,
    status          VARCHAR2(50 BYTE) NOT NULL
);

ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( std_id );

CREATE TABLE student_records (
    sr_no                 VARCHAR2(10 BYTE) NOT NULL,
    year                  NUMBER,
    grade                 NUMBER,
    term                  NUMBER,
    credits_registered    NUMBER,
    credits_major         NUMBER,
    credits_elective      NUMBER,
    credits_other         NUMBER,
    credits_general       NUMBER,
    credits_earnedd_total NUMBER,
    credits_vol           NUMBER,
    gpa                   NUMBER,
    remark                VARCHAR2(200 BYTE),
    std_id                NUMBER NOT NULL,
    score_no              VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE student_records ADD CONSTRAINT student_records_pk PRIMARY KEY ( sr_no );

CREATE TABLE "user" (
    usid    VARCHAR2(20 BYTE) NOT NULL,
    pass    VARCHAR2(100 BYTE) NOT NULL,
    us_name VARCHAR2(20 BYTE) NOT NULL,
    hp      CHAR(13 BYTE),
    email   VARCHAR2(50 BYTE),
    addr1   VARCHAR2(100 BYTE),
    addr2   VARCHAR2(100 BYTE)
);

ALTER TABLE "user" ADD CONSTRAINT user_pk PRIMARY KEY ( usid );

ALTER TABLE course
    ADD CONSTRAINT course_department_fk FOREIGN KEY ( dept_id )
        REFERENCES department ( dept_id );

ALTER TABLE course
    ADD CONSTRAINT course_professor_fk FOREIGN KEY ( p_code )
        REFERENCES professor ( p_code );

ALTER TABLE department
    ADD CONSTRAINT department_college_fk FOREIGN KEY ( college_college_name )
        REFERENCES college ( college_name );

ALTER TABLE enrollment
    ADD CONSTRAINT enrollment_course_fk FOREIGN KEY ( crs_cd )
        REFERENCES course ( crs_cd );

ALTER TABLE enrollment
    ADD CONSTRAINT enrollment_student_fk FOREIGN KEY ( std_id )
        REFERENCES student ( std_id );

ALTER TABLE professor
    ADD CONSTRAINT professor_department_fk FOREIGN KEY ( dept_id )
        REFERENCES department ( dept_id );

ALTER TABLE score
    ADD CONSTRAINT score_course_fk FOREIGN KEY ( course_crs_cd )
        REFERENCES course ( crs_cd );

ALTER TABLE score
    ADD CONSTRAINT score_student_fk FOREIGN KEY ( student_std_id )
        REFERENCES student ( std_id );

ALTER TABLE student
    ADD CONSTRAINT student_department_fk FOREIGN KEY ( dept_id )
        REFERENCES department ( dept_id );

ALTER TABLE student_records
    ADD CONSTRAINT student_records_score_fk FOREIGN KEY ( score_no )
        REFERENCES score ( score_no );

ALTER TABLE student_records
    ADD CONSTRAINT student_records_student_fk FOREIGN KEY ( std_id )
        REFERENCES student ( std_id );

CREATE SEQUENCE course_crs_cd_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER course_crs_cd_trg BEFORE
    INSERT ON course
    FOR EACH ROW
    WHEN ( new.crs_cd IS NULL )
BEGIN
    :new.crs_cd := course_crs_cd_seq.nextval;
END;
/

CREATE SEQUENCE department_dept_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER department_dept_id_trg BEFORE
    INSERT ON department
    FOR EACH ROW
    WHEN ( new.dept_id IS NULL )
BEGIN
    :new.dept_id := department_dept_id_seq.nextval;
END;
/

CREATE SEQUENCE notice_n_no_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER notice_n_no_trg BEFORE
    INSERT ON notice
    FOR EACH ROW
    WHEN ( new.n_no IS NULL )
BEGIN
    :new.n_no := notice_n_no_seq.nextval;
END;
/

CREATE SEQUENCE professor_p_code_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER professor_p_code_trg BEFORE
    INSERT ON professor
    FOR EACH ROW
    WHEN ( new.p_code IS NULL )
BEGIN
    :new.p_code := professor_p_code_seq.nextval;
END;
/

CREATE SEQUENCE student_std_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER student_std_id_trg BEFORE
    INSERT ON student
    FOR EACH ROW
    WHEN ( new.std_id IS NULL )
BEGIN
    :new.std_id := student_std_id_seq.nextval;
END;
/



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             21
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           5
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          5
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
