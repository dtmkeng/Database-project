create table users(
  user_id  number not null,
  username varchar2(100) not null,
  password varchar2(100) not null,
  primary key (user_id)
);
create table account(
   account_id varchar2(20) not null,
   create_date date not null,
   cvv varchar2(10) not null,
   acc_type varchar2(20) not null,
   credit_num varchar2(100) not null,
   user_id number not null,
   PRIMARY key (account_id),
   FOREIGN key  (user_id) REFERENCES users(user_id)
);
create table company(  
    company_id VARCHAR2(50) not null,
    company_name varchar2(100) not null,
    primary key (company_id)
);
CREATE TABLE product_key(
    key_id VARCHAR2(50) not null,
    program_name VARCHAR2(100) not null,
    price number not null,
    exp date null,
    PRIMARY key (key_id)   
);
CREATE TABLE program(
    program_id VARCHAR2(50) not null,
    program_name VARCHAR2(100) not null,
    relese_date date not null,
    buy_type VARCHAR2(50) not null,
    price number not null,
    program_type VARCHAR2(50) null,
    company_id VARCHAR2(50) not null,
    key_id VARCHAR2(50) not null,
    primary key (program_id),
    FOREIGN key (company_id) REFERENCES company(company_id),
    FOREIGN key (key_id)REFERENCES product_key(key_id) 
);
CREATE TABLE basket(
    basket_id varchar2(50) not null,
    item_list VARCHAR2(50) not null,
    add_date   date not null,
    total_price number not null,
    user_id  number not null,
    PRIMARY key (basket_id),
    FOREIGN key (user_id) REFERENCES  users(user_id)
);
CREATE TABLE buy_key(
   key_id VARCHAR2(50) not null,
   basket_id varchar2(50) not null,
   primary key (key_id,basket_id),
   FOREIGN key (key_id) REFERENCES product_key(key_id),
   FOREIGN key (basket_id) REFERENCES basket(basket_id)
);
CREATE TABLE package(
    package_id VARCHAR2(50) not null,
    program_list VARCHAR2(100) not null,
    program_name VARCHAR2(50) not null,
    price number not null,
    primary key (package_id)
);
CREATE TABLE buy(
    program_id VARCHAR2(50) not null,
    basket_id varchar2(50) not null,
    primary key (program_id,basket_id),
    FOREIGN key (program_id) REFERENCES program(program_id),
    FOREIGN key (basket_id) REFERENCES basket(basket_id)
);
CREATE table contain(
    program_id VARCHAR2(50) not null,
    package_id VARCHAR2(50) not null,
    primary key (program_id,package_id),
    FOREIGN key (program_id) REFERENCES program(program_id),
    FOREIGN key (package_id) REFERENCES package(package_id)
);
create TABLE buy_package(
    basket_id varchar2(50) not null,
    package_id VARCHAR2(50) not null,
    primary key (basket_id,package_id),
    FOREIGN key (basket_id) REFERENCES basket(basket_id),
    FOREIGN key (package_id) REFERENCES package(package_id)
);
