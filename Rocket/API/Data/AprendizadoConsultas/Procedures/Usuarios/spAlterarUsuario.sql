USE [RocketEspelho]
GO
/****** Object:  StoredProcedure [Organizacao].[spAlterarUsuario]    Script Date: 26/12/2021 20:45:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- [Organizacao].[spAlterarUsuario]2, 5, 'Thiago Gilson', 'Corrêa', 'teste@hotmail.com', '123456', '-03:00', 'mariasarahritabarbosa_@tia.mat.br'

ALTER Procedure [Organizacao].[spAlterarUsuario](
	-- Parametros	
		@UsuarioId bigint
	,	@EmpresaId bigint
	,	@Nome varchar(100)
	,	@Sobrenome varchar(100)
	,	@Email varchar(1000)
	,	@Senha varchar(max)
	,	@TimeZone varchar(6)
	,	@Usuario varchar(256)
)

-- Começar a transação
As
Begin 

Set NoCount On;	-- SET NOCOUNT ON melhora o desempenho do procedimento armazenado em tempo de execução

-- Criação das variáveis de validação
Declare @UsuarioAtivo varchar(5);
Declare @ObterEmpresaUsuario bigint;

-- Seta as funções
Set @UsuarioAtivo =  Organizacao.fnChecarUsuarioAtivo(@Usuario);
Set @ObterEmpresaUsuario = Organizacao.fnObterEmpresaId(@Usuario);

-- Valida se o usuário existe na base.
if(@UsuarioAtivo = 'false')
	Throw 51000, 'Usuário invalido na nossa base', 1;

-- Valida se o usuário retornou nulo.
if(@UsuarioId is null)
	Throw 51000, 'O valor do id. não pode ser nulo ou 0', 1;

-- Valida se o id da empresa que veio da função é nulo
if(@ObterEmpresaUsuario is null)
	throw 51000, 'Erro ao persistir integridade no sistema', 1;

-- Valida se o id que veio atravéns de claim do sistema é diferente do id que veio da função da empresa
if(@EmpresaId <> @ObterEmpresaUsuario)
	throw 51000, 'Operação inválida erro na comparação de empresas', 1;

Update Organizacao.Usuarios	
	Set
		Nome = @Nome
	,	Sobrenome = @Sobrenome
	,	Email = @Email
	,	Senha = Convert(varchar(max), HASHBYTES('SHA2_512', @Senha), 2)
	,	TimeZone = @TimeZone
	
	Where UsuarioId = @UsuarioId
	And EmpresaId = @ObterEmpresaUsuario

End