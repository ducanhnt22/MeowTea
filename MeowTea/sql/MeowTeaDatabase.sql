create database MeowTea

use Meowtea

create table tblRoles(
roleID nvarchar(5) primary key,
roleName nvarchar(10) not null,
)

create table tblUsers(
userID nvarchar(10) primary key,
name nvarchar(50) not null,
phone nvarchar(12) not null,
address nvarchar(MAX) not null,
email nvarchar(MAX) not null,
roleID nvarchar(5) foreign key (roleID) references tblRoles(roleID),
password nvarchar(20) not null
)

create table tblCategory(
categoryID nvarchar(10) primary key,
categoryName nvarchar(30)
)

create table tblProduct (
productID nvarchar(10) primary key not null,
name nvarchar(50) not null,
price int not null,
quantity int not null,
categoryID nvarchar(10) foreign key (categoryID) references tblCategory(categoryID),
images nvarchar(MAX) not null
)

create table tblOrders(
orderID int identity(1,1) primary key,
date date not null,
userID nvarchar(10) foreign key (userID) references tblUsers(userID),
total float not null,
)

create table tblOrderDetail(
detailID int identity(1,1) primary key,
orderID int foreign key (orderID) references tblOrders(orderID) ,
productID nvarchar(10) foreign key (productID) references tblProduct(productID),
price float,
quantity int
)

insert into tblCategory(categoryID, categoryName) values
('C01' , 'Milk Tea'),
('C02' , 'Fresh Fruit Tea'),
('C03' , 'Yogurt'),
('C04' , 'Macchiato Cream Cheese'),
('C05' , 'Special')

insert into tblRoles(roleID, roleName) values
('R01' , 'Admin'),
('R02' , 'Dev'),
('R03' , 'User')

insert into tblUsers(userID, name, phone, address, email, roleID, password) values 
('AD01', N'Đức Anh', 0123123123, 'HCM', 'ducanh@gmail.com', 'R01', 1),
('AD02', N'Tú Anh', 0123123321, 'HCM', 'tuanh@gmail.com', 'R01', 1),
('US01', N'Hoàng Thảo', 0123123123, 'HN', 'thaohoang@gmail.com', 'R03', 1),
('US02', N'Mai Thảo', 0123123123, 'DN', 'maithao@gmail.com', 'R03', 1),
('US03', N'Minh Man', 0123123123, 'LA', 'manhnm@gmail.com', 'R03', 1),
('US04', N'Hoang Tu', 0123123123, 'America', 'tuhang@gmail.com', 'R03', 1),
('US05', N'Dung Bui', 0123123123, 'China', 'dungbui@gmail.com', 'R03', 1)

insert into tblProduct(productID, name, price, quantity, categoryID, images) values
('P01', 'Red Bean Matcha', 29000, 15, 'C01', 'https://tocotocotea.com/wp-content/uploads/2021/01/ezgif.com-gif-maker-11.jpg'),
('P02', 'Pearl Fresh Milk with Coffee Cream', 29000, 20, 'C01', 'https://tocotocotea.com/wp-content/uploads/2021/01/ezgif.com-gif-maker-6.jpg'),
('P03', 'Pearl Oolong Tea with Coffee Cream', 29000, 17, 'C01', 'https://tocotocotea.com/wp-content/uploads/2021/01/ezgif.com-gif-maker-5.jpg'),
('P04', 'Green Tea', 29000, 30, 'C01', 'https://tocotocotea.com/wp-content/uploads/2021/01/ezgif.com-gif-maker-13.jpg'),
('P05', 'Extremity Oolong Tea', 29000, 20, 'C01', 'https://tocotocotea.com/wp-content/uploads/2021/01/ezgif.com-gif-maker-19.jpg'),
('P06', 'Matcha Milk Tea', 29000, 18, 'C01', 'https://tocotocotea.com/wp-content/uploads/2021/01/ezgif.com-gif-maker-17.jpg'),
('P07', 'Oolong Milk Tea', 29000, 15, 'C01', 'https://tocotocotea.com/wp-content/uploads/2021/01/ezgif.com-gif-maker-18.jpg'),
('P08', 'Red Tea', 29000, 15, 'C01', 'https://tocotocotea.com/wp-content/uploads/2021/01/1578304012347_hong_tra_f8b228ea2b0147a5b05c9292569deea7_grande.jpg'),
('P09', 'Chocolate Milk Tea', 29000, 15, 'C01', 'https://tocotocotea.com/wp-content/uploads/2021/01/ezgif.com-gif-maker-22.jpg'),
('P10', 'Mint Milk Tea', 29000, 20, 'C01', 'https://tocotocotea.com/wp-content/uploads/2021/01/ezgif.com-gif-maker-23.jpg'),
('P11', 'Strawberry Milk Tea', 29000, 55, 'C01', 'https://tocotocotea.com/wp-content/uploads/2021/01/Hinh-anh-sp-website_tra-sua-dau-tay.png'),
('P12', 'Red Grapefrust Mango Tea', 39000, 35, 'C02', 'https://tocotocotea.com/wp-content/uploads/2022/04/tra%CC%80-xoa%CC%80i-bu%CC%9Bo%CC%9B%CC%89i-ho%CC%82%CC%80ng.png'),
('P13', 'Downy Pearl Grapefrust Probi', 39000, 25, 'C02', 'https://tocotocotea.com/wp-content/uploads/2021/01/ezgif.com-gif-maker-2.jpg'),
('P14', 'Downy Pearl Mango Probi', 39000, 95, 'C02', 'https://tocotocotea.com/wp-content/uploads/2021/01/ezgif.com-gif-maker-3.jpg'),
('P15', 'Snow Crystal Mulberry Tea', 39000, 10, 'C02', 'https://tocotocotea.com/wp-content/uploads/2021/01/da%CC%82u-ta%CC%86%CC%80m-pha-le%CC%82-tuye%CC%82%CC%81t.jpg'),
('P16', 'Red Honey Pomelo Tea', 39000, 13, 'C02', 'https://tocotocotea.com/wp-content/uploads/2021/01/ezgif.com-gif-maker-7.jpg'),
('P17', 'Luxury Mulberry Yogust', 49000, 19, 'C03', 'https://tocotocotea.com/wp-content/uploads/2021/05/sua-chua-dau-tam-hoang-kim.png'),
('P18', 'Chestnut Mulberry Yogust', 49000, 15, 'C03', 'https://tocotocotea.com/wp-content/uploads/2021/05/sua-chua-dau-tam-hat-de-.png'),
('P19', 'White Yogust', 49000, 15, 'C03', 'https://tocotocotea.com/wp-content/uploads/2021/05/sua-chua-trang-.png'),
('P20', 'Red Grapefrust Mango Tea with Creamcheese', 49000, 15, 'C04', 'https://tocotocotea.com/wp-content/uploads/2022/04/tra%CC%80-xoa%CC%80i-bu%CC%9Bo%CC%9B%CC%89i-ho%CC%82%CC%80ng-kem-pho%CC%82-mai.png'),
('P21', 'Cereal Choco with Coffee Cream', 49000, 15, 'C04', 'https://tocotocotea.com/wp-content/uploads/2021/12/Hi%CC%80nh-a%CC%89nh-sp-website_1000x1000_choco-ngu%CC%83-co%CC%82%CC%81c-kem-cafe.png'),
('P22', 'Red Cereal with Creamcheese', 49000, 15, 'C04', 'https://tocotocotea.com/wp-content/uploads/2021/12/Hi%CC%80nh-a%CC%89nh-sp-website_1000x1000_ho%CC%82%CC%80ng-tra%CC%80-ngu%CC%83-co%CC%82%CC%81c-kem-cafe.png'),
('P23', 'Mulberry with Creamcheese', 49000, 15, 'C04', 'https://tocotocotea.com/wp-content/uploads/2021/01/dau_tam_kem_pho_mai_09a4c4b857694d918a86542225fc2867_grande.jpg'),
('P24', 'Red Tea with Creamcheese', 49000, 15, 'C04', 'https://tocotocotea.com/wp-content/uploads/2021/01/hong_tra_kem_pho_mai_bea768e4679b4a2bbea0d5730fc75ffa_4dbc2f739c184bbbad3cee27aab5cfcd_grande.jpg'),
('P25', 'Green Tea with Creamcheese', 49000, 15, 'C04', 'https://tocotocotea.com/wp-content/uploads/2021/01/tra_xanh_kem_pho_mai_1ed02f821288425d87dd9fc096c62768_40b394e0280f4d55819de201a4405718_grande.jpg'),
('P26', 'Matcha with Creamcheese', 49000, 15, 'C04', 'https://tocotocotea.com/wp-content/uploads/2021/01/matcha-kem-pho-mai_09b3b54997614aea86d2b61bcd7f548c_73a9e7cd539949718b13b06c5db9522f_grande.png'),
('P27', 'Instant Milk Tea Strawberry', 34000, 15, 'C05', 'https://tocotocotea.com/wp-content/uploads/2022/06/Stawberry-Milk-Tea.jpg'),
('P28', 'Instant Milk Tea Original', 34000, 15, 'C05', 'https://tocotocotea.com/wp-content/uploads/2022/06/Original-Milk-Tea.jpg'),
('P29', 'Royal Pearl Milk Coffee', 44000, 15, 'C05', 'https://tocotocotea.com/wp-content/uploads/2021/11/Royal-Pearl-Milk-Coffee.png'),
('P30', 'Grass Jelly Milk Coffee', 49000, 15, 'C05', 'https://tocotocotea.com/wp-content/uploads/2021/11/Grass-Jelly-Milk-Coffee.png'),
('P31', 'Panda Milk Tea', 39000, 15, 'C05', 'https://tocotocotea.com/wp-content/uploads/2021/01/ezgif.com-gif-maker-9.jpg'),
('P32', 'Happiness Milk Tea', 39000, 15, 'C05', 'https://tocotocotea.com/wp-content/uploads/2021/01/ezgif.com-gif-maker-16.jpg')