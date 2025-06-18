{
	10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
	sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
	completa el vector. Una vez finalizada la carga de datos se pide:

	a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
	módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
	retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.

	b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.
	
}

program ejercicio10;
const 
	dimF = 300;
type
	empleado = record
		nombre:string;
		apellido: string;
		salario: real;
	end;
	empleados = array [1..dimF] of empleado;

procedure leerEmpleado(var p:empleado);
begin
	write('Ingrese el salario del empleado: ');
	readln(p.salario);
	if(p.salario <> 0) then
	begin
		write('Ingrese el nombre: ');
		readln(p.nombre);
		write('Ingrese el apellido: ');
		readln(p.apellido);
	end;
end;
procedure almacenarEmpleado(var v: empleados; var dimL: integer);
var
	e:empleado;
	i:integer;
begin
	writeln('Vamos a registrar empleados, el programa finaliza al ingresar el salario 0');
	leerEmpleado(e);
	while((e.salario <> 0) and (dimL < dimF)) do
	begin
	    dimL := dimL + 1;
		v[dimL] := e;
		leerEmpleado(e);
	end;
end;
procedure incisoA(var v: empleados; dimL: integer; num: real);
var 
    i: integer;
begin
    for i := 1 to dimL do
    begin
        v[i].salario := v[i].salario * num;
    end;
end;
procedure incisoB(v: empleados; dimL:integer; var promedio: real);
var 
    i: integer;
    sumaSalarios: real;
begin
    sumaSalarios := 0;
    for i := 1 to dimL do
    begin
        sumaSalarios := sumaSalarios + v[i].salario;
    end;
    promedio := sumaSalarios / dimL;
end;
var
	i, dimL: integer;
	v: empleados;
	num, promedio: real;
begin
	dimL:= 0;
	almacenarEmpleado(v, dimL);
	write('Ingrese un valor para incrementar el salario de los empleados: ');
	readln(num);
	incisoA(v, dimL, num);
	for i := 1 to dimL do
    begin
        writeln('Empleado: ', v[i].nombre, ' ,su salario es de: ', v[i].salario:0:2);
    end;
    incisoB(v, dimL, promedio);
    writeln('El salario promedio de los empleados es: ', promedio:0:2);
End.