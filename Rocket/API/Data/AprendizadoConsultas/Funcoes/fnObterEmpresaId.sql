USE [RocketEspelho]
GO
/****** Object:  UserDefinedFunction [Organizacao].[fnObterEmpresaId]    Script Date: 26/12/2021 20:50:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Function [Organizacao].[fnObterEmpresaId] (@Usuario varchar(256))
Returns bigint
As
Begin

Return (

	Select EmpresaId
	From Organizacao.Usuarios
	Where Email like @Usuario
	and Ativo = 1

)

End