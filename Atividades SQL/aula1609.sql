create database teste;

use teste;

create table booleans (yesno enum('Y', 'N'), truefalse enum ('T', 'F'));
insert into booleans (yesno, truefalse) values(1,2);
insert into booleans (yesno, truefalse) values('N','T');

create table allergy (symptom set('sneezing', 'runny nose', 'stuffy head', 'red eyes'));
insert into allergy (symptom) values('');
insert into allergy (symptom) values('stuffy head');
insert into allergy (symptom) values('sneezing,red eyes');

select * from allergy;
select * from booleans;

use world;

select * from country where indepyear > 1990;
select * from country where population >= 1000000 and population <= 2000000;
select * from country where population between 1000000 and 2000000;
select * from country where population >= 1000000 and population <= 2000000 and indepyear >1990;