drop database if exists ecsite;

create database if not exists ecsite_tsuchida;
use ecsite_tsuchida;

drop table if exists login_user_transaction;

create table login_user_transaction(
id int not null primary key auto_increment,
login_id varchar(16) unique,
login_pass varchar(16),
user_name varchar(50),
user_address varchar(50),
user_address1 varchar(50),
user_address2 varchar(50),
user_address3 varchar(50),
user_sex varchar(50),
user_tell varchar(16),
insert_date datetime,
updated_date datetime
);

drop table if exists item_info_transaction;

create table item_info_transaction(
id int not null primary key auto_increment,
item_name varchar(30),
item_price int,
item_stock int,
item_photo varchar(1000),
insert_date datetime,
update_date datetime
);

drop table if exists user_buy_item_transaction;

create table user_buy_item_transaction(
id int not null primary key auto_increment,
item_transaction_id int,
image_path varchar(255),
total_price int,
total_count int,
user_master_id varchar(16),
pay varchar(30),
insert_date datetime,
delete_date datetime
);


INSERT INTO item_info_transaction(item_name, item_price, item_stock) VALUES
("NOTEBOOK", 100, 50),
("PEN",120,50),
("ERASER",110,50),
("pencil",50,50),
("ballpoint pen",100,50),
("mechanical pencil",100,50),
("scissors",400,50),
("cat1",350,50),
("cat2",300,50),
("cat3",100,50),
("cat4",1200,1);

update item_info_transaction set item_photo = "https://images-na.ssl-images-amazon.com/images/I/71uQ10kmhEL._SL1000_.jpg"
where item_name = "NOTEBOOK";

update item_info_transaction set item_photo = "https://thumbnail.image.rakuten.co.jp/@0_mall/swallow/cabinet/lamy/4pen_black_n.jpg?_ex=300x300&s=2&r=1"
where item_name = "PEN";

update item_info_transaction set item_photo = "http://askul.c.yimg.jp/ais/img/product/3L1/9830167_3L1.jpg"
where item_name = "ERASER";

update item_info_transaction set item_photo = "https://askul.c.yimg.jp/img/product/LL1/5995982_LL1.jpg"
where item_name = "pencil";

update item_info_transaction set item_photo = "http://askul.c.yimg.jp/ais/resource/images/cathead/cathead-0104022.jpg"
where item_name = "ballpoint pen";

update item_info_transaction set item_photo = "https://images-fe.ssl-images-amazon.com/images/I/512fdjHlRtL._SY355_.jpg"
where item_name = "mechanical pencil";

update item_info_transaction set item_photo = "http://askul.c.yimg.jp/ais/img/product/3L1/8076767_3L1.jpg"
where item_name = "scissors";

update item_info_transaction set item_photo = "https://images-na.ssl-images-amazon.com/images/I/61V0ZAeXpLL._SL1000_.jpg"
where item_name = "cat1";

update item_info_transaction set item_photo = "http://livedoor.blogimg.jp/luzyluz/imgs/a/8/a8f963ec-s.jpg"
where item_name = "cat2";

update item_info_transaction set item_photo = "http://mixi2009.up.n.seesaa.net/mixi2009/image/9a2a3f25f2a826e2b2b4718827a10bce_l.jpg?d=a1"
where item_name = "cat3";

update item_info_transaction set item_photo = "http://blog-imgs-34.fc2.com/m/i/n/minamijima/20081211nuko05.jpg"
where item_name = "cat4";

INSERT INTO login_user_transaction(login_id, login_pass, user_name, user_address, user_address1, user_address2, user_address3, user_sex, user_tell) VALUES
("jiro", "456", "test","saitama","kita","nishi","30","男","09000000000"),
("taro","123","master","tokyo","minami","higashi","50","男","08000000000");