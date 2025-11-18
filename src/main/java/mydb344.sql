alter table goods_all add CONSTRAINT goods_no_pk PRIMARY KEY(no);
CREATE TABLE mvcOrders(
   no NUMBER,
   gno NUMBER,
   id VARCHAR2(20),
   name VARCHAR2(51) CONSTRAINT order_name_nn NOT NULL,
   post VARCHAR2(10) CONSTRAINT order_post_nn NOT NULL,
   addr1 VARCHAR2(100) CONSTRAINT order_addr1_nn NOT NULL,
   addr2 VARCHAR2(100),
   msg CLOB CONSTRAINT order_msg_nn NOT NULL,
   account NUMBER,
   CONSTRAINT order_no_pk PRIMARY KEY(no),
   CONSTRAINT order_gno_fk FOREIGN KEY(gno)
   REFERENCES goods_all(no),
   CONSTRAINT order_id_fk FOREIGN KEY(id)
   REFERENCES mvcMember(id)
);
CREATE SEQUENCE order_no_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
CREATE TABLE notice(
  no NUMBER,
  state VARCHAR2(20) CONSTRAINT notice_state_nn NOT NULL,
  name VARCHAR2(51) DEFAULT '관리자',
  subject VARCHAR2(2000) CONSTRAINT notice_subject_nn NOT NULL,
  content CLOB CONSTRAINT notice_content_nn NOT NULL,
  regdate DATE DEFAULT SYSDATE,
  hit NUMBER DEFAULT 0,
  filename VARCHAR2(260),
  filesize VARCHAR2(200),
  CONSTRAINT notice_no_pk PRIMARY KEY(no)
);
CREATE SEQUENCE notice_no_seq
    START WITH 1
    INCREMENT BY 1
    NOCYCLE
    NOCACHE;
DESC mvcOrders;
DESC notice;

ALTER TABLE mvcOrders ADD regdate DATE DEFAULT SYSDATE;