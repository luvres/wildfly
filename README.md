# Windfly 10.1.0 Final

Wildfly 10 with the main SQL connectors in container Docker

The script can be run anywhere after downloading:

        git clone https://github.com/luvres/wildfly-10.1.0.Final.git
        cd wildfly-10.1.0.Final

For construction of the container run the following command with with the necessary parameters:

	sh wildfly_10_sql.sh <pasword Manager Web> <wildfly port(8080)> <admin port(9990)>

Example:

	sh wildfly_10_sql.sh p4asSwd 8888 9999

Browser access:

	http://localhost:8888/

Browser Administration Console access:

	http://localhost:9999/
	User Name: admin
	Password: p4asSwd


Configuration/Subsystem/Datasources/Non-XA
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
