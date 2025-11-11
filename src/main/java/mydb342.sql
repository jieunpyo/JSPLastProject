DESC recipeDetail;

SELECT count(*)
FROM menupan_food WHERE address LIKE '%마포%'
AND (type LIKE '%한식%' OR type LIKE '%양식%'
OR type LIKE '%중식%'
OR type LIKE '%일식%');

--WHERE num BETWEEN 1 AND 10;
-- like 
/*
   lno NUMBER, => 고유번호 
   type NUMBER, => 구분자 
                   맛집 => 1 
                   레시피 => 2
                   상품 => 3
   rno NUMBER, => 맛집 , 레시피 , 상품  번호 
   id VARCHAR2(20)
*/
CREATE TABLE all_like(
   lno NUMBER,
   type NUMBER,
   rno NUMBER,
   id VARCHAR2(20),
   CONSTRAINT al_lno_pk PRIMARY KEY(lno),
   CONSTRAINT al_type_ck CHECK(type IN(1,2,3)),
   CONSTRAINT al_id_fk FOREIGN KEY(id)
   REFERENCES mvcMember(id)
);
CREATE SEQUENCE al_lno_seq
       START WITH 1
       INCREMENT BY 1
       NOCACHE 
       NOCYCLE;
-- jjim  
CREATE TABLE all_jjim(
    jno NUMBER,
    type NUMBER,
    rno NUMBER,
    id VARCHAR2(20),
    regdate DATE DEFAULT SYSDATE,
    CONSTRAINT aj_jno_pk PRIMARY KEY(jno),
    CONSTRAINT aj_type_ck CHECK(type IN(1,2,3)),
    CONSTRAINT aj_id_fk FOREIGN KEY(id)
    REFERENCES mvcMember(id)
);
CREATE SEQUENCE aj_jno_seq
     START WITH 1
     INCREMENT BY 1
     NOCACHE
     NOCYCLE;
-- reply
DROP TABLE al_reply;
CREATE TABLE all_reply(
   no NUMBER,
   type NUMBER,
   rno NUMBER,
   id VARCHAR2(20),
   name VARCHAR2(51) CONSTRAINT ar_name_nn NOT NULL,
   sex VARCHAR2(10) CONSTRAINT ar_sex_nn NOT NULL,
   msg CLOB CONSTRAINT ar_msg_nn NOT NULL,
   group_id NUMBER,
   group_step NUMBER DEFAULT 0,
   group_tab NUMBER DEFAULT 0,
   root NUMBER DEFAULT 0,
   depth NUMBER DEFAULT 0,
   regdate DATE DEFAULT SYSDATE
);
CREATE SEQUENCE ar_no_seq
     START WITH 1
     INCREMENT BY 1
     NOCYCLE
     NOCACHE;

DESC all_like;
DESC all_jjim;
DESC all_reply;





