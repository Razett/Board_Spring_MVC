--------------------------------------------------------
--  DDL for Table TBL_ACC_LOG
--------------------------------------------------------

  CREATE TABLE "BOOK_EX"."TBL_ACC_LOG" 
   (	"ANO" NUMBER(10,0), 
	"ACCDATE" DATE DEFAULT sysdate, 
	"ACCCOUNT" NUMBER(20,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into BOOK_EX.TBL_ACC_LOG
SET DEFINE OFF;
Insert into BOOK_EX.TBL_ACC_LOG (ANO,ACCDATE,ACCCOUNT) values (2,to_date('24/05/08','RR/MM/DD'),2063);
Insert into BOOK_EX.TBL_ACC_LOG (ANO,ACCDATE,ACCCOUNT) values (21,to_date('24/05/15','RR/MM/DD'),1786);
Insert into BOOK_EX.TBL_ACC_LOG (ANO,ACCDATE,ACCCOUNT) values (22,to_date('24/05/16','RR/MM/DD'),1002);
Insert into BOOK_EX.TBL_ACC_LOG (ANO,ACCDATE,ACCCOUNT) values (4,to_date('24/05/10','RR/MM/DD'),4198);
Insert into BOOK_EX.TBL_ACC_LOG (ANO,ACCDATE,ACCCOUNT) values (3,to_date('24/05/09','RR/MM/DD'),2194);
Insert into BOOK_EX.TBL_ACC_LOG (ANO,ACCDATE,ACCCOUNT) values (5,to_date('24/05/11','RR/MM/DD'),2341);
Insert into BOOK_EX.TBL_ACC_LOG (ANO,ACCDATE,ACCCOUNT) values (6,to_date('24/05/12','RR/MM/DD'),2178);
Insert into BOOK_EX.TBL_ACC_LOG (ANO,ACCDATE,ACCCOUNT) values (7,to_date('24/05/13','RR/MM/DD'),3532);
Insert into BOOK_EX.TBL_ACC_LOG (ANO,ACCDATE,ACCCOUNT) values (8,to_date('24/05/14','RR/MM/DD'),4196);
--------------------------------------------------------
--  DDL for Index TBL_ACC_LOG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOOK_EX"."TBL_ACC_LOG_PK" ON "BOOK_EX"."TBL_ACC_LOG" ("ANO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table TBL_ACC_LOG
--------------------------------------------------------

  ALTER TABLE "BOOK_EX"."TBL_ACC_LOG" MODIFY ("ACCCOUNT" NOT NULL ENABLE);
  ALTER TABLE "BOOK_EX"."TBL_ACC_LOG" ADD CONSTRAINT "TBL_ACC_LOG_PK" PRIMARY KEY ("ANO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BOOK_EX"."TBL_ACC_LOG" MODIFY ("ACCDATE" NOT NULL ENABLE);
  ALTER TABLE "BOOK_EX"."TBL_ACC_LOG" MODIFY ("ANO" NOT NULL ENABLE);

--------------------------------------------------------
--  DDL for Table TBL_BOARD
--------------------------------------------------------

  CREATE TABLE "BOOK_EX"."TBL_BOARD" 
   (	"BNO" NUMBER(10,0), 
	"TITLE" VARCHAR2(200 BYTE), 
	"CONTENT" VARCHAR2(2000 BYTE), 
	"WRITER" VARCHAR2(50 BYTE), 
	"REGDATE" DATE DEFAULT sysdate, 
	"UPDATEDATE" DATE DEFAULT sysdate, 
	"IP" VARCHAR2(50 BYTE), 
	"VIEWS" NUMBER(10,0) DEFAULT 0, 
	"LIKES" NUMBER(10,0) DEFAULT 0, 
	"PASSWORD" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "BOOK_EX"."TBL_BOARD"."BNO" IS '글 번호';
   COMMENT ON COLUMN "BOOK_EX"."TBL_BOARD"."TITLE" IS '게시글 제목';
   COMMENT ON COLUMN "BOOK_EX"."TBL_BOARD"."CONTENT" IS '게시글 내용';
   COMMENT ON COLUMN "BOOK_EX"."TBL_BOARD"."WRITER" IS '작성자';
   COMMENT ON COLUMN "BOOK_EX"."TBL_BOARD"."REGDATE" IS '등록일';
   COMMENT ON COLUMN "BOOK_EX"."TBL_BOARD"."UPDATEDATE" IS '수정일';
   COMMENT ON COLUMN "BOOK_EX"."TBL_BOARD"."IP" IS 'IP주소';
   COMMENT ON COLUMN "BOOK_EX"."TBL_BOARD"."VIEWS" IS '조회수';
   COMMENT ON COLUMN "BOOK_EX"."TBL_BOARD"."LIKES" IS '좋아요 수';
--------------------------------------------------------
--  DDL for Index PK_BOARD
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOOK_EX"."PK_BOARD" ON "BOOK_EX"."TBL_BOARD" ("BNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TBL_BOARD_REGDATE
--------------------------------------------------------

  CREATE INDEX "BOOK_EX"."TBL_BOARD_REGDATE" ON "BOOK_EX"."TBL_BOARD" ("REGDATE" DESC) 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table TBL_BOARD
--------------------------------------------------------

  ALTER TABLE "BOOK_EX"."TBL_BOARD" MODIFY ("LIKES" NOT NULL ENABLE);
  ALTER TABLE "BOOK_EX"."TBL_BOARD" MODIFY ("VIEWS" NOT NULL ENABLE);
  ALTER TABLE "BOOK_EX"."TBL_BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY ("BNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BOOK_EX"."TBL_BOARD" MODIFY ("WRITER" NOT NULL ENABLE);
  ALTER TABLE "BOOK_EX"."TBL_BOARD" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "BOOK_EX"."TBL_BOARD" MODIFY ("TITLE" NOT NULL ENABLE);

--------------------------------------------------------
--  DDL for Table TBL_REPLY
--------------------------------------------------------

  CREATE TABLE "BOOK_EX"."TBL_REPLY" 
   (	"RNO" NUMBER(10,0), 
	"BNO" NUMBER(10,0), 
	"REPLY" VARCHAR2(1000 BYTE), 
	"REPLYER" VARCHAR2(50 BYTE), 
	"REPLYDATE" DATE DEFAULT sysdate, 
	"UPDATEDATE" DATE DEFAULT sysdate, 
	"IP" VARCHAR2(50 BYTE), 
	"PASSWORD" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "BOOK_EX"."TBL_REPLY"."RNO" IS '댓글번호';
   COMMENT ON COLUMN "BOOK_EX"."TBL_REPLY"."BNO" IS '게시글번호';
   COMMENT ON COLUMN "BOOK_EX"."TBL_REPLY"."REPLY" IS '댓글내용';
   COMMENT ON COLUMN "BOOK_EX"."TBL_REPLY"."REPLYER" IS '댓글작성자';
   COMMENT ON COLUMN "BOOK_EX"."TBL_REPLY"."REPLYDATE" IS '댓글작성일';
   COMMENT ON COLUMN "BOOK_EX"."TBL_REPLY"."UPDATEDATE" IS '댓글수정일';
   COMMENT ON COLUMN "BOOK_EX"."TBL_REPLY"."IP" IS 'IP';
--------------------------------------------------------
--  DDL for Index TBL_REPLY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOOK_EX"."TBL_REPLY_PK" ON "BOOK_EX"."TBL_REPLY" ("RNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TBL_REPLY_BNO_IDX
--------------------------------------------------------

  CREATE INDEX "BOOK_EX"."TBL_REPLY_BNO_IDX" ON "BOOK_EX"."TBL_REPLY" ("BNO" DESC, "RNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table TBL_REPLY
--------------------------------------------------------

  ALTER TABLE "BOOK_EX"."TBL_REPLY" ADD CONSTRAINT "TBL_REPLY_PK" PRIMARY KEY ("RNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BOOK_EX"."TBL_REPLY" MODIFY ("REPLYER" NOT NULL ENABLE);
  ALTER TABLE "BOOK_EX"."TBL_REPLY" MODIFY ("REPLY" NOT NULL ENABLE);
  ALTER TABLE "BOOK_EX"."TBL_REPLY" MODIFY ("BNO" NOT NULL ENABLE);
  ALTER TABLE "BOOK_EX"."TBL_REPLY" MODIFY ("RNO" NOT NULL ENABLE);

--------------------------------------------------------
--  DDL for Sequence SEQ_ACC
--------------------------------------------------------

   CREATE SEQUENCE  "BOOK_EX"."SEQ_ACC"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence SEQ_BOARD
--------------------------------------------------------

   CREATE SEQUENCE  "BOOK_EX"."SEQ_BOARD"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6708 NOCACHE  NOORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence SEQ_REPLY
--------------------------------------------------------

   CREATE SEQUENCE  "BOOK_EX"."SEQ_REPLY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 101 CACHE 20 NOORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Procedure LOG_WEBPAGE_ACCESS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "BOOK_EX"."LOG_WEBPAGE_ACCESS" (
    p_page_url IN VARCHAR2,
    p_user_ip IN VARCHAR2,
    p_user_agent IN VARCHAR2
)
AS
BEGIN
    INSERT INTO webpage_access_log(access_id, page_url, access_time, user_ip, user_agent)
    VALUES (webpage_access_log_seq.NEXTVAL, p_page_url, SYSTIMESTAMP, p_user_ip, p_user_agent);
    COMMIT;
END;

DECLARE
    v_count NUMBER;
BEGIN
    -- 해당 날짜의 접속 횟수를 확인합니다.
    EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM tbl_acc_log WHERE TO_CHAR(accdate, ''yyyy-MM-dd'') = TO_CHAR(SYSDATE, ''yyyy-MM-dd'')' INTO v_count;

    -- 만약 해당 날짜의 데이터가 없다면 새로운 레코드를 삽입합니다.
    IF v_count = 0 THEN
        INSERT INTO tbl_acc_log(ano, accdate, acccount) VALUES (seq_acc.NEXTVAL, SYSDATE, 1);
    -- 해당 날짜의 데이터가 이미 있다면 접속 횟수를 증가시킵니다.
    ELSE
        UPDATE tbl_acc_log SET acccount = acccount + 1 WHERE TO_CHAR(accdate, 'yyyy-MM-dd') = TO_CHAR(SYSDATE, 'yyyy-MM-dd');
    END IF;
END;

/