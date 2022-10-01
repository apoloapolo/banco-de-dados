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
select usuario.nome as Nome do Técnico, usuario.cpf as CPF, tecnico.grupo_tecnico as Grupo Técnico,
acompanhamento.comentario as comentário from usuario
inner join tecnico on tecnico.cpf = usuario.cpf
inner join acompanhamento on tecnico.cpf = acompanhamento.cpf_usuario where acompanhamento.comentario ='Roubou meu pc';

select * from chamado;

select u.nome as `Nome do Funcionário`, u.cpf as CPF, c.stts as `Status`
from usuario u
inner join funcionario f on f.cpf = u.cpf
inner join chamado c on c.cpf_func = f.cpf
where c.stts != 'Concluído'
order by u.nome;