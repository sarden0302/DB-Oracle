SELECT * FROM user;

START TRANSACTION;
UPDATE user SET PHONE = 
SUBSTRING_INDEX(phone, ')', -1);
ROLLBACK;

SAVEPOINT SP1;
UPDATE user SET PHONE =
CONCAT('KOR)', phone);
ROLLBACK TO SP1;