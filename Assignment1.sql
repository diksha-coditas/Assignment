create database assign;

create table assign.Customers (
Customer_Name  varchar(250), Customer_ID varchar(255), Shipping_Address  varchar(250), Billing_Address  varchar(250), primary key (Customer_ID) );

drop table e_com.Customers;

insert into assign.Customers values ('DIKSHA','1100','PUNE','PUNE');
insert into assign.Customers values('POOJA','1101','MUMBAI','MUMBAI');
insert into assign.Customers values('SADDAM','1102','NAGPUR','PUNE');
insert into assign.Customers values('VIDHI','1103','BANGALORE','BANGALORE');
insert into assign.Customers values('TUSHAR','1104','DELHI','MUMBAI');
insert into assign.Customers values('NEEL','1105','PUNE','MUMBAI');

select * from assign.Customers;

select * from assign.Customers  where Billing_Address='MUMBAI';

select * from assign.Customers  where Customer_ID between 1102 and  1105;

select * from  assign.Customers order by Customer_name ;

/*--------------------------------------------------------------------------------------------------------*/

create table assign.Products (Product_Name varchar(250),Product_ID int, Color varchar(250) , Unit_Price double,primary key (Product_ID));

select * from  assign.Products ;

select Color , count(Color) from assign.Products group by Color;

select  sum(Unit_Price) as sum  from  assign.Products ;

select  avg(Unit_Price) as average from  assign.Products ;

select * from assign.Products  having Unit_Price>600;

insert into assign.Products values('LAPTOP CHARGER',101,'Black',999);
insert into assign.Products values('AIR CONDITIONER',102,'White',22000);
insert into assign.Products values('SOCKS',104,'Blue',450);
insert into assign.Products values('CANDLES',105,'Purple',50);
insert into assign.Products values('ONE PLUS 7T',103,'Black',35999);
insert into assign.Products values('EARPHONES',106,'White',580);

/*---------------------------------------------------------------------------------------------------------------*/

create table assign.Tracking_Info (Customer_ID varchar(255),Product_ID int, date_of_order date, order_shipping_date date,
FOREIGN KEY (Customer_ID) REFERENCES assign.Customers(Customer_ID),FOREIGN KEY (Product_ID) REFERENCES assign.Products(Product_ID));


drop table assign.Tracking_Info;


select * from assign.Tracking_Info;

insert into assign.Orders values('1101',101,'2021-07-12','2021-07-16');
insert into assign.Orders values('1101',102,'2021-07-10','2021-07-12');
insert into assign.Orders values('1102',104,'2021-07-09','2021-07-14');
insert into assign.Orders values('1103',105,'2021-07-16','2021-07-18');
insert into assign.Orders values('1104',103,'2021-07-13','2021-07-17');
insert into assign.Orders values('1105',106,'2021-07-11','2021-07-15');

select * from  e_com.Orders;

/*----------------------------------------------------------------------------------------------------------------*/

create table  assign.Order_Details (Product_ID int , product_ordered varchar(255), quantity int , unit_price double ,
 discounts float,FOREIGN KEY (Product_ID) REFERENCES assign.Products(Product_ID));
 
drop table assign.Order_Details;

select * from assign.Order_Details;

select Product_ID as ID , product_ordered as Product , unit_price as Price from assign.Order_Details;

insert into assign.Order_Details values(101,'LAPTOP CHARGER',1,999,0.0);
insert into assign.Order_Details values(102,'AC',1,22000,0.0);
insert into assign.Order_Details values(104,'SOCKS',4,450,0.0);
insert into assign.Order_Details values(105,'CANDLES',10,50,0.0);
insert into assign.Order_Details values(103,'ONE PLUS 7T',1,35999,15);
insert into assign.Order_Details values(106,'EAPHONES',1,580,0.0);