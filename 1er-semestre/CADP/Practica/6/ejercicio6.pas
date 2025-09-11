{
	6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales
	lanzadas al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la
	misión (cantidad de meses que permanecerá activa), el costo de construcción, el costo de
	mantenimiento mensual y rango del espectro electromagnético sobre el que realizará estudios. Dicho
	rango se divide en 7 categorías: 1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta;
	6. rayos X; 7. rayos gamma.
	Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura
	finaliza al ingresar la sonda llamada “GAIA”, que debe procesarse.
	Una vez finalizada la lectura, informar:
	
	a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
	
	b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
	
	c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
	
	d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las
	sondas.
	Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible
}

program ejercicio6;
type
	catRangos = 1..7;
	sondas = ^sondaNodo;
	sonda = record
		nombre:string;
		durMis: integer;
		costMant: real;
		costConstr: real;
		rango: catRangos;
	end;
	sondaNodo = record
		datos: sonda;
		sig: sondas;
	end;
	almSondas = array [catRangos] of integer;
procedure leerSonda(var s:sonda);
begin
	write('Nombre: ');
	readln(s.nombre);
	write('duracion de la mision: ');
	readln(s.durMis);
	write('Costo del mantenimiento: ');
	readln(s.costMant);
	write('Costo de la construccion del proyecto: ');
	readln(s.costConstr);
	write('ingresa numero de rango.El rango se divide en 7 categorías: 1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta;6. rayos X; 7. rayos gamma: ');
	readln(s.rango);
end;
procedure nuevaSonda(var l: sondas; s: sonda);
var
	nuevo: sondas;
begin
	new(nuevo);
	nuevo^.datos := s;
	nuevo^.sig := l;
	l := nuevo;
end;
procedure generarLista(var l:sondas);
var
	s: sonda;
begin
	repeat
		leerSonda(s);
		nuevaSonda(l, s);
	until(s.nombre = 'GAIA');
end;
procedure sondaMasCostosa(l:sondas; var nombre: string);
var	
	costoPre, costo: real;
begin
	costoPre := 0;
	costo := -1;
	while(l <> nil) do
	begin
		costoPre := l^.datos.costMant + l^.datos.costConstr;
		if(costoPre > costo) then
		begin
			costo := costoPre;
			nombre := l^.datos.nombre;
		end; 
		l := l^.sig;
	end;
end;

procedure incisoB(l: sondas; var v: almSondas);
begin
	while(l <> nil) do
	begin
		v[l^.datos.rango] := v[l^.datos.rango] + 1;
		l := l^.sig;
	end;
end;

function promedio(l: sondas): real;
var 
	suma, cantSondas: integer;
begin
	cantSondas := 0;
	suma := 0;
	while(l <> nil ) do
	begin
		suma := suma + l^.datos.durMis;
		cantSondas := cantSondas + 1;
		l := l^.sig;
	end;
	promedio := suma / cantSondas;
end;

function cantSondas(l: sondas): integer;
var 
	aux : real;
	cont : integer;
	lAux: sondas
begin
	lAux:= l;
	aux := promedio(lAux);
	cont := 0;
	while(l <> nil ) do
	begin
		if(l^.datos.durMis > aux) then 
			cont := cont + 1;
		l := l^.sig;
	end;
	cantSondas := cont;
end;


var
	l:sondas;
	nombre: string;
	i, cantidadSondas: integer;
	almacenarRangos : almSondas;
begin
	l := nil;
	for i := 1 to 7 do
		almacenarRangos[i] := 0;
	generarLista(l);
	sondaMasCostosa(l, nombre);
	writeln('La sonda mas costosa es: ', nombre);
	incisoB(l, almacenarRangos);
	writeln('Cantidad de sondas por rango:');
	for i := 1 to 7 do
		writeln('Rango ', i, ': ', almacenarRangos[i]);
	cantidadSondas := cantSondas(l);
	writeln('La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas son de: ', cantidadSondas)
End.
