

-- DDL
CREATE TABLE PUBLIC.host_info
  (
    id               serial NOT NULL,
    hostname         VARCHAR NOT NULL,
	cpu_number       int not null,
	cpu_architecture varchar not null,
	cpu_model int not null,
    cpu_mhz varchar not null,
    l2_cache varchar not null,
    total_mem int not null,
    timestamp varchar not null
     -- add more columns
     -- primary key constraint
     -- unique hostname constraint
  
-- DML
-- INSERT statement
INSERT INTO host_info
(hostname, cpu_number, cpu_architecture, cpu_model, cpu_mhz, l2_cache, total_mem, timestamp)
values
('local_host',2,'x86_64',63,'2299.998','1234',7489612,'2022-05-15 07:11:40');

CREATE TABLE PUBLIC.host_usage 
  ( 

     host_id        SERIAL NOT NULL, 
     memory_free    int NOT NULL,
     cpu_idle       VARCHAR NOT NULL,
     cpu_kernel     VARCHAR NOT NULL,
     disk_io        VARCHAR NOT NULL,
     disk_available VARCHAR NOT NULL,
     timestamp    VARCHAR NOT NULL
     FOREIGN KEY(host_id)
     REFERENCES host_info(id)
  ); 

-- INSERT statementpsql -h localhost -U postgres -d host_agent -f sql/ddl.sql
INSERT INTO host_usage (timestamp,memory_free,cpu_idle,cpu_kernel,disk_io,disk_available)
Values('2022-05-15 04:11:03','248','80','0','0','21320 ');
