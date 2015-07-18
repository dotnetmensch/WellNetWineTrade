CREATE TABLE USER_ACCOUNT(
  USER_ID NUMBER(10) NOT NULL,
  USERNAME VARCHAR2(20) NOT NULL,
  ACCOUNT_PASSWORD VARCHAR2(255) NOT NULL,
  ACCOUNT_ID NUMBER(10) NOT NULL,
  CONSTRAINT PK_USER PRIMARY KEY(USER_ID));
  
CREATE TABLE BUSINESS_ACCOUNT(
  ACCOUNT_ID NUMBER(10) NOT NULL,
  COMPANY_NAME VARCHAR2(50) NOT NULL,
  ADDRESS VARCHAR2(100) NOT NULL,
  PHONE VARCHAR2(15) NOT NULL,
  EMAIL VARCHAR2(50) NOT NULL,
  APPROVED CHAR CHECK (APPROVED IN ('N', 'Y')) NOT NULL,
  ACCOUNT_TYPE_ID NUMBER(10) NOT NULL,
  CONSTRAINT PK_ACCOUNT PRIMARY KEY(ACCOUNT_ID));
  
CREATE TABLE ACCOUNT_TYPE(
  ACCOUNT_TYPE_ID NUMBER(10) NOT NULL,
  ACCOUNT_TYPE VARCHAR2(255) NOT NULL,
  CONSTRAINT PK_ACCOUNT_TYPE PRIMARY KEY(ACCOUNT_TYPE_ID));
  
CREATE TABLE WINERY_BIO(
  ACCOUNT_ID NUMBER(10) NOT NULL,
  BIO VARCHAR2(1000) NOT NULL,
  CONSTRAINT PK_WINERY_BIO PRIMARY KEY(ACCOUNT_ID));
  
CREATE TABLE BIO_TRANSLATION(
  BIO_TRANS_ID NUMBER(10) NOT NULL,
  ACCOUNT_ID NUMBER(10) NOT NULL,
  LANGUAGE VARCHAR2(50) NOT NULL,
  BIO VARCHAR2(1000) NOT NULL,
  CONSTRAINT PK_BIO_TRANSLATION PRIMARY KEY(BIO_TRANS_ID));
  
CREATE TABLE WINE(
  WINE_ID NUMBER(10) NOT NULL,
  NAME VARCHAR2(50) NOT NULL,
  YEAR NUMBER(4) NOT NULL,
  TYPE VARCHAR2(20) NOT NULL,
  STOCK NUMBER(10) NOT NULL,
  PROMO_MATERIAL VARCHAR2(1000),
  PAIRING_TASTING_NOTES VARCHAR(1000),
  ACCOUNT_ID NUMBER(10) NOT NULL,
  CONSTRAINT PK_WINE_ID PRIMARY KEY(WINE_ID));
  
CREATE TABLE WINE_IMAGE(
  IMAGE_ID NUMBER(10) NOT NULL,
  IMAGE_URL VARCHAR(50) NOT NULL,
  WINE_ID NUMBER(10) NOT NULL,
  CONSTRAINT PK_IMAGE_ID PRIMARY KEY(IMAGE_ID));
  
CREATE TABLE WINE_TRANSLATION(
  WINE_TRANS_ID NUMBER(10) NOT NULL,
  WINE_ID NUMBER(10) NOT NULL,
  LANGUAGE VARCHAR2(50) NOT NULL,
  NAME VARCHAR2(50) NOT NULL,
  YEAR NUMBER(4) NOT NULL,
  TYPE VARCHAR2(20) NOT NULL,
  STOCK NUMBER(10) NOT NULL,
  PROMO_MATERIAL VARCHAR2(1000),
  PAIRING_TASTING_NOTES VARCHAR(1000),
  ACCOUNT_ID NUMBER(10) NOT NULL,
  CONSTRAINT PK_WINE_TRANSLATION_ID PRIMARY KEY(WINE_TRANS_ID));
  
CREATE TABLE IMPORT_ORDER(
  ORDER_ID NUMBER(10) NOT NULL,
  ACCOUNT_ID NUMBER(10) NOT NULL,
  ORDER_DATE DATE NOT NULL,
  ORDER_COMPLETED_DATE DATE,
  CONSTRAINT PK_ORDER_ID PRIMARY KEY(ORDER_ID));
  
CREATE TABLE ORDER_ITEM(
  ORDER_ITEM_ID NUMBER(10) NOT NULL,
  ORDER_ID NUMBER(10) NOT NULL,
  WINE_ID NUMBER(10) NOT NULL,
  QUANTITY NUMBER(10) NOT NULL,
  CONSTRAINT PK_ORDER_ITEM_ID PRIMARY KEY(ORDER_ITEM_ID));
  

CREATE SEQUENCE SEQ_USER_ACCOUNT
  MINVALUE 100
  START WITH 100
  INCREMENT BY 1
  CACHE 20;
  
CREATE SEQUENCE SEQ_BUSINESS_ACCOUNT
  MINVALUE 100
  START WITH 100
  INCREMENT BY 1
  CACHE 20;
  
CREATE SEQUENCE SEQ_ACCOUNT_TYPE
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE SEQUENCE SEQ_BIO_TRANSLATION
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 20;
  
CREATE SEQUENCE SEQ_WINE
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 20;
  
CREATE SEQUENCE SEQ_WINE_IMAGE
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 20;
  
CREATE SEQUENCE SEQ_WINE_TRANSLATION
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 20;
  
CREATE SEQUENCE SEQ_IMPORT_ORDER
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 20;
  
CREATE SEQUENCE SEQ_ORDER_ITEM
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 20;
  

ALTER TABLE USER_ACCOUNT
  ADD CONSTRAINT FK_U_ACCOUNT_B_ACCOUNT FOREIGN KEY(ACCOUNT_ID) REFERENCES BUSINESS_ACCOUNT;
  
ALTER TABLE BUSINESS_ACCOUNT
  ADD CONSTRAINT FK_B_ACCOUNT_ACCOUNT_TYPE FOREIGN KEY(ACCOUNT_TYPE_ID) REFERENCES ACCOUNT_TYPE;
  
ALTER TABLE WINERY_BIO
  ADD CONSTRAINT FK_WINERY_BIO_B_ACCOUNT FOREIGN KEY(ACCOUNT_ID) REFERENCES BUSINESS_ACCOUNT;
  
ALTER TABLE BIO_TRANSLATION
  ADD CONSTRAINT FK_BIO_TRANS_WINERY_BIO FOREIGN KEY(ACCOUNT_ID) REFERENCES WINERY_BIO;
  
ALTER TABLE WINE
  ADD CONSTRAINT FK_WINE_B_ACCOUNT FOREIGN KEY(ACCOUNT_ID) REFERENCES BUSINESS_ACCOUNT;
  
ALTER TABLE WINE_TRANSLATION
  ADD CONSTRAINT FK_WINE_TRANSLATION_WINE FOREIGN KEY(WINE_ID) REFERENCES WINE;
  
ALTER TABLE WINE_IMAGE
  ADD CONSTRAINT FK_WINE_IMAGE_WINE FOREIGN KEY(WINE_ID) REFERENCES WINE;
  
ALTER TABLE IMPORT_ORDER
  ADD CONSTRAINT FK_IMPORT_ORDER_B_ACCOUNT FOREIGN KEY(ACCOUNT_ID) REFERENCES BUSINESS_ACCOUNT;
  
ALTER TABLE ORDER_ITEM
  ADD CONSTRAINT FK_IMPORT_ORDER_ITEM_ORDER FOREIGN KEY(ORDER_ID) REFERENCES IMPORT_ORDER;
  
ALTER TABLE ORDER_ITEM
  ADD CONSTRAINT FK_ORDER_ITEM_WINE FOREIGN KEY(WINE_ID) REFERENCES WINE;

COMMIT;