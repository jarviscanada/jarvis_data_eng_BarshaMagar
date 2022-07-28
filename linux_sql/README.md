# Linux/SQL Project
## Introduction
Linux/SQL project is about designing & implementing the business needs of LCA team who are Jarvis Linux Cluster Administrator team.A MVP is needed to be designed for the team to meet their business need. The implementation of the program is done through Linux command lines, Bash scripts, PostgreSql, docker, IDE and dbeaver. This project uses Scrum approach. Github is used as a host for repositiories to manage project releases.Bash scripting language is used for main script development. The overall system is set up and running on Centos 7 in a remote desktop hosted by Google Cloud Platform.

## Quick Start
#### Start a psql instance using psql_docker.sh

 ```Bash
      bash ./scripts/psql_docker.sh start|stop|create [db_username][db_password]
 ```
#### Create tables using ddl.sql
host_info and host_usage tables are created in host_agent database. The configuration is done through ddl.sql file.
```Bash
      bash psql -h localhost -p 5432 -U db_username -f ./sql/ddl.sql
```
#### Insert hardware specification data into the DB using host_info.sh
```Bash
        bash ./scripts/host_info.sh localhost 5432 db_name db_username db_password
```
#### Insert hardware usage data into the DB using host_usage.sh
```Bash
        bash ./scripts/host_usage.sh localhost 5432 db_name db_username db_password
```
#### Crontab setup
```Bash
      crontab -e
      * * * * * bash ~full_path~/scripts/host_usage.sh localhost 5432 host_agent postgres password > /tmp/host_usage.log
```
## Implementation
### Architecture
host_info.sh and host_usage.sh scripts are available in each server cluster that inserts data to the host server database. 
##### Architectural diagram
![linux_SQL_arch](https://user-images.githubusercontent.com/29828383/171734106-64abc302-662e-4f90-baed-194862577ece.jpg)

### Scripts
```psql_docker.sh``` : It controls the docker container with postgres server. To check if the container is running ```docker ps -f name=jrvs-psql```

```ddl.sql```  : to set uo the database ```psql -h [hostname] -U [username] -p [port number] -c "ddl.sql"```

```host_info.sh```: Server hardware information is collected and store in the database, to execute ```./host_info.sh [host name] [database name] [username] [user password]```

```host_usage.sh```: Server data that contains it's memory and CPU usage are collected and excuted using ```./host_usage.sh [hostname] [database name] [username] [user password]```

```crontab```: To schedule host_usage.sh to execute once every 5 minute, crontab is utilized. To edit scheduled tasks ```crontab -e```. 

```queries.sql```: To execute ```psql -h [hostname] -U [username] -p [port number] -c "queries.sql"```

### Database Modeling
host_info table has following structure
id               Serial NOT NULL,
hostname         VARCHAR NOT NULL,
cpu_number       int not null,
cpu_architecture varchar not null,
cpu_model        int not null,
cpu_mhz          varchar not null,
l2_cache         varchar not null,
total_mem        int not null,
timestamp        varchar not null

host_usage table has following structure
id                Serial not null
 timestamp        Timestamp not null
 host_id          INTEGER NOT NULL
 memory_free      Varchar
 cpu_idle         Varchar
 cpu_kernel       Varchar
 disk_io          Varchar
 disk_available   Varchar

## Test
psql_docker.sh was tested by verifying whether the docker container with postgres server was successfully created, started & stopped.

ddl.sql was tested by verifying the database and tables in postgres server.

host/-info.sh & host_usage.sh scripts were tested by running with queries corresponding to the tables that verified by inserting operations.

queries.sql was tested by the data & running queries on it. 

## Improvements
- Add support for writing several database queries
