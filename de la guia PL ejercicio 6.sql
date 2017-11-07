--punto6 ok (le puse order by que no pide 
select  p.prod_detalle, p.prod_codigo , count(*) as 'lol', s.stoc_cantidad ,prod_rubro
from Producto p  ,STOCK s
where p.prod_codigo= stoc_producto and s.stoc_cantidad>(select stoc_cantidad from STOCK,DEPOSITO where depo_codigo='00' and STOCK.stoc_producto='00000000'  )
 group by p.prod_rubro,p.prod_detalle,p.prod_codigo,s.stoc_cantidad,prod_rubro
 order by prod_codigo asc,prod_rubro
 select stoc_cantidad from STOCK,DEPOSITO where depo_codigo='00' and STOCK.stoc_producto='00000000'  

 select * from Producto
-- select* from STOCK