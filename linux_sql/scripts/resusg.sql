CREATE TABLE PUBLIC.host_usage
  (
     host_id        SERIAL NOT NULL,
     memory_free int not null,
     cpu_idle varchar not null,
     cpu_kernel varchar not null,
     disk_io varchar not null,
     disk_available varchar not null,
     timestamp    varchar NOT NULL
     -- add more columns
     -- add foreign key constraint
  );

-- DML
-- INSERT statement
INSERT INTO host_usage (memory_free, cpu_idle, cpu_kernel, disk_io, disk_available, timestamp)
values
(256,'95','0','0','31220','2019-05-29 16:53:28');