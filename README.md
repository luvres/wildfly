# Windfly 10.1.0 Final
## Wildfly 10 with the main SQL connectors in container Docker

### Pull image latest
```
docker pull izone/wildfly
```
### Run pulled image
```
docker run --rm --name Wildfly -h wildfly \
-p 8080:8080 \
-p 9990:9990 \
-ti izone/wildfly
```
### Or
```
docker run --name Wildfly -h wildfly \
-p 8080:8080 \
-p 9990:9990 \
-d izone/wildfly
```
### Links Databases
```
docker run \
--name Wildfly -h wildfly \
--link MySQL:mysql-host \
--link MariaDB:mariadb-host \
--link OracleXE:oracle-host \
--link PostgreSQL:postgres-host \
-p 8080:8080 \
-p 9990:9990 \
-d wildfly
```

### Browser access:
```
http://localhost:8080/
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

The script can be run anywhere after downloading:

        git clone https://github.com/luvres/wildfly-10.1.0.Final.git
        cd wildfly-10.1.0.Final

For construction of the container run the following command with with the necessary parameters:

	sh wildfly_10_sql.sh <pasword Manager Web> <wildfly port(8080)> <admin port(9990)>

Example:

	sh wildfly_10_sql.sh p4asSwd 8888 9999
