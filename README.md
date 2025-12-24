# Mountain-hut-and-trails---SQL-Day2
Mountain hut and trails - SQL Day2
A ski resort company is planning to construct a new ski slope using a pre-existing network of mountain huts and trails between them. A new slope has to begin at one of the mountain huts have a middle station at another hut connected with the first one by a direct trail, and end at the third mountain hut which is also connected by a direct trail to the second hut. The altitude of the three huts chosen for constructing the ski slopes has to be strictly decreasing 

Each Entry in the table trails represent a direct connection between huts with ID;s hut1 and hut2 Note that all trails are bidirectional 

Create a query that finds all triplets (startpt, middlept,endpt)representing the mountain huts that may be used for construction of a ski slope
output returned by the query can be ordered in any way


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


