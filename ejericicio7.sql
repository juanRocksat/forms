--ejercicio 7
select DISTINCT prod_codigo,item_producto, prod_detalle,item_precio,prod_precio,100*(item_precio -prod_precio)/prod_precio as direfenciaPorcentual
from Producto,STOCK,Item_Factura,STOCK s
where prod_codigo=item_producto and s.stoc_cantidad!=0 and s.stoc_producto=prod_codigo--not  ISNULL(s.stoc_cantidad)   
order by prod_precio
--ejercicio 7
select distinct p.prod_codigo,y.item_producto, p.prod_detalle,y.item_precio,p.prod_precio
from Producto p , Item_Factura y
  left join  STOCK s  
on s.stoc_cantidad!=0 
where y.item_producto=p.prod_codigo and s.stoc_producto=p.prod_codigo
order by prod_precio,prod_codigo,prod_detalle

-- ejercicio 8
select p.prod_detalle,max(c.comp_cantidad) as maximoEnComposicion, s.stoc_cantidad 
from Producto p , STOCK s 
join DEPOSITO d on s.stoc_deposito=d.depo_codigo
join STOCK s2 on s.stoc_producto= s2.stoc_producto 
join Composicion c on s.stoc_producto = c.comp_producto
where p.prod_codigo=s.stoc_producto and s.stoc_producto=c.comp_producto
group by p.prod_detalle ,c.comp_cantidad, s.stoc_cantidad
order by c.comp_cantidad

--hay Productos  que esta en Compisicion y no en Stock y viceversa
select *, c.comp_cantidad from  STOCK s, Producto , Composicion c where  c.comp_producto = s.stoc_producto and prod_codigo=s.stoc_producto