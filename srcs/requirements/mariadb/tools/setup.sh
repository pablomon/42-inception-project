FILE=/create_db.sql
if [ ! -f "$FILE" ]; then	#Test whether wordpress is already installed
    echo "Creating script..."
    echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" > create_db.sql
    echo "CREATE USER '${DB_LOGIN}'@'%' identified by '${DB_PASS}';" >> create_db.sql
    echo "GRANT ALL PRIVILEGES ON *.* TO '${DB_LOGIN}'@'%';" >> create_db.sql
    echo "FLUSH PRIVILEGES;" >> create_db.sql
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOTPASS}';" >> create_db.sql
    echo $(cat create_db.sql)
    echo "Starting mysql daemon"
    mysqld_safe --init-file=$PWD/create_db.sql
else
    echo "Starting mysql daemon"
    mysqld_safe
fi
