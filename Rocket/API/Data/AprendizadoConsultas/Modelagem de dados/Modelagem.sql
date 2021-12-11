
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

Create Table Organizacao.Usuarios(


		UsuarioId						bigint primary key identity 
	,	EmpresaId						bigint foreign key (EmpresaId) references Organizacao.Empresas(EmpresaId)
	,	Nome							varchar(100) not null
	,	Sobrenome						varchar(100) not null
	,	Email							varchar(100) not null	
	,	Senha							varchar(max) not null
	,	BloqueioTmporario				datetime2
	,	Bloqueio						bit not null 
	,	TimeZone						varchar(6) not null
)

Create Table Organizacao.UsuariosTokens(

		UsuarioTokenId	bigint primary key identity
	,	UsuarioId		bigint foreign key(UsuarioId) references Organizacao.Usuarios(UsuarioId)
	,	TipoToken		varchar(50) not null
	,	Token			varchar(36) not null
	,	Ativo			bit not null 
)

Select Len('9F5C2881-BD18-460C-AEC8-90456E85C2AC')

Select newid()

Drop Table Organizacao.UsuariosTokens