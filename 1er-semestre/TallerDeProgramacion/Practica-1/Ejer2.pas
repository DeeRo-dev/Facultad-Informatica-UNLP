{

2.- 
    El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
    las expensas de dichas oficinas.
    Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
   
    a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
    se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
    finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
    
    b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
    oficina.

    c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
}

program Ejercicio2;
const  
    cantOf = 300;
type
    dataOficina = record
        codigo: integer;
        dni: integer;
        valorExp: real;
    end;
    ventas = array [1..cantOf] of dataOficina; 

procedure leerOfi(var r: dataOficina);
begin
    writeln;
    writeln('---- Ingrese datos de la oficina ----');
    writeln('Codigo de verificacion: ');
    readln(r.codigo);
    if(r.codigo <> -1) then
    begin
        writeln('Dni del propietario: ');
        readln(r.dni);
        writeln('Valor de la expensa: ');
        readln(r.valorExp);
    end;
end;

procedure almacenarVentas(var v: ventas; var dimL: integer);
var
    i : integer;
    registro: dataOficina;
begin
    i := 1;
    leerOfi(registro);
    while((i < cantOf) and (registro.codigo <> -1) ) do 
    begin
        v[i] := registro;
        dimL := dimL + 1;
        i := i + 1;
        leerOfi(registro);
    end;
end;
procedure imprimir(v: ventas; dimL: integer);
var
    i: integer;
begin
    for i := 1 to dimL do
    begin
        writeln('Ventas numero ', i, ': ');
        writeln('Codigo: ', v[i].codigo);
        writeln('Dni: ', v[i].dni);
        writeln('Valor de la expensa: ', v[i].valorExp:0:2);
        writeln('-------------------');
    end;
end;
procedure ordenarInsersion(var v: ventas; dimL : integer);
var
    i,j: integer;
    actual: dataOficina;
begin   
    for i := 2 to dimL do
    begin
        actual := v[i];
        j := i - 1;
        while((j > 0) and (v[j].codigo > actual.codigo)) do
        begin
            v[ j + 1]  := v[j];
            j := j - 1;
        end;
        v[ j + 1 ] := actual;
    end;
    
end;

procedure ordenarSeleccion(var v: ventas; dimL: integer);
var
    i,j, pos: integer;
    item: dataOficina;
begin
    for i := 1 to dimL - 1 do
    begin
        pos := i;
        for j := i + 1 to dimL  do
        begin
            if(v[j].codigo < v[pos].codigo) then 
                pos := j;
        end;
        item := v[pos];
        v[pos] := v[i]; 
        v[i] := item;
    end;
end;

var
    v : ventas;
    dimL: integer;
begin
    almacenarVentas(v, dimL);
    imprimir(v, dimL);
    ordenarSeleccion(v, dimL);
    imprimir(v, dimL);
End.


//Segunga opcion 
//	El administrador de un edificio de oficinas cuenta, en papel, con la información del
//	pago de las expensas de dichas oficinas. Implementar un programa que invoque a
//	módulos para cada uno de los siguientes puntos:

//	a.  Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De
//		cada oficina se ingresa el código de identificación, DNI del propietario y valor
//		de la expensa. La lectura finaliza cuando se ingresa el código de identificación
//		-1, el cual no se procesa.

//	b.  Ordene el vector aplicando el método de selección, por código de
//		identificación de la oficina.


program ejercicio2;
const 
	dimF = 4;
type
	data = record 
	cod: integer;
	dni: integer;
	valor:real;
	end;
	info = array [1..dimF] of data;

procedure lectura(var d: data);
begin
	write('Ingrese el codigo: ');
	readln(d.cod);
	if(d.cod <> -1) then
	begin
		write('Ingrese el DNI del propietario: ');
		readln(d.dni);
		write('Ingrese el valor de la expn: ');
		readln(d.valor);
	end;
end;

procedure registroDeInfo(var v: info; var dimL: integer);
var 
	aux: data;
begin

	while(dimL < dimF) do
	begin
		lectura(aux);
		if(aux.cod <> -1) then 
		begin
			dimL := dimL +1;
			v[dimL] := aux;
		end;
	end;
end;

procedure ordenar(var v : info; dimL: integer);
var
	i, j, pos:integer;
	item: data;
begin
	for i:= 1 to dimL -1 do
	begin
		pos := i;
		for j := (i + 1) to dimL do
		begin 
			if(v[j].cod < v[pos].cod) then
				pos:= j;
		end;
		item:= v[pos];
		v[pos]:= v[i];
		v[i]:= item;
	end;
end;

procedure imprimir(v: info; dimL : integer);
var
	i: integer;
begin
	for i:= 1 to dimL do
		writeln('Valor: ', v[i].cod);
end;
var 
	v: info;
	dimL : integer;
begin
	dimL := 0;
	registroDeInfo(v, dimL);
	writeln('Dimension logica: ', dimL);
	imprimir(v, dimL);
	writeln('------------------------');
	ordenar(v, dimL);
	imprimir(v, dimL);
End.

