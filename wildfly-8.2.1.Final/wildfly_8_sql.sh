#!/bin/sh

if [ $# -ne 3 ]; then
  echo ""
  echo "   sh wildfly.sh <pasword Manager Web> <wildfly port(8080)> <admin port(9990)>"
  echo ""
  exit 1
fi


sed -i "s/ENV PASS admin/ENV PASS $1/" Dockerfile_wildfly_sql_8.2.1.Final
sed -i "s/ENV PORT_ADMIN 9990/ENV PORT_ADMIN $3/" Dockerfile_wildfly_sql_8.2.1.Final

docker build -t wildfly:8.2.1 -f Dockerfile_wildfly_sql_8.2.1.Final .
docker run \
	--link MySQL:mysql-host \
	--link MariaDB:mariadb-host \
	--link OracleXE:oracle-host \
	--link PostgreSQL:postgres-host --name Wildfly -p $2:8080 -p $3:$3 -d wildfly:8.2.1


cd .. && rm wildfly-8.2.1.Final -fR

