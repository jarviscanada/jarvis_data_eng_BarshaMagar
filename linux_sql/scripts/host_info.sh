#!/bin/bash

psql_host=$1
psql_port=$2
db_name=$3
psql_user=$4
psql_password=$5


if [ $# -eq 0 ]
then
  echo "This progeam exit from here"
  exit 1
fi

#Save machine statistics in MB and current machine hostname to variables
vmstat_mb=$(vmstat --unit M)
hostname=$(hostname -f)

#Retrieve hardware specification variables
cpu_number=$(lscpu  | egrep "^CPU\(s\):" | awk '{print $2}' | xargs)
cpu_architecture=$(lscpu | egrep "Architecture" | awk '{print $2}' | xargs)
cpu_model=$(lscpu | egrep "\bModel\s\bname" | awk '{print $3, $4, $5}' | xargs)
cpu_mhz=$(lscpu  | egrep "\bCPU\s\MHz" | awk '{print $3}' | xargs)
l2_cache=$(lscpu | egrep "\bL2\s\bcache" | awk '{print $3}' | xargs)
total_mem=$(grep "^MemTotal" /proc/meminfo | awk '{ print $2 }')
timestamp=$(vmstat -t | awk '{print $18, $19}' | tail -n1| xargs)


#set up environment variable for pql cmd
export PGPASSWORD=$psql_password

#Insert server usage data into host_info table
psql -h $psql_host -p $psql_port -d $db_name -U $psql_user -c "INSERT INTO host_usage(timestamp,memory_free,cpu_idle,cpu_kernel,disk_io,disk_available) VALUES('$timestamp','$memory_free','$cpu_idle','$cpu_kernel','$disk_io','$disk_available')";

* * * * * bash /home/centos/project/jarvis_data_eng_TirupatiShiwakoti/linux_sql/scripts/host_usage.sh localhost 5432 host_agent postgres password > /tmp/host_usage.log

exit
