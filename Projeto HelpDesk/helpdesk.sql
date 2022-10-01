create database helpdesk;
use helpdesk;

create table usuario(
cpf char(11) primary key,
nome varchar(40)
) default charset = utf8;

create table empresa(
cnpj char(14) primary key,
endereco text,
nome_empresa varchar(40)
) default charset = utf8;

create table funcionario(

cpf char(11) primary key,
cnpj char(14),
foreign key (cpf) references usuario(cpf),
foreign key (cnpj) references empresa(cnpj)
)default charset = utf8;

create table tecnico(
cpf char(11) primary key,
grupo_tecnico set ('Sem Grupo','Elétrica', 'Logística', 'Mecânica', 'Hidraulica','T.I')
default ('Sem Grupo'),
foreign key (cpf) references usuario(cpf)
)default charset = utf8;

create table chamado (
id_chamado int auto_increment primary key,
cpf_func char(11) not null,
hora_abertura datetime not null default CURRENT_TIMESTAMP ,
stts set ('Novo', 'Pendente', 'Processando', 'Concluído') default 'Novo',
descricao text,
tempo_solucao time not null default '00:00:00',
categoria set ('Senha', 'Email', 'Internet', 'Computador', 'Liberação de Horário', 'Instalar programa', 'Novo usuário', 'Suporte')  default ('Suporte'),
foreign key (cpf_func) references funcionario(cpf)
) default charset = utf8;

create table tecnico_chamado (
cpf char(11) not null,
id_chamado int not null,
primary key (cpf, id_chamado),
foreign key (cpf) references tecnico(cpf),
foreign key (id_chamado) references chamado(id_chamado)
) default charset = utf8;


create table acompanhamento (
comentario text not null,
id_chamado int,
cpf_usuario char(11),
foreign key (id_chamado) references chamado(id_chamado),
foreign key (cpf_usuario) references usuario(cpf),
primary key (cpf_usuario, id_chamado)
) default charset = utf8;

insert into usuario (nome, cpf) values
('Rodolfo Rodrigues', '11122211111'),
('Romario Rodrigues', '22222211111'),
('Rogerio Rodrigues', '33322211111'),
('Rodick Rodrigues',  '44422211111'),
('Mario', '55522211111'),
('Ronaldo Rodrigues', '11111111111'),
('Apolo da luz', '22222222211'),
('Vicente dos Compiuter', '33333333311'),
('Gabriel Mecânico', '44444444411'),
('Marissol da lógica', '55555555511');

insert into empresa (cnpj, endereco, nome_empresa) values
('46340917000136', 'Rua Dom Manuel de Medeiros, s/n - Dois Irmãos, Recife - PE', 'Ganso vidros'),
('29528114000190', 'Av. Prof. Moraes Rego, 1235 - Cidade Universitária, Recife - PE', 'Rona infotec'),
('08371598000137', 'Av. Gov. Agamenon Magalhães - Santo Amaro, Recife - PE', 'Apolo academia');

insert into funcionario (cpf, cnpj) values
('11122211111', '46340917000136'),
('22222211111', '46340917000136'),
('33322211111', '08371598000137'),
('44422211111', '29528114000190'),
('55522211111', '29528114000190');

insert into tecnico(cpf, grupo_tecnico)values
('44422211111', default),
('11111111111', 'Logística'),
('22222222211', 'Elétrica'),
('33333333311', 'T.I'),
('44444444411', 'Mecânica');

insert into Chamado (cpf_func, categoria, descricao, stts, tempo_solucao)values
('11122211111','Senha', 'Favor reiniciar minha senha pois esqueci', default, '1:00:00'),
('22222211111','Internet', 'Minha internet está lenta', default, '1:00:00'),
('33322211111','Liberação de horário', 'Irei fazer hora extra, favor liberar meu acesso até às 8 horas da noite', 'Concluído', '4:00:00'),
('44422211111','Computador', 'O monitor do meu computador está apagando', 'Pendente', '8:00:00'),
('11122211111','Instalar programa', 'Preciso do programa para ver PDFs', default, '24:00:00');

insert into acompanhamento(comentario, id_chamado, cpf_usuario)values
('Deu certo', 1, '11122211111' ),
('Meu pc explodiu', 2, '22222211111' ),
('Roubou meu pc', 3, '44422211111' ),
('Muito bom o atendimento', 4, '55555555511' ),
('Atendimento agendado', 5, '33333333311' );

insert into tecnico_chamado(cpf, id_chamado) values
('22222222211',1),
('33333333311',2),
('44444444411',3),
('44422211111',4);

select * from usuario;
select * from chamado;
select * from empresa;
select * from funcionario;
select * from tecnico;
select * from acompanhamento;
select * from tecnico_chamado;