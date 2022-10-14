select * from ventas
select * from paises

--select  fecha , [ID Pais] , [ID PRODUCTO],
--	[Cantidad ] , [ID FACTURA] , [ID CLIENTE] ,
--	[Total Ventas] , [Variación%] , CODIGO , Tipo
--		Plazo , [FECHA DE TERMINO] , [Día de pago] 
--		, [DIAS DE PLAZO] , [dias de plazo 2] , [TIPO DE VENTA] , 
--		[PRECIO CALCULADO], [Pais de Destino]
--from ventas
--	join paises 
--		on  [ID Pais] = paises.[ID_PAIS] 
	select * from ventas 
		left join paises
		on [ID Pais] = paises.ID_pais