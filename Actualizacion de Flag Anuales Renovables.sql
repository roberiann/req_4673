--CONSULTAS PARA VERIFICAR LA CANTIDAD DE REGISTROS A ACTUALIZAR
-- ================================================
 select COUNT(1)
 from siebel.s_asset a, siebel.CX_S_ASSET_X a1
 where a1.par_row_id = a.row_id AND 
       a1.UA_TIPO_VENTA_VOUCHER = 'Anual con renovacion automatica'

select COUNT(1) from siebel.s_asset  where row_id in (SELECT a.row_id from siebel.s_asset a, siebel.CX_S_ASSET_X a1
 where a1.par_row_id = a.row_id AND 
       a1.UA_TIPO_VENTA_VOUCHER = 'Anual con renovacion automatica')


--=================================================
update siebel.s_asset set X_ANUALES_RENOVABLES_FLG = 'Y' where row_id in (SELECT a.row_id from siebel.s_asset a, siebel.CX_S_ASSET_X a1
 where a1.par_row_id = a.row_id AND a1.UA_TIPO_VENTA_VOUCHER = 'Anual con renovacion automatica')
-- ================================================
