
/* -------------------------------- 1/3 view de 3 tabelas--------------------------------------------------------------------------- */
create view vw_pacientepsicologo (cd_psicologo,nm_psicologo,cd_paciente,nm_paciente) as 
select tb_psicologo.cd_psicologo as 'cd_psicologo', tb_psicologo.nm_psicologo as 'nm_psicologo', tb_paciente.cd_paciente as 'cd_paciente', tb_paciente.nm_paciente as 'nm_paciente'
	from tb_psicologo inner join tb_consulta on tb_psicologo.cd_psicologo = tb_consulta.cd_psicologo
		inner join tb_paciente on tb_consulta.cd_paciente = tb_paciente.cd_paciente;
        
select * from vw_pacientepsicologo;
/* -------------------------------- 1/4 view de 2 tabelas--------------------------------------------------------------------------- */
create view vw_ufcidade (cd_uf , nm_uf, cd_cidade, nm_cidade) as 
select tb_uf.cd_uf as 'cod_uf', tb_uf.nm_uf as 'nome_estado', tb_cidade.cd_cidade as 'cod_cidade', tb_cidade.nm_cidade as 'nome_cidade'
from tb_uf left join tb_cidade on tb_uf.cd_uf = tb_cidade.cd_uf;

select * from vw_ufcidade;

/* -------------------------------- 2/4 view de 2 tabelas--------------------------------------------------------------------------- */
create view vw_pacienteconsulta (nm_paciente, dt_nascimento, dt_consulta, ds_consulta) as 
select tb_paciente.nm_paciente as 'nome_paciente', tb_paciente.dt_nascimento as 'data_nascimento_paciente', tb_consulta.dt_consulta as 'data_consulta', tb_consulta.ds_consulta 
as 'descricao_consulta' from  tb_paciente inner join tb_consulta on tb_paciente.cd_paciente = tb_consulta.cd_paciente;

select * from vw_pacienteconsulta;
/* -------------------------------- 3/4 view de 2 tabelas--------------------------------------------------------------------------- */
create view vw_psiconsulta (cd_psicologo, nm_psicologo, cd_consulta, ds_consulta) as
select tb_psicologo.cd_psicologo as 'cod_psicologo', tb_psicologo.nm_psicologo as 'nome_psicologo', tb_consulta.cd_consulta as 'cod_consulta', tb_consulta.ds_consulta as 
'descricao_consulta' from tb_psicologo inner join tb_consulta on tb_psicologo.cd_psicologo = tb_consulta.cd_psicologo;


select * from vw_psiconsulta;
/* -------------------------------- 4/4 view de 2 tabelas--------------------------------------------------------------------------- */
create view vw_enderecopaciente(nm_paciente, cd_cpf, nm_logradouro, qt_logradouro) as
select tb_paciente.nm_paciente as 'Nome do paciente', tb_paciente.nm_paciente as 'Cpf do paciente', tb_logradouro.nm_logradouro as 'Rua', tb_logradouro.qt_logradouro as 'Numero'
from tb_paciente join tb_logradouro on tb_paciente.cd_logradouro = tb_logradouro.cd_logradouro;

select * from vw_enderecopaciente;

/* -------------------------------- 2/3 view de 3 tabelas--------------------------------------------------------------------------- */
create view vw_pacientecontato(nm_paciente, cd_cpf, nm_empresa, cd_telefone, cd_email) as
select tb_paciente.nm_paciente as 'Nome do paciente', tb_paciente.cd_cpf as 'Cpf do paciente', tb_empresa.nm_empresa as 'Nome da empresa', tb_contato.cd_telefone as 'Numero de telefone',
tb_contato.cd_email as 'Email do paciente' from tb_paciente left join tb_empresa on tb_paciente.cd_empresa = tb_empresa.cd_empresa
join tb_contato on tb_contato.cd_paciente = tb_paciente.cd_paciente;

select * from vw_pacientecontato;
/* -------------------------------- 3/3 view de 3 tabelas--------------------------------------------------------------------------- */
create view vw_bairrouf(nm_bairro, nm_cidade, nm_uf, sg_uf) as
select tb_bairro.nm_bairro as 'Bairro', tb_cidade.nm_cidade as 'Cidade', tb_uf.nm_uf as 'Nome do Estado', tb_uf.sg_uf as 'Sigla do Estado'
from tb_uf inner join tb_cidade on tb_uf.cd_uf = tb_cidade.cd_uf
join tb_bairro on tb_bairro.cd_cidade = tb_cidade.cd_cidade;

select * from vw_bairrouf;
/* -------------------------------- 1/2 view de 4 tabelas--------------------------------------------------------------------------- */
create view vw_enderecouf(nm_logradouro , qt_logradouro, nm_bairro, nm_cidade, nm_uf, sg_uf) as
select tb_logradouro.nm_logradouro as 'Rua', tb_logradouro.qt_logradouro as 'Numero', tb_bairro.nm_bairro as 'Bairro', tb_cidade.nm_cidade as 'Cidade', tb_uf.nm_uf as 'Nome',
tb_uf.sg_uf as 'Sigla do estadinho' from tb_uf left join tb_cidade on tb_uf.cd_uf = tb_cidade.cd_uf
left join tb_bairro on tb_cidade.cd_cidade =  tb_bairro.cd_cidade
left join tb_logradouro on tb_logradouro.cd_bairro = tb_bairro.cd_bairro;

select * from vw_enderecouf;
/* -------------------------------- 2/2 view de 4 tabelas--------------------------------------------------------------------------- */
create view vw_psicologoempresa(nm_psicologo, cd_crp,nm_paciente, cd_cpf, nm_empresa) as 
select tb_psicologo.nm_psicologo as 'Nome do psicologo', tb_psicologo.cd_crp as 'Crp do psicologo', tb_paciente.nm_paciente as 'Nome da paciente', tb_paciente.cd_cpf as 'Cpf do pacientinho',
tb_empresa.nm_empresa as 'Nome da empresa' from tb_psicologo join tb_consulta on tb_psicologo.cd_psicologo = tb_consulta.cd_psicologo
join tb_paciente on tb_consulta.cd_paciente = tb_paciente.cd_paciente
left join tb_empresa on tb_paciente.cd_empresa = tb_empresa.cd_empresa;

select * from vw_psicologoempresa;
/* -------------------------------- 1/3 view de 5 tabelasou mais(5 tabelas)--------------------------------------------------------------------------- */
create view vw_psicologoendereco(nm_psicologo, cd_cnpj,nm_logradouro, qt_logradouro, nm_bairro, nm_cidade, nm_uf, sg_uf) as
select tb_psicologo.nm_psicologo as 'Nome do psicologo', tb_psicologo.cd_cnpj as 'Cnpj do psicologo', tb_logradouro.nm_logradouro as 'Rua',
tb_logradouro.qt_logradouro as 'Numero', tb_bairro.nm_bairro as 'Bairro', tb_cidade.nm_cidade as 'Cidade', tb_uf.nm_uf as 'Estado',
tb_uf.sg_uf as 'Sigla' from tb_psicologo join tb_logradouro on tb_psicologo.cd_logradouro = tb_logradouro.cd_logradouro
join tb_bairro on tb_bairro.cd_bairro = tb_logradouro.cd_bairro
join tb_cidade on tb_cidade.cd_cidade = tb_bairro.cd_cidade
join tb_uf on tb_uf.cd_uf = tb_cidade.cd_uf;

select * from vw_psicologoendereco;
/* -------------------------------- 2/3 view de 5 tabelas (5 tabelas)--------------------------------------------------------------------------- */
create view vw_pacienteendereco(nm_paciente, cd_cpf,nm_logradouro, qt_logradouro, nm_bairro, nm_cidade, nm_uf, sg_uf) as
select tb_paciente.nm_paciente as 'Nome do paciente', tb_paciente.cd_cpf as 'Cpf do paciente', tb_logradouro.nm_logradouro as 'Rua',
tb_logradouro.qt_logradouro as 'Numero', tb_bairro.nm_bairro as 'Bairro', tb_cidade.nm_cidade as 'Cidade', tb_uf.nm_uf as 'Estado',
tb_uf.sg_uf as 'Sigla' from tb_paciente join tb_logradouro on tb_paciente.cd_logradouro = tb_logradouro.cd_logradouro
join tb_bairro on tb_bairro.cd_bairro = tb_logradouro.cd_bairro
join tb_cidade on tb_cidade.cd_cidade = tb_bairro.cd_cidade
join tb_uf on tb_uf.cd_uf = tb_cidade.cd_uf;

select * from vw_pacienteendereco;

/* ------------------------------------------3/3 views de 5 tabelas(todas as tabelas)-----------------------------------------------------------------*/
create view vw_todastabelas(nm_paciente, cd_cpf, nm_empresa, cd_telefone, cd_email, nm_psicologo, cd_crp, nm_logradouro, qt_logradouro, nm_bairro, nm_cidade, nm_uf, sg_uf) as
select tb_paciente.nm_paciente as 'Nome do paciente', tb_paciente.cd_cpf as 'cpf do paciente', tb_empresa.nm_empresa as 'Nome da empresa', tb_contato.cd_telefone
as 'telefone do paciente', tb_contato.cd_email as 'Email do paciente', tb_psicologo.nm_psicologo as 'Nome do psicologo', tb_psicologo.cd_crp as 'Crp do psicologo', 
tb_logradouro.nm_logradouro as 'Rua', tb_logradouro.qt_logradouro as 'Número da casa', tb_bairro.nm_bairro as 'Bairro', 
tb_cidade.nm_cidade as 'Nome da cidade', tb_uf.nm_uf as 'Nome do estado', tb_uf.sg_uf as 'sigla do estado' 
from tb_paciente join tb_contato on tb_paciente.cd_paciente = tb_contato.cd_paciente
join tb_empresa on tb_paciente.cd_empresa = tb_empresa.cd_empresa
join tb_consulta on tb_paciente.cd_paciente = tb_consulta.cd_paciente
join tb_psicologo on tb_consulta.cd_psicologo = tb_psicologo.cd_psicologo
join tb_logradouro on tb_paciente.cd_logradouro = tb_logradouro.cd_logradouro
join tb_bairro on tb_logradouro.cd_bairro = tb_bairro.cd_bairro
join tb_cidade on tb_cidade.cd_cidade = tb_bairro.cd_cidade
join tb_uf on tb_uf.cd_uf = tb_cidade.cd_uf;

select * from vw_todastabelas;
