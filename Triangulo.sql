ALTER FUNCTION Triangulo
(
	@base float, @ladoI float, @ladoD float, @altura float
)
RETURNS varchar(250)
AS
BEGIN
	DECLARE @Area float, @Perimetro float
	Declare @Resp varchar(250)

	
	set @Area = (SELECT (@base * @altura)/2)
	set @Perimetro = (SELECT @base + @ladoI + @ladoD)
	set @Resp = ('El Area Del Triangulo Es De: ' + cast(@Area as varchar(10)) + ' Unidades Cuadradas ' + Space(15) + ' Y Su Perimetro Es: ' + cast(@Perimetro as varchar(10)) + ' Unidades')
	
	RETURN @Resp
END
GO