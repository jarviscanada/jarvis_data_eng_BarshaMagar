

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
  CREATE FUNCTION round5(ts timestamp) RETURNS timestamp AS
    $$
    BEGIN
        RETURN date_trunc('hour', ts) + date_part('minute', ts):: int / 5 * interval '5 min';
    END;
    $$
        LANGUAGE PLPGSQL;
    );

-- DML
-- INSERT statement
INSERT INTO host_info
(hostname, cpu_number, cpu_architecture, cpu_model, cpu_mhz, l2_cache, total_mem, timestamp)
values
('local_host',2,'x86_64',63,'2299.998','1234',7489612,'2022-05-17 04:11:40');

