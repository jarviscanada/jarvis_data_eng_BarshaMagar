#!/bin/bash

psql_host=$1
psql_port=$2
db_name=$3
psql_user=$4
psql_password=$5

if [ $# -eq 0 ]
then
  echo "Exit from here"
  exit 1
fi

vmstat_mb=$(vmstat --unit M)
hostname=$(hostname -f)

memory_free=$(echo "$vmstat_mb" | awk '{print $4}'| tail -n1 | xargs)
cpu_idle=$(echo "$vmstat_mb" | awk '{print $15}'| tail -n1 | xargs)
cpu_kernel=$(echo "$vmstat_mb" | awk '{print $14}'| tail -n1 | xargs)
disk_io=$(vmstat -d | awk '{print $10}'| tail -n1 | xargs)
disk_available=$(df -BM / | awk '{print $4}'| tail -n1 | xargs)
timestamp=$(vmstat -t | awk '{print $18}'| tail -n1 | xargs)

host_id="(SELECT id FROM host_info WHERE hostname='$hostname')";


echo "InsertQuery: $insert_stmt"
export PGPASSWORD=$psql_password

psql -h $psql_host -p $psql_port -d $db_name -U $psql_user -c "INSERT INTO host_usage(timestamp,memory_free,cpu_idle,cpu_kernel,disk_io,disk_available)
VALUES('$timestamp','$memory_free','$cpu_idle','$cpu_kernel','$disk_io','$disk_available');"
exit