mysql_install_db
service mysql start

touch create_db.sql
echo "CREATE USER '${DB_LOGIN}'@'localhost' identified by '${DB_PASS}';" >> create_db.sql
echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" >> create_db.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '${DB_LOGIN}'@'%' IDENTIFIED BY '${DB_PASS}';" >> create_db.sql
echo "FLUSH PRIVILEGES;" >> create_db.sql
mysql --verbose < create_db.sql

service mysql stop
mysqld
