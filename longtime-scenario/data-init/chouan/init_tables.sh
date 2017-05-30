#!/bin/bash

sqls=`ls $1`


for sql in ${sqls[@]} ; do
  cat  `readlink -f $1`/$sql | PGPASSWORD=${PGPASSWORD} psql -U ${PGUSER} -h ${PGHOST} -d ${PGDB}
done

