create database fornecedores;
use fornecedores;

create table fornecedor (f_id char(2) primary key,
 fnome varchar(25), 
 statuss integer(10),
 cidade varchar(25));
 
create table pecas (p_id char(2) primary key,
 pnome varchar(25), 
 cor varchar(25),
 peso integer(10),
 cidade varchar(25));
 
create table remessas (f_id char(2),
 p_id char(2), 
 qtd integer(10),
 foreign key(f_id) references fornecedor(f_id),
 foreign key(p_id) references pecas(p_id));
 
insert into fornecedor values ('f1', 'pedro', 20, 'recife');
insert into fornecedor values ('f2', 'maria', 10, 'fortaleza');
insert into fornecedor values ('f3', 'sonia', 30, 'joão pessoa');
insert into fornecedor values ('f4', 'jose', 20, 'recife');
insert into fornecedor values ('f5', 'afranio', 30, 'natal');

insert into pecas values ('p1', 'porca', 'vermelho', 08, 'recife');
insert into pecas values ('p2', 'pino', 'verde', 17, 'fortaleza');
insert into pecas values ('p3', 'parafuso_1', 'azul', 10, 'natal');
insert into pecas values ('p4', 'parafuso_2', 'vermelho', 14, 'recife');
insert into pecas values ('p5', 'cano', 'azul', 18, 'fortaleza');
insert into pecas values ('p6', 'mola', 'preta', 16, 'natal');
insert into pecas values ('p7', 'tubo', 'vermelho', 15, 'recife');

insert into remessas values ('f1', 'p1', 300);
insert into remessas values ('f1', 'p2', 200);
insert into remessas values ('f1', 'p3', 220);
insert into remessas values ('f1', 'p4', 200);
insert into remessas values ('f1', 'p5', 100);
insert into remessas values ('f1', 'p6', 100);
insert into remessas values ('f2', 'p1', 300);
insert into remessas values ('f2', 'p2', 400);
insert into remessas values ('f2', 'p2', 070);
insert into remessas values ('f4', 'p2', 200);
insert into remessas values ('f4', 'p4', 060);
insert into remessas values ('f4', 'p5', 050);

select p_id, pnome from pecas where peso between 500 and 2600;

select * from fornecedor f where f_id in 
(select f_id from remessas where qtd < 100) and
 f.cidade = 'recife' or f.cidade = 'fortaleza';
 
select f.f_id, f.fnome, f.statuss, f.cidade from fornecedor f
inner join remessas r on f.f_id = r.f_id
where r.qtd > 100 and (f.cidade = 'natal' or f.cidade = 'joão pessoa') 
group by f.f_id order by f.cidade desc, f.fnome asc;

-- Não entendi a questão, mas acho que pode ir por esse caminho:
select f.fnome, f.cidade, f.f_id, count(f.f_id) from fornecedor f
inner join remessas r on f.f_id = r.f_id; 

select p.pnome, p.cidade from pecas p where p.p_id not in
(select p_id from remessas);

select pnome from pecas where pnome like '%no';

select f.fnome, f.cidade from fornecedor f
inner join remessas r on f.f_id = r.f_id
where r.qtd between 60 and 200 group by f.fnome;

select f.f_id, f.fnome from fornecedor f
inner join remessas r on f.f_id = r.f_id
where r.qtd > 200 group by f.f_id order by f.fnome asc;

select f.fnome from fornecedor f where f.f_id not in
(select f_id from remessas) order by f.fnome asc;

select fnome from fornecedor where fnome like '%i_';

select f.fnome, f.cidade from fornecedor f
inner join remessas r on f.f_id = r.f_id
inner join pecas p on r.p_id = p.p_id
where r.qtd between 60 and 200 and (p.pnome = 'porca' or p.pnome = 'pino')
group by f.fnome;