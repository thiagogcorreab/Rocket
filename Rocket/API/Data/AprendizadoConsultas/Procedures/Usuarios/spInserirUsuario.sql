USE [RocketEspelho]
GO
/****** Object:  StoredProcedure [Organizacao].[spInserirUsuario]    Script Date: 26/12/2021 20:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [Organizacao].[spInserirUsuario](

		@EmpresaId				bigint
	,	@Nome					varchar(100)
	,	@Sobrenome				varchar(100)
	,	@Email					varchar(1000)
	,	@Senha					varchar(max)
	,	@Bloqueio				bit
	,	@TimeZone				varchar(6)

)
As
Begin

Declare @Id bigint

Insert Organizacao.Usuarios(

			EmpresaId	
		,	Nome		
		,	Sobrenome	
		,	Email		
		,	Senha		
		,	Bloqueio	
		,	TimeZone	
		,	Ativo	
)
Values (

		
		@EmpresaId
	,	@Nome
	,	@Sobrenome
	,	@Email
	,	Convert(varchar(max), HASHBYTES('SHA2_512', @Senha), 2)
	,	@Bloqueio
	,	@TimeZone	
	,	1

)

Set @Id = SCOPE_IDENTITY()
Select @Id as Id

Exec Organizacao.spInserirUsuarioToken @Id

End