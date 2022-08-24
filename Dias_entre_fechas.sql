ALTER FUNCTION Dias_entre_fechas
(
	@FechaI date,
	@FechaF date
)
RETURNS varchar(250)
AS
BEGIN
	DECLARE @Dias int
	Declare @Mensaje varchar(250)

	set @Dias = (SELECT DATEDIFF(DAY, @FechaI, @FechaF))
	set @Mensaje = ('Desde la Fecha ' + cast(@FechaI as varchar(10)) + ' Hasta la Fecha ' + cast(@FechaF as varchar(10)) + ' han Transcurrido ' + cast(@Dias as varchar(5)) + ' Dias')

	RETURN @Mensaje
END
GO