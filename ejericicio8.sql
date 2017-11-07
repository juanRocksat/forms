-- ejercicio 9 
select distinct Jefe.empl_codigo as codigoDeJefe ,NoJefe.empl_codigo  codigoDeEmpleado, Jefe.empl_nombre jefe,NoJefe.empl_nombre as nombreDeEmpleado , count(DelJefe.depo_encargado) depositosDelJefe,count(DelEmpl.depo_encargado) delEmpleado 
from Empleado Jefe, Empleado NoJefe , DEPOSITO DelJefe, DEPOSITO DelEmpl
where NoJefe.empl_jefe=Jefe.empl_codigo and DelJefe.depo_encargado=Jefe.empl_codigo -- and DelEmpl.depo_encargado = NoJefe.empl_codigo
group by DelJefe.depo_encargado,DelEmpl.depo_encargado,Jefe.empl_codigo,NoJefe.empl_codigo, Jefe.empl_nombre,NoJefe.empl_nombre

select distinct Jefe.empl_codigo as codigoDeJefe ,NoJefe.empl_codigo  codigoDeEmpleado, Jefe.empl_nombre jefe,NoJefe.empl_nombre as nombreDeEmpleado , count(DelJefe.depo_encargado) depositosDelJefe,count(DelEmpl.depo_encargado) delEmpleado 
from Empleado Jefe, Empleado NoJefe , DEPOSITO DelJefe, DEPOSITO DelEmpl
where NoJefe.empl_jefe=Jefe.empl_codigo and DelJefe.depo_encargado=Jefe.empl_codigo --and DelEmpl.depo_encargado = NoJefe.empl_codigo
group by DelJefe.depo_encargado,DelEmpl.depo_encargado,Jefe.empl_codigo,NoJefe.empl_codigo, Jefe.empl_nombre,NoJefe.empl_nombre
-- al pareceer el empleado no tiene deposito 