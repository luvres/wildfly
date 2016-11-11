#!/bin/sh

if [ $# -ne 3 ]; then
  echo ""
  echo "   sh wildfly.sh <pasword Manager Web> <wildfly port(8080)> <admin port(9990)>"
  echo ""
  exit 1
fi


sed -i "s/ENV PASS admin/ENV PASS $1/" Dockerfile_wildfly_sql_10.1.0.Final
sed -i "s/ENV PORT_ADMIN 9990/ENV PORT_ADMIN $3/" Dockerfile_wildfly_sql_10.1.0.Final

docker build -t wildfly:10.1.0 -f Dockerfile_wildfly_sql_10.1.0.Final .
docker run \
	--link MySQL:mysql-host \
	--link MariaDB:mariadb-host \
	--link OracleXE:oracle-host \
	--link PostgreSQL:postgres-host --name Wildfly -p $2:8080 -p $3:$3 -d wildfly:10.1.0


cd .. && rm wildfly-10.1.0.Final -fR

