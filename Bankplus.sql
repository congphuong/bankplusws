--------------------------------------------------------
--  File created - Tuesday-December-12-2017
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View V_DETAIL
--------------------------------------------------------

CREATE OR REPLACE FORCE VIEW "BANKPLUS"."V_DETAIL" ("USER_ID", "USERNAME", "NAME", "TONGTIEN") AS
  select c.user_id, c.USERNAME, concat(concat(ci.first_name, ' '), ci.last_name) name, w.TONGTIEN
  from CUSTOMER c inner join WALLET w on c.USER_ID = w.USER_ID
    inner join CUSTOMERINFO ci on c.USER_ID = ci.USER_ID
;
--------------------------------------------------------
--  DDL for View V_HISTORY
--------------------------------------------------------

CREATE OR REPLACE FORCE VIEW "BANKPLUS"."V_HISTORY" ("WALLET_HISTORY_ID", "USER_ID", "CHANGE_TYPE", "CHANGE_COST", "CHANGE_DATE", "NAME_CUST") AS
  select wh."WALLET_HISTORY_ID",wh."USER_ID",wh."CHANGE_TYPE",wh."CHANGE_COST",wh."CHANGE_DATE", concat(concat(ci.first_name, ' '), ci.last_name) as name_cust
  from wallet_history wh inner join customerinfo ci on wh.user_id = ci.user_id
  order by wh.WALLET_HISTORY_ID desc
;
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

CREATE SEQUENCE  "BANKPLUS"."CUSTOMER_ID"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 40 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence WALLETEXCHANGE_ID
--------------------------------------------------------

CREATE SEQUENCE  "BANKPLUS"."WALLETEXCHANGE_ID"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 40 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence WALLETHISTORY_ID
--------------------------------------------------------

CREATE SEQUENCE  "BANKPLUS"."WALLETHISTORY_ID"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 100 CACHE 20 NOORDER  NOCYCLE ;
REM INSERTING into BANKPLUS.CUSTOMER
SET DEFINE OFF;
Insert into BANKPLUS.CUSTOMER (USER_ID,USERNAME,PASSWD) values (1,'trile28','$2a$10$p7g5HFjV0RGDDSxffYZneuC3uTkNsPkam5RdrECwej02iQ2jUYznq');
Insert into BANKPLUS.CUSTOMER (USER_ID,USERNAME,PASSWD) values (2,'trile287','trile287');
Insert into BANKPLUS.CUSTOMER (USER_ID,USERNAME,PASSWD) values (20,'congphuong123','$2a$10$DTWIcfaXsDOqOvvio7eOYuGLOvYNPf4GribBLP1VkWQtU/3kryUKK');
Insert into BANKPLUS.CUSTOMER (USER_ID,USERNAME,PASSWD) values (23,'nguyenvana1111','$2a$10$4B3l7UV/QT4ocv6dOc0yMeKfb8Uw4/hhzCf.ANmFEI8onRliySnwm');
Insert into BANKPLUS.CUSTOMER (USER_ID,USERNAME,PASSWD) values (3,'lehanhtri28','1123123');
Insert into BANKPLUS.CUSTOMER (USER_ID,USERNAME,PASSWD) values (24,'admin','$2a$10$8OFU8FsFu5I2J5kQrDxlf.vmsBRoQmfyUMW160IiZzpokpqBX87Oa');
REM INSERTING into BANKPLUS.CUSTOMERINFO
SET DEFINE OFF;
Insert into BANKPLUS.CUSTOMERINFO (USER_ID,CMT,FIRST_NAME,LAST_NAME,GENDER,ADDRESS) values (1,'212714166  ','Tri','Le','Name','Quang Ngai');
Insert into BANKPLUS.CUSTOMERINFO (USER_ID,CMT,FIRST_NAME,LAST_NAME,GENDER,ADDRESS) values (2,'asdasd     ','asdasda ','asdasd','nam','HCM');
Insert into BANKPLUS.CUSTOMERINFO (USER_ID,CMT,FIRST_NAME,LAST_NAME,GENDER,ADDRESS) values (20,'213123123  ','Phuong','Cong','Nam','Quang Nam');
Insert into BANKPLUS.CUSTOMERINFO (USER_ID,CMT,FIRST_NAME,LAST_NAME,GENDER,ADDRESS) values (23,'213123123  ','Phuong','Cong Cong','Nam','Quang Nam');
Insert into BANKPLUS.CUSTOMERINFO (USER_ID,CMT,FIRST_NAME,LAST_NAME,GENDER,ADDRESS) values (24,'123123131  ','ADMIN',null,null,null);
REM INSERTING into BANKPLUS.EMPLOYEES
SET DEFINE OFF;
Insert into BANKPLUS.EMPLOYEES (EMPLOYEE_ID,STORE_ID,EMPLOYEE_NAME,GENDER,ADDRESS) values (1,1,'Mark ','Nam','America');
Insert into BANKPLUS.EMPLOYEES (EMPLOYEE_ID,STORE_ID,EMPLOYEE_NAME,GENDER,ADDRESS) values (2,1,'Steve Jobs','Nam','Amreica ');
REM INSERTING into BANKPLUS.STORE
SET DEFINE OFF;
Insert into BANKPLUS.STORE (STORE_ID,STORE_NAME,STORE_ADDRESS) values (1,'The gioi di dong','Q7, TPHCM');
REM INSERTING into BANKPLUS.WALLET
SET DEFINE OFF;
Insert into BANKPLUS.WALLET (USER_ID,TONGTIEN) values (1,2100000);
Insert into BANKPLUS.WALLET (USER_ID,TONGTIEN) values (20,0);
Insert into BANKPLUS.WALLET (USER_ID,TONGTIEN) values (23,0);
Insert into BANKPLUS.WALLET (USER_ID,TONGTIEN) values (3,500000);
Insert into BANKPLUS.WALLET (USER_ID,TONGTIEN) values (24,0);
REM INSERTING into BANKPLUS.WALLET_EXCHANGE
SET DEFINE OFF;
Insert into BANKPLUS.WALLET_EXCHANGE (WALLET_EXCHANGE_ID,USER_FROM,USER_TO,EMPLOYEE_ID,EXCHANGE_TYPE,EXCHANGE_COST,EXCHANGE_NOTE,EXCHANGE_DATE) values (2,1,null,null,2,2400000,'ahyhy',null);
Insert into BANKPLUS.WALLET_EXCHANGE (WALLET_EXCHANGE_ID,USER_FROM,USER_TO,EMPLOYEE_ID,EXCHANGE_TYPE,EXCHANGE_COST,EXCHANGE_NOTE,EXCHANGE_DATE) values (3,1,null,null,2,20000,'ahyhy',null);
Insert into BANKPLUS.WALLET_EXCHANGE (WALLET_EXCHANGE_ID,USER_FROM,USER_TO,EMPLOYEE_ID,EXCHANGE_TYPE,EXCHANGE_COST,EXCHANGE_NOTE,EXCHANGE_DATE) values (1,1,null,null,1,200000,'ahyhy',null);
Insert into BANKPLUS.WALLET_EXCHANGE (WALLET_EXCHANGE_ID,USER_FROM,USER_TO,EMPLOYEE_ID,EXCHANGE_TYPE,EXCHANGE_COST,EXCHANGE_NOTE,EXCHANGE_DATE) values (20,1,null,'1',2,200000,'Nop tien',to_date('11-DEC-17','DD-MON-RR'));
Insert into BANKPLUS.WALLET_EXCHANGE (WALLET_EXCHANGE_ID,USER_FROM,USER_TO,EMPLOYEE_ID,EXCHANGE_TYPE,EXCHANGE_COST,EXCHANGE_NOTE,EXCHANGE_DATE) values (21,1,3,null,3,500000,'Chuyen khoan',to_date('11-DEC-17','DD-MON-RR'));
Insert into BANKPLUS.WALLET_EXCHANGE (WALLET_EXCHANGE_ID,USER_FROM,USER_TO,EMPLOYEE_ID,EXCHANGE_TYPE,EXCHANGE_COST,EXCHANGE_NOTE,EXCHANGE_DATE) values (0,1,null,'1',1,200000,'hello',to_date('01-DEC-17','DD-MON-RR'));
Insert into BANKPLUS.WALLET_EXCHANGE (WALLET_EXCHANGE_ID,USER_FROM,USER_TO,EMPLOYEE_ID,EXCHANGE_TYPE,EXCHANGE_COST,EXCHANGE_NOTE,EXCHANGE_DATE) values (4,1,null,'1',2,200000,'Nop tien',to_date('01-DEC-17','DD-MON-RR'));
Insert into BANKPLUS.WALLET_EXCHANGE (WALLET_EXCHANGE_ID,USER_FROM,USER_TO,EMPLOYEE_ID,EXCHANGE_TYPE,EXCHANGE_COST,EXCHANGE_NOTE,EXCHANGE_DATE) values (5,1,null,'1',1,600000,'Nop tien',to_date('01-DEC-17','DD-MON-RR'));
REM INSERTING into BANKPLUS.WALLET_HISTORY
SET DEFINE OFF;
Insert into BANKPLUS.WALLET_HISTORY (WALLET_HISTORY_ID,USER_ID,CHANGE_TYPE,CHANGE_COST,CHANGE_DATE) values (26,1,2,20000,to_date('22-NOV-17','DD-MON-RR'));
Insert into BANKPLUS.WALLET_HISTORY (WALLET_HISTORY_ID,USER_ID,CHANGE_TYPE,CHANGE_COST,CHANGE_DATE) values (80,1,1,200000,to_date('11-DEC-17','DD-MON-RR'));
Insert into BANKPLUS.WALLET_HISTORY (WALLET_HISTORY_ID,USER_ID,CHANGE_TYPE,CHANGE_COST,CHANGE_DATE) values (81,1,2,200000,to_date('11-DEC-17','DD-MON-RR'));
Insert into BANKPLUS.WALLET_HISTORY (WALLET_HISTORY_ID,USER_ID,CHANGE_TYPE,CHANGE_COST,CHANGE_DATE) values (82,1,1,500000,to_date('11-DEC-17','DD-MON-RR'));
Insert into BANKPLUS.WALLET_HISTORY (WALLET_HISTORY_ID,USER_ID,CHANGE_TYPE,CHANGE_COST,CHANGE_DATE) values (83,3,2,500000,to_date('11-DEC-17','DD-MON-RR'));
Insert into BANKPLUS.WALLET_HISTORY (WALLET_HISTORY_ID,USER_ID,CHANGE_TYPE,CHANGE_COST,CHANGE_DATE) values (40,1,2,20000,to_date('27-NOV-17','DD-MON-RR'));
Insert into BANKPLUS.WALLET_HISTORY (WALLET_HISTORY_ID,USER_ID,CHANGE_TYPE,CHANGE_COST,CHANGE_DATE) values (60,1,2,200000,to_date('01-DEC-17','DD-MON-RR'));
Insert into BANKPLUS.WALLET_HISTORY (WALLET_HISTORY_ID,USER_ID,CHANGE_TYPE,CHANGE_COST,CHANGE_DATE) values (61,1,1,200000,to_date('01-DEC-17','DD-MON-RR'));
Insert into BANKPLUS.WALLET_HISTORY (WALLET_HISTORY_ID,USER_ID,CHANGE_TYPE,CHANGE_COST,CHANGE_DATE) values (62,1,1,200000,to_date('01-DEC-17','DD-MON-RR'));
Insert into BANKPLUS.WALLET_HISTORY (WALLET_HISTORY_ID,USER_ID,CHANGE_TYPE,CHANGE_COST,CHANGE_DATE) values (63,1,2,200000,to_date('01-DEC-17','DD-MON-RR'));
Insert into BANKPLUS.WALLET_HISTORY (WALLET_HISTORY_ID,USER_ID,CHANGE_TYPE,CHANGE_COST,CHANGE_DATE) values (64,1,2,600000,to_date('01-DEC-17','DD-MON-RR'));
Insert into BANKPLUS.WALLET_HISTORY (WALLET_HISTORY_ID,USER_ID,CHANGE_TYPE,CHANGE_COST,CHANGE_DATE) values (65,1,1,600000,to_date('01-DEC-17','DD-MON-RR'));
--------------------------------------------------------
--  DDL for Index USER_UNIQUE
--------------------------------------------------------

CREATE UNIQUE INDEX "BANKPLUS"."USER_UNIQUE" ON "BANKPLUS"."CUSTOMER" ("USERNAME")
PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CINFO
--------------------------------------------------------

CREATE UNIQUE INDEX "BANKPLUS"."CINFO" ON "BANKPLUS"."CUSTOMERINFO" ("USER_ID")
PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
TABLESPACE "USERS" ;
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
--  DDL for Trigger T_NEWWALLET
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "BANKPLUS"."T_NEWWALLET"
  after insert
  on customer
  for each row
  begin
    insert into Wallet values (:NEW.user_id, 0);
  end;
/
ALTER TRIGGER "BANKPLUS"."T_NEWWALLET" ENABLE;
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

create or replace trigger t_history
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

CREATE SEQUENCE customer_id MINVALUE 0 START WITH 0 INCREMENT BY 1 CACHE 20;


CREATE SEQUENCE walletexchange_id MINVALUE 0 START WITH 5 INCREMENT BY 1 CACHE 20;

create or replace function exchange(id_employee number, id_customer number, exchange_money number, exchange_type number, exchange_note nvarchar2)
  return number as result number;
  begin
    insert into wallet_exchange(wallet_exchange_id, user_from, employee_id, EXCHANGE_COST, EXCHANGE_TYPE, EXCHANGE_NOTE, EXCHANGE_DATE)
    values (WALLETEXCHANGE_ID.NEXTVAL, id_customer, id_employee, exchange_money, exchange_type, exchange_note, current_timestamp);
    commit;
    return 1;
  end;

insert into wallet_exchange(wallet_exchange_id, user_from, employee_id, EXCHANGE_COST, EXCHANGE_TYPE, EXCHANGE_NOTE, EXCHANGE_DATE)
values (WALLETEXCHANGE_ID.NEXTVAL, 1, 1, 200000, 1, 'hello', current_timestamp);


create view v_history as
  select wh.*, concat(concat(ci.first_name, ' '), ci.last_name) as name_cust
  from wallet_history wh inner join customerinfo ci on wh.user_id = ci.user_id;

create or replace function transfer(id_from number, id_to number, transfer_money number, exchange_type number, exchange_note nvarchar2)
  return number as result number;
  begin
    insert into wallet_exchange(wallet_exchange_id, user_from, user_to, EXCHANGE_COST, EXCHANGE_TYPE, EXCHANGE_NOTE, EXCHANGE_DATE)
    values (WALLETEXCHANGE_ID.NEXTVAL, id_from, id_to, transfer_money, exchange_type, exchange_note, current_timestamp);
    commit;
    return 1;
  end;

create or replace trigger T_newWallet
  after insert
  on customer
  for each row
  begin
    insert into Wallet values (:NEW.user_id, 0);
  end;

create or replace function login(user_name varchar2)
  return varchar2 as pass_word customer.passwd%type;
  begin
    select passwd into pass_word from customer where username = user_name;
    return pass_word;
  end;


/
ALTER TRIGGER "BANKPLUS"."T_WALLET" ENABLE;
--------------------------------------------------------
--  DDL for Function CHANGEINFO
--------------------------------------------------------

CREATE OR REPLACE FUNCTION "BANKPLUS"."CHANGEINFO" (idCustomer number, identify CUSTOMERINFO.CMT%TYPE, firstName CUSTOMERINFO.FIRST_NAME%TYPE, lastName CUSTOMERINFO.LAST_NAME%TYPE, gender1 CUSTOMERINFO.GENDER%TYPE, address1 CUSTOMERINFO.ADDRESS%TYPE)
  return number as result number;
  begin
    result := 0;
    select user_id into result from CUSTOMER c where c.user_id = idCustomer;
    if result = 0 then return 0;
    else
      update CUSTOMERINFO set cmt = identify, first_Name = firstname, last_Name = lastname, gender = gender1, address = address1 where user_id = idCustomer;
      return 1;
    end if;
  end;

/
--------------------------------------------------------
--  DDL for Function EXCHANGE
--------------------------------------------------------

CREATE OR REPLACE FUNCTION "BANKPLUS"."EXCHANGE" (id_employee number, id_customer number, exchange_money number, exchange_type number, exchange_note nvarchar2)
  return number as result number;
  begin
    insert into wallet_exchange(wallet_exchange_id, user_from, employee_id, EXCHANGE_COST, EXCHANGE_TYPE, EXCHANGE_NOTE, EXCHANGE_DATE)
    values (WALLETEXCHANGE_ID.NEXTVAL, id_customer, id_employee, exchange_money, exchange_type, exchange_note, current_timestamp);
    commit;
    return 1;
  end;

/
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
--  DDL for Function LOGIN
--------------------------------------------------------

CREATE OR REPLACE FUNCTION "BANKPLUS"."LOGIN" (user_name varchar2)
  return varchar2 as pass_word customer.passwd%type;
  begin
    select passwd into pass_word from customer where username = user_name;
    return pass_word;
  end;

/
--------------------------------------------------------
--  DDL for Function REGISTER
--------------------------------------------------------

CREATE OR REPLACE FUNCTION "BANKPLUS"."REGISTER" (username IN varchar2, password varchar2, cmt char, firstname varchar2, lastname varchar2, gender varchar2, address varchar)
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
--  DDL for Function TRANSFER
--------------------------------------------------------

CREATE OR REPLACE FUNCTION "BANKPLUS"."TRANSFER" (id_from number, id_to number, transfer_money number, exchange_type number, exchange_note nvarchar2)
  return number as result number;
  begin
    insert into wallet_exchange(wallet_exchange_id, user_from, user_to, EXCHANGE_COST, EXCHANGE_TYPE, EXCHANGE_NOTE, EXCHANGE_DATE)
    values (WALLETEXCHANGE_ID.NEXTVAL, id_from, id_to, transfer_money, exchange_type, exchange_note, current_timestamp);
    commit;
    return 1;
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

ALTER TABLE "BANKPLUS"."CUSTOMER" ADD CONSTRAINT "USER_UNIQUE" UNIQUE ("USERNAME")
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

ALTER TABLE "BANKPLUS"."CUSTOMERINFO" ADD CONSTRAINT "CINFO" PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;

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
--  Ref Constraints for Table WALLET
--------------------------------------------------------

ALTER TABLE "BANKPLUS"."WALLET" ADD CONSTRAINT "FK_WACUS" FOREIGN KEY ("USER_ID")
REFERENCES "BANKPLUS"."CUSTOMER" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table WALLET_HISTORY
--------------------------------------------------------

ALTER TABLE "BANKPLUS"."WALLET_HISTORY" ADD CONSTRAINT "FK_WH" FOREIGN KEY ("USER_ID")
REFERENCES "BANKPLUS"."CUSTOMER" ("USER_ID") ENABLE;
