```bash
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --mysql > initdb.sql
docker cp ./initdb.sql guac-sql:/initdb.sql
```

```bash
docker exec -it guac-sql bash
```
```bash
mysql -u root -p
```

```sql
CREATE DATABASE guacamole_db;
CREATE USER 'guacamole_user'@'%' IDENTIFIED BY 'pass';
GRANT SELECT,INSERT,UPDATE,DELETE ON guacamole_db.* TO 'guacamole_user'@'%';
FLUSH PRIVILEGES;
USE guacamole_db;
source ./initdb.sql
```
```
8080/guacamole/#/
username: guacadmin
password: guacadmin

settings -> connections -> new connection

```




