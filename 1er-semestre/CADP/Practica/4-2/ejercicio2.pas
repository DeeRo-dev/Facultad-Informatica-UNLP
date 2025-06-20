{
	2. Realice un programa que resuelva los siguientes incisos:

	a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
	cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
	
	b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
	
	c. Lea un nombre y lo inserte en la posición 4 del vector.
	
	d. Lea un nombre y lo agregue al vector.

	--Nota: Realizar todas las validaciones necesarias.

}

program ejercicio2;
const 
	dimF = 500;
	cantCaracteresNombre = 50;
type
	alumnos = array [1..dimF] of string[cantCaracteresNombre];

procedure leerAlumnos(var a: alumnos; var dimL: integer);
const 
	corte = 'ZZZ';
var
	i: integer;
	nombre: string[cantCaracteresNombre];
begin
	i := 1;
	write('Ingrese el nombre del alumno: ');
	readln(nombre);
	while((i <= dimF) and (nombre <> corte)) do
	begin
		a[i] := nombre;
		dimL := dimL + 1;
		i := i + 1;
		if(dimL < dimF) then
		begin
		   write('Ingrese el nombre del alumno: ');
	       readln(nombre); 
		end;
	end;
end;

procedure imprimir(a: alumnos; dimL: integer);
var
	i : integer;
begin
	for i := 1 to dimL do
		writeln('alumno: ', a[i]);
end;

procedure incisoB(var a: alumnos; var dimL: integer; n: string; var ok: boolean);
var
	i, j: integer;
begin
	ok := false;
	i := 1;
	while (i <= dimL) and (not ok) do
	begin
		if (a[i] = n) then
		begin
			ok := true;
			for j := i to dimL - 1 do
				a[j] := a[j + 1];
			dimL := dimL - 1;
		end
		else
			i := i + 1;
	end;
end;

procedure incisoC(var a: alumnos; var dimL: integer; n2: string; var ok: boolean);
var
	i, pos: integer;
begin
	pos := 4;
	ok := false;
	if( (dimL < dimF) and ((pos >=1) and (pos <= dimL))) then
	begin
		for i := dimL downto pos do
			a[i + 1] := a[i];
		a[pos]:=n2;
		ok:= true;
		dimL := dimL + 1;
	end;
end;

procedure incisoD(var a: alumnos; var dimL: integer; n3: string; var ok: boolean);
begin
	ok:= false;
	if(dimL < dimF) then
	begin
		ok:=true;
		dimL := dimL + 1;
		a[dimL] := n3;
	end;
end;
var
	a: alumnos;
	dimL : integer;
	ok : boolean;
	n, n2, n3: string[cantCaracteresNombre]; 
begin
	dimL := 0;
	leerAlumnos(a, dimL);
	writeln(dimL, dimF);
	imprimir(a, dimL);
	writeln('Ingrese un nombre que desea eliminar: ');
	readln(n);
	incisoB(a, dimL, n, ok);
	if(ok) then 
	    writeln('Se elimino correctamente a ', n);
	imprimir(a, dimL);
    write('Ingrese una posicion a insertar en la posicion 4: ');
    readln(n2);
    incisoC(a, dimL, n2, ok);
    if(ok) then 
        writeln('Se inserto correctamente a ', n2)  // <-- mensaje corregido
    else
        writeln('No se pudo insertar (vector lleno o posición inválida)');
    imprimir(a, dimL);
    
    write('Ingrese un nuevo nombre de alumno: ');
    readln(n3);
    incisoD(a, dimL, n3, ok);
    if(ok) then
        writeln('Se agrego correctamente a ', n3)
    else
        writeln('No se pudo agregar (vector lleno)');
    imprimir(a, dimL);
End.