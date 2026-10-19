# SS Tourism Management (PHP + MySQL)

A responsive tourism booking project with user registration/login, separate admin panel, destination management, booking requests, approval status, and payment-record tracking.

## Requirements
- PHP 8.1+ (PDO MySQL enabled)
- MySQL 5.7+/MariaDB
- XAMPP/WAMP/LAMP

## Install
1. Copy `ss_tourism_management` into your web server's document root (e.g. `htdocs`).
2. Create a MySQL database named `ss_tourism`.
3. Import `database.sql` using phpMyAdmin.
4. Edit `config.php` with your MySQL username/password.
5. Open `http://localhost/ss_tourism_management/admin_login.php` once. It creates the admin account:
   - Username: `admin`
   - Password: `ADMIN12`
6. Delete `setup_admin.php` after successful setup.
7. Open `http://localhost/ss_tourism_management/`.

## Payment notes (important)
- This project stores payment submissions and transaction references for admin review.
- UPI QR: replace `assets/images/payment-qr.png` with your own QR image (same filename), or upload a QR in Admin → Settings if that page is used.
- UPI intent links may open a UPI app on compatible devices. A payment is not confirmed until your payment provider/bank confirms it.
- Bank transfer is recorded for manual verification.
- Apple Pay and real-time card/UPI payment confirmation require an eligible payment gateway/merchant account and credentials. This project does **not** falsely mark these as completed; configure a gateway before taking live payments.
- Before public deployment, use HTTPS, change the admin password, configure mail notifications, and review security settings.

## Included
- User registration and login (registration redirects to login; successful login redirects home)
- Separate admin login and dashboard
- Add/edit/delete destinations, including image URL and price
- Booking request submission and approval/rejection
- User-facing booking status notification on dashboard
- Payment submission and admin payment verification
- CSRF tokens, password hashing, prepared statements, session checks
