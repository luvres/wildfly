## Windfly 10
### Windfly 10.1.0 Final with the main SQL connectors Java 8
-----
### Pull image latest
```
docker pull izone/wildfly
```
### Run pulled image
```
docker run --rm --name Wildfly -h wildfly \
-p 8080:8080 \
-p 9990:9990 \
-e PASS="admin" \
-ti izone/wildfly
```
### Or
```
docker run --name Wildfly -h wildfly \
-p 8080:8080 \
-p 9990:9990 \
-d izone/wildfly
```
### Links Databases with JDBC Datasource
##### MySQL
```
docker run --name MySQL -h mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=pass -d mysql

docker run --rm --name Wildfly -h wildfly \
--link MySQL:mysql-host \
-e HOST_MYSQL=mysql-host \
-e PASS="aamu02" \
-e PORT_MYSQL=3306 \
-e USER_MYSQL=root \
-e PASS_MYSQL=pass \
-e DB_MYSQL=mysql \
-p 8080:8080 \
-p 9990:9990 \
-ti izone/wildfly
```
##### Oracle
```
docker run --name OracleXE -h oraclexe -p 1521:1521 -d izone/oracle

docker run --rm --name Wildfly -h wildfly \
--link OracleXE:oracle-host \
-e HOST_ORACLE=oracle-host \
-e PORT_ORACLE=1521 \
-e USER_ORACLE=system \
-e PASS_ORACLE=oracle \
-e DB_ORACLE=XE \
-p 8080:8080 \
-p 9990:9990 \
-ti izone/wildfly
```
### Browser access:
```
http://localhost:8080/
```
##### Default password if not defined
```
username: admin
password: admin
```
### Browser Administration Console access:
```
http://localhost:9990/
User Name: admin
Password: p4asSwd
```

### Configuration/Subsystem/Datasources/Non-XA
```
	Add
	  Custom
	    Next >>
	      Name*: MySQLDS
	             MariadbDS
	             PostgresDS
	             OracleDS

        JNDI Name*: java:/MySQL-JNDI
                    java:/Mariadb-JNDI
                    java:/Postgres-JNDI
                    java:/Oracle-JNDI

	Next >>
	   Detected Driver
	      MySQL
	      MariaDB
	      PostgreSQL
	      OracleXE

 	   Next >>
 	      Connection URL*: jdbc:mysql://mysql-host:3306/dbzone
	                       jdbc:mysql://mariadb-host:3306/dbzone
	                       jdbc:postgresql://postgres-host:5432/dbzone
	                       jdbc:oracle:thin:@oracle-host:1521:XE

	      Username: root
	      Password: pass

	      Next >>
		Test Connection

	      Finish
```

### Auto Construction
```
git clone https://github.com/luvres/wildfly.git
cd wildfly

docker build -t izone/wildfly .
```
