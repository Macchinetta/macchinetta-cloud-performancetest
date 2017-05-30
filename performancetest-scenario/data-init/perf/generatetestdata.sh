#!/bin/sh
#----------------------------------------------------------------

SQL_DIR=/home/ec2-user/cn-tool/perf

DB_USER=postgres
DB_PASSWORD=postgres

DB_NAME=atrs

DB_HOST01=cn-performance-db1.XXXX.ap-northeast-1.rds.amazonaws.com
DB_HOST02=cn-performance-db2.XXXX.ap-northeast-1.rds.amazonaws.com
DB_HOST03=cn-performance-db3.XXXX.ap-northeast-1.rds.amazonaws.com

DB_PORT=5432


#SET PGCLIENTENCODING=UTF-8

echo "****DB_HOST01 START****"

PGPASSWORD=${DB_PASSWORD} PGUSER=${DB_USER} PGHOST=${DB_HOST01} PGDB=${DB_NAME} ${SQL_DIR}/init_tables.sh ${SQL_DIR}/sqls/performance-sharding-test-postgres

echo "****DB_HOST01 END****"

echo "****DB_HOST02 START****"

PGPASSWORD=${DB_PASSWORD} PGUSER=${DB_USER} PGHOST=${DB_HOST02} PGDB=${DB_NAME} ${SQL_DIR}/init_tables.sh ${SQL_DIR}/sqls/performance-sharding-test-postgres1

echo "****DB_HOST02 END****"

echo "****DB_HOST03 START***"

PGPASSWORD=${DB_PASSWORD} PGUSER=${DB_USER} PGHOST=${DB_HOST03} PGDB=${DB_NAME} ${SQL_DIR}/init_tables.sh ${SQL_DIR}/sqls/performance-sharding-test-postgres2

echo "****DB_HOST03 END****"
