ALTER FUNCTION Cuadrado
(
	@lado int
)
RETURNS varchar(250)
AS
BEGIN
	DECLARE @Area int, @Perimetro int
	Declare @Resp varchar(250)

	set @Area = (SELECT POWER(@lado, 2))
	set @Perimetro = (SELECT @lado * 4)
	set @Resp = ('El Area Del Cuadrado Es De: ' + cast(@Area as varchar(5)) + ' Unidades Cuadradas ' + Space(15) + ' Y Su Perimetro Es: ' + cast(@Perimetro as varchar(5)) + ' Unidades')

	RETURN @Resp
END
GO