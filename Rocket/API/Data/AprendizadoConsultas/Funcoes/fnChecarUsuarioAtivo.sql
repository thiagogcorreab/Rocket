USE [RocketEspelho]
GO
/****** Object:  UserDefinedFunction [Organizacao].[fnChecarUsuarioAtivo]    Script Date: 26/12/2021 20:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Function [Organizacao].[fnChecarUsuarioAtivo](

		@Usuario varchar(256)
)

Returns varchar(5)

As
Begin

Declare @UsuarioOk varchar(5)

Set	@UsuarioOk = (

		Select 'true'
		From Organizacao.Usuarios
		Where Email = @Usuario
		and Ativo = 1
		 

)

if(@UsuarioOk is null)

	Begin

		Set	 @UsuarioOk = 'false'

	end

Return 	@UsuarioOk

End

