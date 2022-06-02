# Linux
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
