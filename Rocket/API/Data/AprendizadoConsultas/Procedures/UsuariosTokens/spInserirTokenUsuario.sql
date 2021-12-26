USE [RocketEspelho]
GO
/****** Object:  StoredProcedure [Organizacao].[spInserirUsuarioToken]    Script Date: 26/12/2021 20:47:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [Organizacao].[spInserirUsuarioToken](

		@UsuarioId bigint

)

AS

BEGIN

DECLARE @Id BIGINT;

Insert Organizacao.UsuariosTokens(

	
		UsuarioId
	,	TipoToken
	,	Token
	,	Ativo

)Values(

		@UsuarioId
	,	'ValidacaoAPI'
	,	NEWID()
	,	1
	

)

SET @Id = SCOPE_IDENTITY()
SELECT @Id AS Id

END

