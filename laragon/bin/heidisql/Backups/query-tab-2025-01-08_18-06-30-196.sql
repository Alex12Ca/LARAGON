CREATE DATABASE IF NOT EXISTS db_inventory 
USE db_inventory;


CREATE TABLE IF NOT EXISTS branches (
  id int unsigned NOT NULL AUTO_INCREMENT,
  branch_name varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updatdb_inventory1ed_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--  datos para la tabla db_inventory.branches: 
DELETE FROM branches;


CREATE TABLE IF NOT EXISTS categories (
  id int unsigned NOT NULL AUTO_INCREMENT,
  name varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  status tinyint NOT NULL DEFAULT '1',
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

menus

CREATE TABLE IF NOT EXISTS companies (
  id int unsigned NOT NULL AUTO_INCREMENT,
  name varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  phone varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  address text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS customers (
  id int unsigned NOT NULL AUTO_INCREMENT,
  customer_name varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  email varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  phone varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  address text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  status tinyint NOT NULL DEFAULT '1',
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


USE db_inventory;
DELETE FROM customers;

CREATE TABLE IF NOT EXISTS menus (
  id int unsigned NOT NULL AUTO_INCREMENT,
  parent_id int NOT NULL DEFAULT '0',
  name varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  icon varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  menu_url varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  status tinyint NOT NULL DEFAULT '0',
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS migrations (
  id int unsigned NOT NULL AUTO_INCREMENT,
  migration varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  batch int NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE IF NOT EXISTS password_resets (
  email varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  token varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  KEY password_resets_email_index (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--tabla db_inventory.password_resets: 
DELETE FROM password_resets;


CREATE TABLE IF NOT EXISTS payments (
  id int unsigned NOT NULL AUTO_INCREMENT,
  sell_id int NOT NULL,
  customer_id int NOT NULL,
  user_id int NOT NULL,
  date varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  paid_in varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  bank_information text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  amount double NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id),
  KEY sell_id (sell_id)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS permissions (
  id int unsigned NOT NULL AUTO_INCREMENT,
  role_id int NOT NULL,
  menu_id int NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=744 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS products (
  id int unsigned NOT NULL AUTO_INCREMENT,
  category_id int NOT NULL,
  product_name varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  details text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  status tinyint NOT NULL DEFAULT '1',
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id),
  KEY category_id (category_id)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


USE db_inventory;
DELETE FROM categories;

USE db_inventory;
DELETE FROM products;

CREATE TABLE IF NOT EXISTS roles (
  id int unsigned NOT NULL AUTO_INCREMENT,
  role_name varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE IF NOT EXISTS sells (
  id int unsigned NOT NULL AUTO_INCREMENT,
  user_id int NOT NULL,
  customer_id int NOT NULL,
  branch_id int NOT NULL DEFAULT '1',
  total_amount double NOT NULL,
  paid_amount double NOT NULL DEFAULT '0',
  sell_date varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  discount_amount double NOT NULL DEFAULT '0',
  payment_method tinyint NOT NULL DEFAULT '0',
  payment_status tinyint NOT NULL DEFAULT '0',
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS sell_details (
  id int unsigned NOT NULL AUTO_INCREMENT,
  stock_id int NOT NULL,
  sell_id int NOT NULL,
  product_id int NOT NULL,
  category_id int NOT NULL,
  vendor_id int NOT NULL,
  user_id int NOT NULL,
  chalan_no varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  selling_date varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  customer_id varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  sold_quantity int NOT NULL,
  buy_price double NOT NULL,
  sold_price double NOT NULL,
  total_buy_price double NOT NULL,
  total_sold_price double NOT NULL,
  discount double NOT NULL,
  discount_type tinyint NOT NULL,
  discount_amount double NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id),
  KEY stock_id (stock_id),
  KEY selling_date (selling_date),
  KEY product_id (product_id),
  KEY category_id (category_id),
  KEY vendor_id (vendor_id),
  KEY user_id (user_id),
  KEY sell_id (sell_id)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE IF NOT EXISTS stocks (
  id int unsigned NOT NULL AUTO_INCREMENT,
  category_id int NOT NULL,
  product_code varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  product_id int NOT NULL,
  vendor_id int NOT NULL,
  user_id int NOT NULL,
  chalan_no varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  buying_price double NOT NULL,
  selling_price double NOT NULL,
  discount double NOT NULL DEFAULT '0',
  stock_quantity int NOT NULL,
  current_quantity int NOT NULL DEFAULT '0',
  note text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  status tinyint NOT NULL DEFAULT '1',
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id),
  KEY category_id (category_id),
  KEY product_id (product_id),
  KEY vendor_id (vendor_id),
  KEY stock_quantity (stock_quantity)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS users (
  id int unsigned NOT NULL AUTO_INCREMENT,
  name varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  email varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  password varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  branch_id int NOT NULL DEFAULT '1',
  role_id int NOT NULL DEFAULT '1',
  remember_token varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY users_email_unique (email)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;customers

--crear usuarios
USE db_inventory;
INSERT INTO users (name, email, password, branch_id, role_id, remember_token, created_at, updated_at)
VALUES
('Admin User', 'admin@example.com', SHA2('securepassword123', 256), 1, 1, NULL, NOW(), NOW()), -- Administrador
('John Doe', 'john.doe@example.com', SHA2('password123', 256), 2, 2, NULL, NOW(), NOW()), -- Usuario normal
('Jane Smith', 'jane.smith@example.com', SHA2('password123', 256), 3, 2, NULL, NOW(), NOW()), -- Usuario normal
('Alice Brown', 'alice.brown@example.com', SHA2('password123', 256), 1, 2, NULL, NOW(), NOW()); -- Usuario normal


CREATE TABLE IF NOT EXISTS vendors (
  id int unsigned NOT NULL AUTO_INCREMENT,
  name varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  phone varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  email varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  address text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;