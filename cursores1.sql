--deallocate cursor_productos

declare cursor_productos cursor 
	for select * from Producto
open cursor_productos
fetch next from cursor_productos
close cursor_productos

 declare @id numeric(6,0),
	@nombre varchar(50),
	@apellido varchar(50),
	@tareas varchar(100)
	declare Empleados cursor
		for select empl_codigo,empl_nombre,empl_apellido,empl_tareas from Empleado
	open Empleados	
		fetch Empleados into @id,@nombre,@apellido,@tareas
		while(@@FETCH_STATUS=0)
		begin
			print '-> ' + cast(@id as varchar(12))+ ' '+ @nombre+' '+@apellido+' '+@tareas --convert( varchar(12) ,@id)  -- tambien funciona 
			fetch Empleados into @id,@nombre,@apellido,@tareas
		end
		close Empleados
		deallocate Empleados
			