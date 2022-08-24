ALTER FUNCTION Circulo
(
	@radio float
)
RETURNS varchar(250)
AS
BEGIN
	DECLARE @Area float, @Perimetro float
	Declare @Resp varchar(250)

	set @Area = (SELECT PI() * POWER(@radio,2))
	set @Perimetro = (SELECT 2 * PI() * @radio)
	set @Resp= ('El Area Del Circulo Es De: ' + cast(@Area as varchar(10)) + ' Unidades Cuadradas ' + Space(15) + ' Y Su Perimetro Es: ' + cast(@Perimetro as varchar(10)) + ' Unidades')

	RETURN @Resp
END
GO