CREATE DATABASE openpbp_development;
CREATE USER 'openpbp'@'localhost' IDENTIFIED BY 'YOUR-PASSWORD';
GRANT ALL ON openpbp_development.* TO 'openpbp'@'localhost';
FLUSH PRIVILEGES;
exit
