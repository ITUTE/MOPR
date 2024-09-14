BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Role" (
	"id"	INTEGER NOT NULL,
	"permission"	TEXT NOT NULL,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Notification" (
	"id"	INTEGER NOT NULL,
	"type"	TEXT NOT NULL,
	"detail"	TEXT,
	"shortDetail"	TEXT,
	"status"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "UserNotify" (
	"id"	INTEGER NOT NULL,
	"userId"	INTEGER NOT NULL,
	"notificationId"	INTEGER NOT NULL COLLATE UTF16CI,
	FOREIGN KEY("userId") REFERENCES "User"("id"),
	FOREIGN KEY("notificationId") REFERENCES "Notification"("id"),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "ProductType" (
	"id"	INTEGER NOT NULL,
	"typeName"	TEXT,
	"status"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Review" (
	"id"	INTEGER NOT NULL,
	"userID"	INTEGER NOT NULL,
	"productID"	INTEGER NOT NULL,
	"content"	TEXT,
	"time"	TEXT,
	"status"	TEXT,
	FOREIGN KEY("productID") REFERENCES "Product"("id"),
	FOREIGN KEY("userID") REFERENCES "User"("id"),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Product" (
	"id"	INTEGER NOT NULL,
	"type"	INTEGER NOT NULL,
	"name"	TEXT NOT NULL,
	"price"	REAL,
	"image"	BLOB,
	"detail"	TEXT,
	"star"	REAL,
	"status"	TEXT,
	FOREIGN KEY("type") REFERENCES "ProductType"("id"),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Store" (
	"id"	INTEGER NOT NULL,
	"name"	TEXT NOT NULL,
	"phone"	TEXT NOT NULL,
	"email"	TEXT NOT NULL,
	"image"	BLOB,
	"address"	TEXT,
	"status"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Discount" (
	"id"	INTEGER NOT NULL,
	"productId"	INTEGER NOT NULL,
	"expirationDate"	TEXT,
	"type"	TEXT,
	"status"	TEXT,
	FOREIGN KEY("productId") REFERENCES "Product"("id"),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Cart" (
	"id"	INTEGER NOT NULL,
	"userId"	INTEGER NOT NULL,
	"productId"	INTEGER NOT NULL,
	"quantity"	INTEGER NOT NULL,
	"address"	TEXT NOT NULL,
	"status"	TEXT,
	FOREIGN KEY("userId") REFERENCES "User"("id"),
	FOREIGN KEY("productId") REFERENCES "Product"("id"),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Bill" (
	"id"	INTEGER NOT NULL,
	"userId"	INTEGER NOT NULL,
	"cartId"	INTEGER NOT NULL,
	"total"	REAL NOT NULL,
	"date"	TEXT NOT NULL,
	"status"	TEXT,
	PRIMARY KEY("id"),
	FOREIGN KEY("cartId") REFERENCES "Cart"("id"),
	FOREIGN KEY("userId") REFERENCES "User"("id")
);
CREATE TABLE IF NOT EXISTS "Promo" (
	"id"	INTEGER NOT NULL,
	"productId"	INTEGER NOT NULL,
	"type"	TEXT NOT NULL,
	"expirationDate"	TEXT NOT NULL,
	"status"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Account" (
	"id"	INTEGER NOT NULL,
	"userId"	INTEGER NOT NULL,
	"username"	TEXT NOT NULL,
	"password"	TEXT NOT NULL,
	"roleId"	INTEGER NOT NULL,
	"status"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "User" (
	"id"	INTEGER NOT NULL,
	"fullname"	TEXT NOT NULL,
	"sex"	TEXT NOT NULL,
	"email"	TEXT NOT NULL,
	"phone"	TEXT NOT NULL,
	"avatar"	BLOB,
	"facebook"	TEXT,
	"zalo"	TEXT,
	"status"	TEXT,
	PRIMARY KEY("id")
);
INSERT INTO "Role" ("id","permission") VALUES (1,'admin');
INSERT INTO "Role" ("id","permission") VALUES (2,'user');
INSERT INTO "Role" ("id","permission") VALUES (3,'store');
INSERT INTO "Notification" ("id","type","detail","shortDetail","status") VALUES (1,'cart','Bạn có đơn hàng chưa thanh toán.','Thanh toán',NULL);
INSERT INTO "Notification" ("id","type","detail","shortDetail","status") VALUES (2,'sale','Chào Lễ lớn, Đón khuyến mãi to cùng VietShop','Khuyến mãi',NULL);
INSERT INTO "Notification" ("id","type","detail","shortDetail","status") VALUES (3,'guide','Hướng dẫn sử dụng ứng dụng cho người dùng lần đầu đăng ký tài khoản.','Hướng dẫn',NULL);
INSERT INTO "Notification" ("id","type","detail","shortDetail","status") VALUES (4,'account','Đăng nhập ngay để trải nghiệm những tiện ích dành riêng cho bạn.','Đăng nhập',NULL);
INSERT INTO "UserNotify" ("id","userId","notificationId") VALUES (1,2,1);
INSERT INTO "UserNotify" ("id","userId","notificationId") VALUES (2,2,2);
INSERT INTO "UserNotify" ("id","userId","notificationId") VALUES (3,2,3);
INSERT INTO "UserNotify" ("id","userId","notificationId") VALUES (4,2,4);
INSERT INTO "ProductType" ("id","typeName","status") VALUES (1,'Clothes',NULL);
INSERT INTO "ProductType" ("id","typeName","status") VALUES (2,'Foods',NULL);
INSERT INTO "ProductType" ("id","typeName","status") VALUES (3,'Fruits',NULL);
INSERT INTO "ProductType" ("id","typeName","status") VALUES (4,'Drinks',NULL);
INSERT INTO "ProductType" ("id","typeName","status") VALUES (5,'Electronic device',NULL);
INSERT INTO "ProductType" ("id","typeName","status") VALUES (6,'Fresh food',NULL);
INSERT INTO "ProductType" ("id","typeName","status") VALUES (7,'Others',NULL);
INSERT INTO "Review" ("id","userID","productID","content","time","status") VALUES (1,2,1,'Hàng chất lượng.',NULL,NULL);
INSERT INTO "Review" ("id","userID","productID","content","time","status") VALUES (2,2,2,'Tốt!',NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (1,1,'Sneakers',700000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (2,1,'Ties',100000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (3,1,'T-shirts',120000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (4,1,'Coats',200000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (5,1,'Hats',80000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (6,1,'Trousers',150000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (7,1,'Boots',200000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (8,1,'Scarfs',50000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (9,1,'Neckties',20000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (10,1,'Jerseys',50000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (11,1,'Flip flops',40000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (12,1,'Dresses',150000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (13,1,'Purses',200000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (14,1,'Mittens',20000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (15,2,'Sandwiché',30000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (16,2,'Chicken and waffle',49000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (17,2,'Quesadilla',29000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (18,2,'Taco',19000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (19,2,'Naan',24000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (20,2,'Wrap',15000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (21,2,'Sashimi',35000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (22,2,'Sandwich',25000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (23,2,'Bao bun',17000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (24,2,'Potato chips',21000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (25,2,'Bread crumbs',19000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (26,2,'Ice cream',12000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (27,2,'Steak',99000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (28,2,'French fries',23000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (29,2,'Pizza',49000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (30,2,'Cake',32000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (31,2,'Gyoza',22000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (32,2,'Beef',105000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (33,2,'Bento',45000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (34,2,'Donut',17000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (35,3,'Kiwi',46000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (36,3,'Mango',37000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (37,3,'Lime',23000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (38,3,'Orange',36000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (39,3,'Goji',48000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (40,3,'Pomegranate',41000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (41,3,'Soursop',28000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (42,3,'Cocoa',31000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (43,3,'Chinese peach',33000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (44,3,'Apricot',29000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (45,3,'Papaya',21000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (46,3,'Melon',28000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (47,3,'Avocado',39000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (48,3,'Pear',29000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (49,3,'Cherry',38000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (50,3,'Strawberry',41000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (51,3,'Watermelon',21000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (52,3,'Banana',20000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (53,3,'Raspberry pi',44000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (54,3,'Plum',28000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (55,3,'Razz berry',38000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (56,3,'Raspberry',41000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (57,3,'Peach',35000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (58,3,'Grapes',47000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (59,3,'Apple',36000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (60,2,'Bread',15000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (61,2,'Cheese',31000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (62,2,'Noodles',22000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (63,2,'Paella',33000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (64,2,'Cookie',22000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (65,2,'Confectionery',21000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (66,4,'Wine',68000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (67,2,'Popcorn',27000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (68,4,'Espresso',33000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (69,4,'Vietnamese coffee',33000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (70,4,'Milk',45000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (71,4,'Milkshake',39000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (72,4,'Champagne',105000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (73,4,'Lemonade',29000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (74,4,'Beer',25000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (75,4,'Cocktail',43000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (76,4,'Coffee',31000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (77,4,'Orange juice',43000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (78,4,'Water',15000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (79,4,'Soda',20000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (80,4,'Sprite',22000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (81,6,'Garlic',28000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (82,6,'Cauliflower',24000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (83,6,'Asparagus',38000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (84,6,'Potato',34000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (85,6,'Soy',29000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (86,6,'Cashew',31000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (87,6,'White beans',25000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (88,6,'Basil',25000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (89,6,'Squash',27000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (90,6,'Amanita',33000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (91,6,'Chard',28000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (92,6,'Spinach',33000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (93,6,'Tomato',27000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (94,6,'Roach',45000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (95,6,'Haiku',22000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (96,6,'Radish',22000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (97,6,'Hazelnut',25000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (98,6,'Olive',41000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (99,2,'Sausages',31000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (100,6,'Cucumber',23000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (101,6,'Honey',75000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (102,6,'Lettuce',27000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (103,6,'Corn',21000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (104,6,'Oak tree',31000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (105,6,'Broccoli',23000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (106,6,'Parsley',27000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (107,6,'Pumpkin',31000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (108,6,'Eggplant',20000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (109,6,'Chili pepper',46000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (110,6,'Wheat',35000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (111,6,'Prawn',130000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (112,6,'Carrot',32000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (113,6,'Pineapple',28000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (114,5,'PC',13500000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (115,5,'Imac',32000000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (116,5,'Laptop',18500000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (117,5,'Tablet',13000000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (118,5,'Headset',400000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (119,5,'Headphones',300000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (120,5,'Cell phone',2000000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (121,5,'Phone case',100000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (122,5,'Telephone',800000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (123,5,'Iron',450000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (124,5,'Fridge',12000000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (125,7,'Pitchfork',130000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (126,7,'Nail',30000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (127,7,'Hatchet',120000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (128,7,'Tape',20000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (129,7,'Recycle bin',86000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (130,7,'Comb',15000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (131,7,'Teapot',45000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (132,7,'Tricycle',600000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (133,7,'Barber chair',1750000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (134,7,'Barbell',150000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (135,7,'Stroller',1200000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (136,7,'Saw',900000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Product" ("id","type","name","price","image","detail","star","status") VALUES (137,7,'Sun glasses',150000.0,NULL,NULL,NULL,NULL);
INSERT INTO "Store" ("id","name","phone","email","image","address","status") VALUES (1,'KOI','03261712481','mail@123.com',NULL,NULL,NULL);
INSERT INTO "Store" ("id","name","phone","email","image","address","status") VALUES (2,'Hội quán sinh viên','0342782487281','mail123@abc.com',NULL,NULL,NULL);
INSERT INTO "Store" ("id","name","phone","email","image","address","status") VALUES (3,'StoreX','082376324742','mail@abc.com',NULL,NULL,NULL);
INSERT INTO "Store" ("id","name","phone","email","image","address","status") VALUES (4,'The Coffee House','0932627482','mail@gmail.com',NULL,NULL,NULL);
INSERT INTO "Store" ("id","name","phone","email","image","address","status") VALUES (5,'Fruit Land','0835247262','fruitland@gmail.com',NULL,NULL,NULL);
INSERT INTO "Store" ("id","name","phone","email","image","address","status") VALUES (6,'Shop Teen','0365729474','shop@abc.com',NULL,NULL,NULL);
INSERT INTO "Store" ("id","name","phone","email","image","address","status") VALUES (7,'CHANG','0935274819','contact@chang.com',NULL,NULL,NULL);
INSERT INTO "Store" ("id","name","phone","email","image","address","status") VALUES (8,'VietPhuc','091637283626','contact@vietphuc.com',NULL,NULL,NULL);
INSERT INTO "Store" ("id","name","phone","email","image","address","status") VALUES (9,'Thuần Việt','0382617382','contact@thuanviet.com',NULL,NULL,NULL);
INSERT INTO "Store" ("id","name","phone","email","image","address","status") VALUES (10,'BuyIt','0912736279','contact@buyit.com',NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (1,1,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (2,15,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (3,16,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (4,18,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (5,22,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (6,23,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (7,28,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (8,31,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (9,39,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (10,42,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (11,43,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (12,47,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (13,49,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (14,53,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (15,57,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (16,69,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (17,73,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (18,76,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (19,85,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (20,88,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (21,91,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (22,97,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (23,99,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (24,100,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (25,107,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (26,113,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (27,117,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (28,119,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (29,121,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (30,123,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (31,127,NULL,NULL,NULL);
INSERT INTO "Discount" ("id","productId","expirationDate","type","status") VALUES (32,135,NULL,NULL,NULL);
INSERT INTO "Promo" ("id","productId","type","expirationDate","status") VALUES (1,1,'','',NULL);
INSERT INTO "Promo" ("id","productId","type","expirationDate","status") VALUES (2,46,'','',NULL);
INSERT INTO "Promo" ("id","productId","type","expirationDate","status") VALUES (3,7,'','',NULL);
INSERT INTO "Promo" ("id","productId","type","expirationDate","status") VALUES (4,86,'','',NULL);
INSERT INTO "Promo" ("id","productId","type","expirationDate","status") VALUES (5,112,'','',NULL);
INSERT INTO "Promo" ("id","productId","type","expirationDate","status") VALUES (6,133,'','',NULL);
INSERT INTO "Promo" ("id","productId","type","expirationDate","status") VALUES (7,49,'','',NULL);
INSERT INTO "Promo" ("id","productId","type","expirationDate","status") VALUES (8,25,'','',NULL);
INSERT INTO "Promo" ("id","productId","type","expirationDate","status") VALUES (9,37,'','',NULL);
INSERT INTO "Promo" ("id","productId","type","expirationDate","status") VALUES (10,99,'','',NULL);
INSERT INTO "Account" ("id","userId","username","password","roleId","status") VALUES (1,1,'admin','m1nht13n.admin',1,'active');
INSERT INTO "Account" ("id","userId","username","password","roleId","status") VALUES (2,2,'user','m1nht13n.user',2,'active');
INSERT INTO "Account" ("id","userId","username","password","roleId","status") VALUES (3,3,'tiennhm','m1nht13n.tiennhm',3,'active');
INSERT INTO "User" ("id","fullname","sex","email","phone","avatar","facebook","zalo","status") VALUES (1,'Admin','M','18110377@student.hcmute.edu.vn','0388963345',NULL,NULL,NULL,NULL);
INSERT INTO "User" ("id","fullname","sex","email","phone","avatar","facebook","zalo","status") VALUES (2,'Nguyễn Huỳnh Minh Tiến','F','ngotienhoang09@gmail.com','0388963345',NULL,NULL,NULL,NULL);
INSERT INTO "User" ("id","fullname","sex","email","phone","avatar","facebook","zalo","status") VALUES (3,'TienNHM store','O','tiennhm.it@gmail.com','0987654321',NULL,NULL,NULL,NULL);
CREATE INDEX IF NOT EXISTS "NotificationIndex" ON "Notification" (
	"id"	DESC
);
CREATE INDEX IF NOT EXISTS "ProductTypeIndex" ON "ProductType" (
	"id"	ASC
);
CREATE INDEX IF NOT EXISTS "ReviewIndex" ON "Review" (
	"id"	DESC
);
CREATE INDEX IF NOT EXISTS "RoleIndex" ON "Role" (
	"id"	ASC
);
CREATE INDEX IF NOT EXISTS "UserNotifyIndex" ON "UserNotify" (
	"id"	DESC
);
CREATE INDEX IF NOT EXISTS "ProductIndex" ON "Product" (
	"id"	ASC
);
CREATE INDEX IF NOT EXISTS "StoreIndex" ON "Store" (
	"id"	ASC
);
CREATE INDEX IF NOT EXISTS "DiscountIndex" ON "Discount" (
	"id"	DESC
);
CREATE INDEX IF NOT EXISTS "CartIndex" ON "Cart" (
	"id"	DESC
);
CREATE INDEX IF NOT EXISTS "BillIndex" ON "Bill" (
	"id"	DESC
);
CREATE INDEX IF NOT EXISTS "PromoIndex" ON "Promo" (
	"id"	DESC
);
CREATE INDEX IF NOT EXISTS "AccountIndex" ON "Account" (
	"id"	ASC
);
CREATE INDEX IF NOT EXISTS "UserIndex" ON "User" (
	"id"	ASC
);
COMMIT;
