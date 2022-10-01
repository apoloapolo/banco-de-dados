use helpdesk;

#Nome dos funcionarios que trabalham na empresa ronainfotec
select usuario.cpf,nome , empresa.cnpj,endereco,nome_empresa from usuario
inner join funcionario on usuario.cpf = funcionario.cpf
inner join empresa on funcionario.cnpj = empresa.cnpj
where empresa.nome_empresa = 'Rona infotec';

insert into Chamado (categoria, descricao, stts, tempo_solucao)values
('Instalar programa', 'Por favor instalar o navegador opera gx', 'Pendente', '1:00:00');
insert into tecnico_chamado(cpf, id_chamado) values
('11122211111',9);
delete from chamado where ID_Chamado = 4;

select usuario.nome from usuario
inner join tecnico on tecnico.cpf = usuario.cpf
inner join tecnico_chamado on tecnico.cpf = tecnico_chamado.cpf
inner join chamado on chamado.ID_Chamado = tecnico_chamado.id_chamado 
where chamado.stts = 'Pendente'
group by tecnico.cpf;

select * from chamado
inner join tecnico_chamado on chamado.ID_Chamado = tecnico_chamado.id_chamado
where tecnico_chamado.cpf = '44422211111' and chamado.stts = 'Pendente';

#Técnicos que estão acompanhando um chamado em que houve furto de computador
select usuario.nome as `Nome do Técnico`, usuario.cpf as `CPF`, tecnico.grupo_tecnico as `Grupo Técnico`,
acompanhamento.comentario as `comentário` from usuario
inner join tecnico on tecnico.cpf = usuario.cpf
inner join acompanhamento on tecnico.cpf = acompanhamento.cpf_usuario where acompanhamento.comentario ='Roubou meu pc';

select * from chamado;

select u.nome as `Nome do Funcionário`, u.cpf as CPF, c.stts as `Status`
from usuario u
inner join funcionario f on f.cpf = u.cpf
inner join chamado c on c.cpf_func = f.cpf
where c.stts != 'Concluído'
order by u.nome;

# Relação de chamados concluídos, agrupados por empresa, e sua quantidade
select c.stts as `Status`, e.nome_empresa as `Empresa`, COUNT(*) as `Total`
from chamado c inner join funcionario f
on c.cpf_func=f.cpf
inner join empresa e
on e.cnpj=f.cnpj
where c.stts = 'Concluído'
group by e.cnpj;

select * from chamado;

# Relação de todos os chamados da empresa Ganso Vidros
select c.id_chamado as `ID`, c.stts as `Status`, c.categoria as `Categoria`, e.nome_empresa as `Empresa`
from chamado c inner join funcionario f
on c.cpf_func=f.cpf
inner join empresa e
on e.cnpj=f.cnpj
where e.nome_empresa = 'Ganso vidros';

# Inserir chamado novo
insert into Chamado (cpf_func, categoria, descricao, stts, tempo_solucao) values
('22222211111','Computador', 'Tela com problemas.', default, '1:00:00');

select * from chamado;

# Realizar update no chamado, marcando como concluído
update chamado
set stts = 'Pendente'
where id_chamado = 2;

select * from chamado;

# Contagem de chamados por status da empresa Ganso Vidros
select e.nome_empresa as `Empresa`, c.stts as `Status`, count(*) as `Quantidade`
from chamado c inner join funcionario f
on c.cpf_func=f.cpf
inner join empresa e
on e.cnpj=f.cnpj
where e.nome_empresa = 'Ganso vidros'
group by c.stts;

select c.stts as `Status`, count(*) as `Quantidade`
from chamado c inner join funcionario f
on c.cpf_func=f.cpf
inner join empresa e
on e.cnpj=f.cnpj
where e.nome_empresa = 'Ganso vidros'
group by c.stts with rollup;