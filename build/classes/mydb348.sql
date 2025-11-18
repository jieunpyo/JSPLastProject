CREATE TABLE reserve_info(
   no NUMBER,
   id VARCHAR2(20),
   fno NUMBER,
   rday VARCHAR2(20) CONSTRAINT ri_rday_nn NOT NULL,
   time VARCHAR2(30) CONSTRAINT ri_time_nn NOT NULL,
   inwon VARCHAR2(20)CONSTRAINT ri_inwon_nn NOT NULL,
   ok NUMBER,
   CONSTRAINT ri_no_pk PRIMARY KEY(no),
   CONSTRAINT ri_id_fk FOREIGN KEY(id)
   REFERENCES mvcMember(id),
   CONSTRAINT ri_fno_fk FOREIGN KEY(fno)
   REFERENCES menupan_food(fno),
   CONSTRAINT ri_ok_ck CHECK(ok IN(0,1))
);
CREATE SEQUENCE ri_no_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
CREATE TABLE reserve_date(
   dno NUMBER,
   times VARCHAR2(200) CONSTRAINT rd_times_nn NOT NULL,
   CONSTRAINT rd_dno_pk PRIMARY KEY(dno)
);
CREATE TABLE reserve_time(
   tno NUMBER,
   time VARCHAR2(20) CONSTRAINT rt_time_nn NOT NULL,
   CONSTRAINT rt_tno_pk PRIMARY KEY(tno)
);
INSERT INTO reserve_time VALUES(1,'10:00');
INSERT INTO reserve_time VALUES(2,'11:00');
INSERT INTO reserve_time VALUES(3,'12:00');
INSERT INTO reserve_time VALUES(4,'13:00');
INSERT INTO reserve_time VALUES(5,'14:00');
INSERT INTO reserve_time VALUES(6,'15:00');
INSERT INTO reserve_time VALUES(7,'16:00');
INSERT INTO reserve_time VALUES(8,'17:00');
INSERT INTO reserve_time VALUES(9,'18:00');
INSERT INTO reserve_time VALUES(10,'18:30');
INSERT INTO reserve_time VALUES(11,'19:00');
INSERT INTO reserve_time VALUES(12,'20:00');
INSERT INTO reserve_time VALUES(13,'21:00');
INSERT INTO reserve_time VALUES(14,'22:00');
INSERT INTO reserve_time VALUES(15,'22:30');
COMMIT;
select * from reserve_time;
select * from reserve_date;