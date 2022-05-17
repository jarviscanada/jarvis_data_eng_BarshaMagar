#save number of CPU to a variable
lscpu_out=`lscpu`
meminfo_out=`cat /proc/meminfo`

#note: `xargs` is a trick to remove leading and trailing white spaces


#hardware
hostname=$(hostname -f)
cpu_number=$(echo "$lscpu_out"  | egrep "^CPU\(s\):" | awk '{print $2}' | xargs)
cpu_architecture=$(echo "$lscpu_out"  | egrep "^Architecture:" | awk '{print $2}' | xargs)
cpu_model=$(echo "$lscpu_out"  | sed -n 's/Model name:[ \t]*//p' | awk '{print $2}' | xargs)
cpu_mhz=$(echo "$lscpu_out"  | sed -n 's/CPU MHz:[ \t]*//p' | awk '{print $2}' | xargs)
l2_cache=$(echo "$lscpu_out"  | sed -n 's/L2 cache:[ \t]*//p' | awk '{print $2}' | xargs)
total_mem=$(echo "$meminfo_out"  | egrep "^MemTotal:" | awk '{print $2}' | xargs)
timestamp= #current timestamp in `2019-11-26 14:40:19` format

#usage

memory_free=$(echo "$meminfo_out"  | egrep "^MemFree:" | awk '{print $2}' | xargs)
cpu_idle=
cpu_kernel=
disk_io=
disk_available=

#echo $memory_free
#echo $total_mem
echo $cpu_mhz