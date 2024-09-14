BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Role" (
	"id"	INTEGER NOT NULL,
	"permission"	TEXT NOT NULL,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Review" (
	"id"	INTEGER NOT NULL,
	"userID"	INTEGER NOT NULL,
	"productID"	INTEGER NOT NULL,
	"content"	TEXT,
	"time"	TEXT,
	"status"	TEXT,
	PRIMARY KEY("id"),
	FOREIGN KEY("userID") REFERENCES "User"("id"),
	FOREIGN KEY("productID") REFERENCES "Product"("id")
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
CREATE TABLE IF NOT EXISTS "Promo" (
	"id"	INTEGER NOT NULL,
	"productId"	INTEGER NOT NULL,
	"type"	TEXT NOT NULL,
	"expirationDate"	TEXT NOT NULL,
	"status"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "ProductType" (
	"id"	INTEGER NOT NULL,
	"name"	TEXT NOT NULL,
	"image"	BLOB,
	"status"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Product" (
	"id"	INTEGER NOT NULL,
	"storeId"	INTEGER,
	"type"	INTEGER NOT NULL,
	"name"	INTEGER NOT NULL,
	"price"	REAL,
	"image"	BLOB,
	"detail"	TEXT,
	"star"	REAL,
	"status"	TEXT,
	PRIMARY KEY("id"),
	FOREIGN KEY("type") REFERENCES "ProductType"("id"),
	FOREIGN KEY("storeId") REFERENCES "Store"("id")
);
CREATE TABLE IF NOT EXISTS "Discount" (
	"id"	INTEGER NOT NULL,
	"productId"	INTEGER NOT NULL,
	"expirationDate"	TEXT,
	"value"	REAL NOT NULL,
	"status"	TEXT,
	PRIMARY KEY("id"),
	FOREIGN KEY("productId") REFERENCES "Product"("id")
);
CREATE TABLE IF NOT EXISTS "ProductImage" (
	"id"	INTEGER NOT NULL,
	"productId"	INTEGER NOT NULL,
	"image"	BLOB,
	"status"	TEXT,
	PRIMARY KEY("id"),
	FOREIGN KEY("productId") REFERENCES "Product"("id")
);
CREATE TABLE IF NOT EXISTS "Cart" (
	"id"	INTEGER NOT NULL,
	"userId"	INTEGER NOT NULL,
	"productId"	INTEGER NOT NULL,
	"quantity"	INTEGER NOT NULL,
	"status"	TEXT,
	PRIMARY KEY("id"),
	FOREIGN KEY("productId") REFERENCES "Product"("id"),
	FOREIGN KEY("userId") REFERENCES "User"("id")
);
CREATE TABLE IF NOT EXISTS "Notification" (
	"id"	INTEGER NOT NULL,
	"userId"	INTEGER NOT NULL,
	"type"	TEXT NOT NULL,
	"message"	TEXT NOT NULL,
	"status"	TEXT,
	PRIMARY KEY("id"),
	FOREIGN KEY("userId") REFERENCES "User"("id")
);
CREATE TABLE IF NOT EXISTS "Account" (
	"id"	INTEGER NOT NULL,
	"username"	TEXT NOT NULL,
	"email"	TEXT NOT NULL,
	"password"	TEXT NOT NULL,
	"roleId"	INTEGER NOT NULL,
	"status"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "User" (
	"id"	INTEGER NOT NULL,
	"accountId"	INTEGER NOT NULL,
	"fullname"	TEXT NOT NULL,
	"sex"	TEXT NOT NULL,
	"phone"	TEXT NOT NULL,
	"address"	TEXT NOT NULL,
	"avatar"	BLOB,
	"facebook"	TEXT,
	"zalo"	TEXT,
	"status"	TEXT,
	PRIMARY KEY("id"),
	FOREIGN KEY("accountId") REFERENCES "Account"("id")
);
CREATE TABLE IF NOT EXISTS "Bill" (
	"id"	INTEGER NOT NULL,
	"userId"	INTEGER NOT NULL,
	"cartId"	INTEGER NOT NULL,
	"phone"	TEXT NOT NULL,
	"address"	TEXT NOT NULL,
	"date"	TEXT,
	"status"	TEXT,
	PRIMARY KEY("id"),
	FOREIGN KEY("userId") REFERENCES "User"("id"),
	FOREIGN KEY("cartId") REFERENCES "Cart"("id")
);
CREATE INDEX IF NOT EXISTS "ReviewIndex" ON "Review" (
	"id"	DESC
);
CREATE INDEX IF NOT EXISTS "RoleIndex" ON "Role" (
	"id"	ASC
);
CREATE INDEX IF NOT EXISTS "StoreIndex" ON "Store" (
	"id"	ASC
);
CREATE INDEX IF NOT EXISTS "PromoIndex" ON "Promo" (
	"id"	DESC
);
CREATE INDEX IF NOT EXISTS "ProductTypeIndex" ON "ProductType" (
	"id"	ASC
);
CREATE INDEX IF NOT EXISTS "ProductIndex" ON "Product" (
	"id"	ASC
);
CREATE INDEX IF NOT EXISTS "DiscountIndex" ON "Discount" (
	"id"	DESC
);
CREATE UNIQUE INDEX IF NOT EXISTS "ProductImageIndex" ON "ProductImage" (
	"productId"	ASC
);
CREATE INDEX IF NOT EXISTS "CartIndex" ON "Cart" (
	"id"	DESC
);
CREATE INDEX IF NOT EXISTS "NotificationIndex" ON "Notification" (
	"id"	DESC
);
CREATE INDEX IF NOT EXISTS "AccountIndex" ON "Account" (
	"id"	ASC
);
CREATE INDEX IF NOT EXISTS "UserIndex" ON "User" (
	"id"	ASC
);
CREATE INDEX IF NOT EXISTS "BillIndex" ON "Bill" (
	"id"	DESC
);
COMMIT;
