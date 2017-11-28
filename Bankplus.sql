--------------------------------------------------------
--  File created - Saturday-November-25-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CUSTOMER
--------------------------------------------------------

  CREATE TABLE "BANKPLUS"."CUSTOMER" 
   (	"USER_ID" NUMBER, 
	"USERNAME" VARCHAR2(100 BYTE), 
	"PASSWD" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CUSTOMERINFO
--------------------------------------------------------

  CREATE TABLE "BANKPLUS"."CUSTOMERINFO" 
   (	"USER_ID" NUMBER, 
	"CMT" CHAR(11 BYTE), 
	"FIRST_NAME" VARCHAR2(20 BYTE), 
	"LAST_NAME" VARCHAR2(100 BYTE), 
	"GENDER" VARCHAR2(5 BYTE), 
	"ADDRESS" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table EMPLOYEES
--------------------------------------------------------

  CREATE TABLE "BANKPLUS"."EMPLOYEES" 
   (	"EMPLOYEE_ID" NUMBER, 
	"STORE_ID" NUMBER, 
	"EMPLOYEE_NAME" VARCHAR2(200 BYTE), 
	"GENDER" VARCHAR2(5 BYTE), 
	"ADDRESS" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table STORE
--------------------------------------------------------

  CREATE TABLE "BANKPLUS"."STORE" 
   (	"STORE_ID" NUMBER, 
	"STORE_NAME" VARCHAR2(100 BYTE), 
	"STORE_ADDRESS" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USER_HISTORY
--------------------------------------------------------

  CREATE TABLE "BANKPLUS"."USER_HISTORY" 
   (	"USER_HISTORY_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"CHANGE_DATE" DATE DEFAULT (current_timestamp), 
	"CHANGE_TYPE" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table WALLET
--------------------------------------------------------

  CREATE TABLE "BANKPLUS"."WALLET" 
   (	"USER_ID" NUMBER, 
	"TONGTIEN" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table WALLET_EXCHANGE
--------------------------------------------------------

  CREATE TABLE "BANKPLUS"."WALLET_EXCHANGE" 
   (	"WALLET_EXCHANGE_ID" NUMBER, 
	"USER_FROM" NUMBER, 
	"USER_TO" NUMBER, 
	"EMPLOYEE_ID" VARCHAR2(10 BYTE), 
	"EXCHANGE_TYPE" NUMBER, 
	"EXCHANGE_COST" NUMBER(*,0), 
	"EXCHANGE_NOTE" VARCHAR2(2000 BYTE), 
	"EXCHANGE_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table WALLET_HISTORY
--------------------------------------------------------

  CREATE TABLE "BANKPLUS"."WALLET_HISTORY" 
   (	"WALLET_HISTORY_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"CHANGE_TYPE" NUMBER(*,0), 
	"CHANGE_COST" NUMBER(*,0), 
	"CHANGE_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Sequence CUSTOMER_ID
--------------------------------------------------------

   CREATE SEQUENCE  "BANKPLUS"."CUSTOMER_ID"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 20 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence WALLETHISTORY_ID
--------------------------------------------------------

   CREATE SEQUENCE  "BANKPLUS"."WALLETHISTORY_ID"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 40 CACHE 20 NOORDER  NOCYCLE ;
REM INSERTING into BANKPLUS.CUSTOMER
SET DEFINE OFF;
Insert into BANKPLUS.CUSTOMER (USER_ID,USERNAME,PASSWD) values (1,'trile28','trile28');
Insert into BANKPLUS.CUSTOMER (USER_ID,USERNAME,PASSWD) values (0,'trile','trile');
Insert into BANKPLUS.CUSTOMER (USER_ID,USERNAME,PASSWD) values (2,'trile287','trile287');
REM INSERTING into BANKPLUS.CUSTOMERINFO
SET DEFINE OFF;
Insert into BANKPLUS.CUSTOMERINFO (USER_ID,CMT,FIRST_NAME,LAST_NAME,GENDER,ADDRESS) values (1,'212714166  ','Tri','Le','Name','Quang Ngai');
Insert into BANKPLUS.CUSTOMERINFO (USER_ID,CMT,FIRST_NAME,LAST_NAME,GENDER,ADDRESS) values (1,'dasdasdasda','tri','le','nam','QN');
Insert into BANKPLUS.CUSTOMERINFO (USER_ID,CMT,FIRST_NAME,LAST_NAME,GENDER,ADDRESS) values (2,'212121221  ','tri','le','nam','HCM');
REM INSERTING into BANKPLUS.EMPLOYEES
SET DEFINE OFF;
Insert into BANKPLUS.EMPLOYEES (EMPLOYEE_ID,STORE_ID,EMPLOYEE_NAME,GENDER,ADDRESS) values (1,1,'Mark ','Nam','America');
REM INSERTING into BANKPLUS.STORE
SET DEFINE OFF;
Insert into BANKPLUS.STORE (STORE_ID,STORE_NAME,STORE_ADDRESS) values (1,'The gioi di dong','Q7, TPHCM');
REM INSERTING into BANKPLUS.USER_HISTORY
SET DEFINE OFF;
REM INSERTING into BANKPLUS.WALLET
SET DEFINE OFF;
Insert into BANKPLUS.WALLET (USER_ID,TONGTIEN) values (1,2180000);
REM INSERTING into BANKPLUS.WALLET_EXCHANGE
SET DEFINE OFF;
Insert into BANKPLUS.WALLET_EXCHANGE (WALLET_EXCHANGE_ID,USER_FROM,USER_TO,EMPLOYEE_ID,EXCHANGE_TYPE,EXCHANGE_COST,EXCHANGE_NOTE,EXCHANGE_DATE) values (2,1,null,null,2,2400000,'ahyhy',null);
Insert into BANKPLUS.WALLET_EXCHANGE (WALLET_EXCHANGE_ID,USER_FROM,USER_TO,EMPLOYEE_ID,EXCHANGE_TYPE,EXCHANGE_COST,EXCHANGE_NOTE,EXCHANGE_DATE) values (3,1,null,null,2,20000,'ahyhy',null);
Insert into BANKPLUS.WALLET_EXCHANGE (WALLET_EXCHANGE_ID,USER_FROM,USER_TO,EMPLOYEE_ID,EXCHANGE_TYPE,EXCHANGE_COST,EXCHANGE_NOTE,EXCHANGE_DATE) values (1,1,null,null,1,200000,'ahyhy',null);
REM INSERTING into BANKPLUS.WALLET_HISTORY
SET DEFINE OFF;
Insert into BANKPLUS.WALLET_HISTORY (WALLET_HISTORY_ID,USER_ID,CHANGE_TYPE,CHANGE_COST,CHANGE_DATE) values (26,1,2,20000,to_date('22-NOV-17','DD-MON-RR'));
Insert into BANKPLUS.WALLET_HISTORY (WALLET_HISTORY_ID,USER_ID,CHANGE_TYPE,CHANGE_COST,CHANGE_DATE) values (1,1,1,200000,null);
--------------------------------------------------------
--  DDL for Trigger T_HISTORY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "BANKPLUS"."T_HISTORY" 
after update 
on wallet
for each row
begin 
    if :OLD.tongtien < :NEW.tongtien then
        insert into wallet_history values (WALLETHISTORY_ID.NEXTVAL, :OLD.user_id, 2, :NEW.tongtien - :OLD.tongtien, current_timestamp);
    end if;
    if :OLD.tongtien > :NEW.tongtien then
        insert into wallet_history values (WALLETHISTORY_ID.NEXTVAL, :OLD.user_id, 1, :OLD.tongtien - :NEW.tongtien, current_timestamp);
    end if;
end;
/
ALTER TRIGGER "BANKPLUS"."T_HISTORY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_WALLET
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "BANKPLUS"."T_WALLET" 
after insert 
on wallet_exchange
for each row
declare v_tongtien DECIMAL;
begin 
    select tongtien into v_tongtien from wallet where user_id = :NEW.user_from;
    if :NEW.exchange_type=1 then
             update wallet set tongtien = tongtien + :NEW.exchange_cost where user_id = :NEW.user_from;
             end if;
    if :NEW.exchange_type=3 and :NEW.exchange_cost < v_tongtien then      
             update wallet set tongtien = tongtien - :NEW.exchange_cost where user_id = :NEW.user_from;
             update wallet set tongtien = tongtien + :NEW.exchange_cost where user_id = :NEW.user_to;
    end if;
    if :NEW.exchange_type=2 and :NEW.exchange_cost < v_tongtien then
             update wallet set tongtien = tongtien - :NEW.exchange_cost where user_id = :NEW.user_from;
    end if;
end;
/
ALTER TRIGGER "BANKPLUS"."T_WALLET" ENABLE;
--------------------------------------------------------
--  DDL for Function GETNEWID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "BANKPLUS"."GETNEWID" (user_name varchar2) 
return number as id_res number;
begin
    select user_id into id_res from customer WHERE ROWNUM=1 and user_name= username
    order by user_id desc ;
    return id_res;
end getNewId;

/
--------------------------------------------------------
--  DDL for Function SIGNIN
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "BANKPLUS"."SIGNIN" (username IN varchar2, password varchar2, cmt char, firstname varchar2, lastname varchar2, gender varchar2, address varchar)
return varchar2 is PRAGMA AUTONOMOUS_TRANSACTION;
begin 
    if username is not null then
        insert into customer values (customer_id.NEXTVAL, username, password);
        insert into CUSTOMERINFO values (getNewId(username), cmt, firstname, lastname, gender, address);
        commit;
        return 'done';
    else 
        return 'not done';
    end if;    
end;

/
--------------------------------------------------------
--  Constraints for Table WALLET_HISTORY
--------------------------------------------------------

  ALTER TABLE "BANKPLUS"."WALLET_HISTORY" MODIFY ("WALLET_HISTORY_ID" NOT NULL ENABLE);
 
  ALTER TABLE "BANKPLUS"."WALLET_HISTORY" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "BANKPLUS"."WALLET_HISTORY" ADD PRIMARY KEY ("WALLET_HISTORY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STORE
--------------------------------------------------------

  ALTER TABLE "BANKPLUS"."STORE" MODIFY ("STORE_ID" NOT NULL ENABLE);
 
  ALTER TABLE "BANKPLUS"."STORE" ADD PRIMARY KEY ("STORE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USER_HISTORY
--------------------------------------------------------

  ALTER TABLE "BANKPLUS"."USER_HISTORY" MODIFY ("USER_HISTORY_ID" NOT NULL ENABLE);
 
  ALTER TABLE "BANKPLUS"."USER_HISTORY" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "BANKPLUS"."USER_HISTORY" ADD PRIMARY KEY ("USER_HISTORY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CUSTOMER
--------------------------------------------------------

  ALTER TABLE "BANKPLUS"."CUSTOMER" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "BANKPLUS"."CUSTOMER" MODIFY ("USERNAME" NOT NULL ENABLE);
 
  ALTER TABLE "BANKPLUS"."CUSTOMER" MODIFY ("PASSWD" NOT NULL ENABLE);
 
  ALTER TABLE "BANKPLUS"."CUSTOMER" ADD PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "BANKPLUS"."EMPLOYEES" MODIFY ("EMPLOYEE_ID" NOT NULL ENABLE);
 
  ALTER TABLE "BANKPLUS"."EMPLOYEES" MODIFY ("STORE_ID" NOT NULL ENABLE);
 
  ALTER TABLE "BANKPLUS"."EMPLOYEES" ADD PRIMARY KEY ("EMPLOYEE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table WALLET
--------------------------------------------------------

  ALTER TABLE "BANKPLUS"."WALLET" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CUSTOMERINFO
--------------------------------------------------------

  ALTER TABLE "BANKPLUS"."CUSTOMERINFO" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table WALLET_EXCHANGE
--------------------------------------------------------

  ALTER TABLE "BANKPLUS"."WALLET_EXCHANGE" MODIFY ("WALLET_EXCHANGE_ID" NOT NULL ENABLE);
 
  ALTER TABLE "BANKPLUS"."WALLET_EXCHANGE" ADD CHECK (exchange_type = 1 or exchange_type = 2 or exchange_type = 3) ENABLE;
 
  ALTER TABLE "BANKPLUS"."WALLET_EXCHANGE" ADD PRIMARY KEY ("WALLET_EXCHANGE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CUSTOMERINFO
--------------------------------------------------------

  ALTER TABLE "BANKPLUS"."CUSTOMERINFO" ADD CONSTRAINT "FK_CI" FOREIGN KEY ("USER_ID")
	  REFERENCES "BANKPLUS"."CUSTOMER" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "BANKPLUS"."EMPLOYEES" ADD CONSTRAINT "FK_EMP" FOREIGN KEY ("STORE_ID")
	  REFERENCES "BANKPLUS"."STORE" ("STORE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table USER_HISTORY
--------------------------------------------------------

  ALTER TABLE "BANKPLUS"."USER_HISTORY" ADD CONSTRAINT "FK_CU" FOREIGN KEY ("USER_ID")
	  REFERENCES "BANKPLUS"."CUSTOMER" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table WALLET
--------------------------------------------------------

  ALTER TABLE "BANKPLUS"."WALLET" ADD CONSTRAINT "FK_WACUS" FOREIGN KEY ("USER_ID")
	  REFERENCES "BANKPLUS"."CUSTOMER" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table WALLET_HISTORY
--------------------------------------------------------

  ALTER TABLE "BANKPLUS"."WALLET_HISTORY" ADD CONSTRAINT "FK_WH" FOREIGN KEY ("USER_ID")
	  REFERENCES "BANKPLUS"."CUSTOMER" ("USER_ID") ENABLE;
