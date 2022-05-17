CREATE TABLE PUBLIC.host_usage
  (
     timestamp    TIMESTAMP NOT NULL,
     host_id        SERIAL NOT NULL,
memory_free int not null,
cpu_idle varchar not null,
cpu_kernel int not null,
disk_io int not null,
disk_available int not null
     -- add more columns
     -- add foreign key constraint
  );

-- DML
-- INSERT statement
INSERT INTO host_usage (timestamp, memory_free, cpu_idle, cpu_kernel, disk_io, disk_available)
values
('2019-05-29 16:53:28',256,'95',0,0,31220);