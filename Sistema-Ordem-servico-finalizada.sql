-- comentários
-- a linha abaixo cria um banco de dados
create database dbinfox;
-- a linha abaixo escolhe o banco de dados
use dbinfox;
-- o bloco de instruções abaixo cria uma tabela
create table tbusuarios (
iduser int primary key, 
usuario varchar (50) not null,
fone varchar (15),
login varchar (15) not null unique,
senha varchar (15) not null
);
-- o comando abaixo descreve a tabela
describe tbusuarios;
-- a linha abaixo insere dados na tabela (CRUD)
-- create
insert into tbusuarios (iduser, usuario, fone, login, senha)
values (1, 'Gaby', '1498149-9375', 'gabyorlando', '1234');
-- a linha abaixo exibe os dados da tabela (CRUD)
-- read
select * from tbusuarios;
insert into tbusuarios (iduser, usuario, fone, login, senha)
values (2, 'João', '1498217-0959', 'joaopaulo', '4321');
insert into tbusuarios (iduser, usuario, fone, login, senha)
values (3, 'Lucas', '9999999-9999', 'lucas1', '4321');
-- a linha abaixo modifica dados na tabela
-- update
update tbusuarios set usuario = 'JoaoPaulo' where iduser=2;
-- a linha abaixo apaga um registro de tabela 
delete from tbusuarios where iduser = 3;

create table tbclientes( 
idcli int primary key auto_increment, 
nomecli varchar (50) not null,
endcli varchar (100),
fonecli varchar (50) not null,
emailcli varchar (50)
);

insert into tbclientes (nomecli, endcli,fonecli, emailcli)
values ('Junior', 'Av Getulio Vargas', '99-99999-9999', 'junior@gmail.com');

select * from tbclientes;

delete from tbclientes where idcli= 2;

create table tbos (
os int primary key auto_increment,
-- a linha de baixo cria automaticamente uma data e hora de acordo com 
-- a hora do servidor e a data, quando há um insert na tabela
data_os timestamp default current_timestamp, 
equipamento varchar (50) not null,
defeito varchar (500) not null,
servico varchar (150),
tecnico varchar (50),
valor decimal (10,02),
idcli int not null,
foreign key (idcli) references tbclientes (idcli)
);

select * from tbos;
insert into tbos (equipamento, defeito, servico, tecnico, valor, idcli)
values ('Celular', 'Não carrega', 'Manutenção', 'Ana Clara', 150.00, 1);

-- o codigo abaixo traz informações de duas tabelas
select 
O.os,equipamento,defeito,servico,valor,
C.nomecli,fonecli
from tbos as O inner join tbclientes as C
on (O.idcli = C.idcli);
