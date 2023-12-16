create database A6_ProductInventoryDb
use A6_ProductInventoryDb
create table ProductsInfo
(ProductId int primary key,
ProductName nvarchar(50),
ProductPrice float,
ProductQuantity int,
MfDate date not null,
ExpDate date not null)

insert into ProductsInfo values (1,'Mobile',230000,4,'2023/02/14','2024/02/02')
insert into ProductsInfo values (2,'TABLET',550000,3,'2021/10/06','2023/05/15')
insert into ProductsInfo values (3,'Laptop',650000,6,'2019/07/01','2024/08/09')
insert into ProductsInfo values (4,'Mobile',350000,2,'2022/11/04','2025/05/15')
insert into ProductsInfo values (5,'Mobile',230000,4,'2021/04/07','2023/07/01')
insert into ProductsInfo values (6,'Smart-Watch',10000,1,'2020/05/10','2024/09/05')
select * from ProductsInfo
---------------------------------------------
create proc usp_iProductsInfo
@id int,
@name nvarchar(50),
@price float,
@qty int,
@mfgdate date,
@expdate date
as
insert into ProductsInfo(ProductId,ProductName,ProductPrice,ProductQuantity,MfDate,ExpDate) values(@id,@name,@price,@qty,@mfgdate,@expdate)

exec usp_iProductsInfo 7,'TABLET',250000,1,'09/01/2022','09/01/2023'
---------------------------------------------------------------
create proc usp_dProductsInfo
@id int
as
delete from ProductsInfo where ProductId=@id

exec usp_dProductsInfo 7
----------------------------------------------------------------
create proc usp_uProductsInfo
@id int,
@name nvarchar(50),
@price float,
@qty int,
@mfgdate date,
@expdate date
as
update ProductsInfo set ProductName=@name,ProductPrice=@price,ProductQuantity=@qty,@MfgDate=@mfgdate,ExpDate=@expdate where ProductId=@id

------------------------------------------------------------------------
create proc usp_sProductsInfo
@id int
as
select * from ProductsInfo where ProductId=@id
