CREATE DATABASE IF NOT EXISTS ss_tourism CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ss_tourism;

CREATE TABLE IF NOT EXISTS users (
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 email VARCHAR(190) NOT NULL UNIQUE,
 phone VARCHAR(30) DEFAULT NULL,
 password_hash VARCHAR(255) NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS admins (
 id INT AUTO_INCREMENT PRIMARY KEY,
 username VARCHAR(80) NOT NULL UNIQUE,
 password_hash VARCHAR(255) NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS destinations (
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(140) NOT NULL,
 location VARCHAR(140) NOT NULL,
 description TEXT NOT NULL,
 price DECIMAL(10,2) NOT NULL DEFAULT 0,
 image_url VARCHAR(500) NOT NULL,
 featured TINYINT(1) NOT NULL DEFAULT 0,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS bookings (
 id INT AUTO_INCREMENT PRIMARY KEY,
 user_id INT NOT NULL,
 destination_id INT NOT NULL,
 travel_date DATE NOT NULL,
 travelers INT NOT NULL DEFAULT 1,
 message TEXT DEFAULT NULL,
 status ENUM('pending','approved','rejected') NOT NULL DEFAULT 'pending',
 admin_note VARCHAR(500) DEFAULT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
 FOREIGN KEY (destination_id) REFERENCES destinations(id) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS payments (
 id INT AUTO_INCREMENT PRIMARY KEY,
 booking_id INT NOT NULL,
 user_id INT NOT NULL,
 amount DECIMAL(10,2) NOT NULL,
 method ENUM('UPI','Apple Pay','Bank Transfer') NOT NULL,
 transaction_ref VARCHAR(190) DEFAULT NULL,
 status ENUM('submitted','verified','rejected') NOT NULL DEFAULT 'submitted',
 note VARCHAR(500) DEFAULT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (booking_id) REFERENCES bookings(id) ON DELETE CASCADE,
 FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS settings (
 setting_key VARCHAR(100) PRIMARY KEY,
 setting_value TEXT NOT NULL
);

INSERT INTO destinations (name, location, description, price, image_url, featured) VALUES
('Statue of Unity','Kevadia, Gujarat','Discover the iconic Statue of Unity, riverfront views and the surrounding nature attractions.',1299,'https://images.unsplash.com/photo-1606293926075-69a00dbZd3b?auto=format&fit=crop&w=1200&q=85',1),
('Goa Beach Escape','Goa, India','Golden beaches, coastal sunsets, local markets and relaxing seaside experiences.',4999,'https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?auto=format&fit=crop&w=1200&q=85',1),
('Taj Mahal','Agra, Uttar Pradesh','Visit the world-famous marble monument and explore the rich history of Agra.',2499,'https://images.unsplash.com/photo-1564507592333-c60657eea523?auto=format&fit=crop&w=1200&q=85',1),
('Manali Mountain Retreat','Manali, Himachal Pradesh','Mountain scenery, pine forests and refreshing Himalayan air.',6999,'https://images.unsplash.com/photo-1626621341517-bbf3d9990a23?auto=format&fit=crop&w=1200&q=85',0),
('Jaipur Heritage Tour','Jaipur, Rajasthan','Explore royal forts, colourful bazaars and Rajasthan heritage.',3299,'https://images.unsplash.com/photo-1599661046827-dacff0c0f09a?auto=format&fit=crop&w=1200&q=85',0),
('Kerala Backwaters','Alappuzha, Kerala','A serene journey through green waterways, coconut palms and traditional houseboats.',5999,'https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?auto=format&fit=crop&w=1200&q=85',0)
ON DUPLICATE KEY UPDATE name=VALUES(name);

INSERT INTO settings (setting_key, setting_value) VALUES
('upi_id','yourname@upi'),
('bank_details','Bank: Your Bank | Account name: Your Name | Account number: Add account number | IFSC: Add IFSC'),
('payment_qr','assets/images/payment-qr.png')
ON DUPLICATE KEY UPDATE setting_key=VALUES(setting_key);
