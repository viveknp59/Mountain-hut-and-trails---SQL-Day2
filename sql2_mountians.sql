


create table mountain_hut(
id integer not null,
name varchar(40) not null, 
altitude integer not null,
unique(name),
unique(id))
;

create table trails(
hut1 integer not null,
hut2 integer not null);

drop table mountain_hut;

insert into mountain_hut values (1, 'Dakota',1900);
INSERT INTO mountain_hut VALUES (2, 'Alpine View', 2100);
INSERT INTO mountain_hut VALUES (3, 'Summit Rest', 1600);
INSERT INTO mountain_hut VALUES (4, 'Glacier Point', 782);
INSERT INTO mountain_hut VALUES (5, 'Evergreen Shelter', 1370);

INSERT INTO trails VALUES (1,3);
INSERT INTO trails VALUES (3,2);
INSERT INTO trails VALUES (3,5);
INSERT INTO trails VALUES (4,5);
INSERT INTO trails VALUES (1,5);


WITH cte_trails1 AS (
    SELECT 
        t1.hut1 AS start_hut,
        h1.name AS start_hut_name,
        h1.altitude AS start_hut_altitude,
        t1.hut2 AS end_hut
    FROM mountain_hut h1
    JOIN trails t1 ON t1.hut1 = h1.id
),
cte_trails2 AS (
    SELECT 
        t2.*,
        h2.name AS end_hut_name,
        h2.altitude AS end_hut_altitude,
        CASE 
            WHEN t2.start_hut_altitude > h2.altitude THEN 1 
            ELSE 0 
        END AS altitude_flag
    FROM cte_trails1 t2
    JOIN mountain_hut h2 ON h2.id = t2.end_hut
),

cte_final as(
SELECT 
    CASE WHEN altitude_flag = 1 THEN start_hut ELSE end_hut END AS start_hut,
    CASE WHEN altitude_flag = 1 THEN start_hut_name ELSE end_hut_name END AS start_hut_name,
    CASE WHEN altitude_flag = 1 THEN end_hut ELSE start_hut END AS end_hut,
    CASE WHEN altitude_flag = 1 THEN end_hut_name ELSE start_hut_name END AS end_hut_name
FROM cte_trails2)


select c1.start_hut_name as startpt
, c1.end_hut_name as middlept
,c2.end_hut_name as endpt
from cte_final c1
join cte_final c2 on c1.end_hut = c2.start_hut







--1,3,5 
--2,3,5
--3,5,4
--1,5,4
