

Create Table Enum.Estados(

		EstadoId	 bigint primary key identity 
	,	Nome		 varchar(50) not null
	,	Sigla		 varchar(2)  not null

)

Create Table Organizacao.Empresas(

		Empresaid	bigint primary key identity 
	,	EstadoId	bigint foreign key(EstadoId) references Enum.Estados(EstadoId)
	,	RazaoSocial varchar(100) not null
	,	NomeFantasia varchar(100)
	,	CNPJ varchar(18) not null
	,	InscricaoMunicipal varchar(15)
	,	EmailContato varchar(100) not null
	,	CEP varchar(9) not null
	,	Logradouro varchar(100) not null
	,	Numero varchar(30) not null
	,	Bairro varchar(50) not null
	,	Complemento varchar(30)
	,	Cidade varchar(100) not null

)

Select Len('09350-250')