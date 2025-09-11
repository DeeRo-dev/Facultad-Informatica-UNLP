{
	7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar
	proyectos de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio
	anterior, se han determinado los siguientes criterios:
	- Sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
	- No se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse
	desde la superficie terrestre con grandes antenas.
	A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6),
	implementar un programa que:
	
	a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con
	los nuevos criterios H2020.
	
	b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de
	la ESA y retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro
	con aquellos que no los cumplen.
	
	c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad
	y el costo total (construcción y mantenimiento) de los proyectos que no serán financiados por
	H2020. Para ello, utilice el módulo realizado en b.
}


program ejercicio6;
const
	DF = 7;
type
	subCategoria = 1..DF;
	sonda = record
		nombre: string;
		duracion: integer;
		costoConstruccion: real;
		costoMantenimiento: real;
		rango: subCategoria;
	end;
	lista = ^nodo;
	nodo = record
		dato: sonda;
		sig: lista;
	end;
	vecCategorias = array[subCategoria] of integer;
procedure leerSonda(var s:sonda);
begin
    writeln('Nombre: '); readln(s.nombre);
    writeln('Duracion mision: '); readln(s.duracion);
    writeln('Costo construccion: '); readln(s.costoConstruccion);
    writeln('Costo mantenimiento: '); readln(s.costoMantenimiento);
    writeln('Categoria sonda: '); readln(s.rango);
    writeln('...........................');
end;
procedure agregarAdelante(var l:lista; s:sonda);
var
    aux:lista;
begin
    new(aux);
    aux^.dato:=s;
    aux^.sig:=l;
    l:=aux;
end;
procedure generarLista(var l:lista);  
var
    s:sonda;
begin
    repeat
        leerSonda(s);
        agregarAdelante(l, s);
    until(s.nombre='GAIA');
end;
procedure inicializarVector(var v: vecCategorias);
var
	i: integer;
begin
	for i:= 1 to DF do
		v[i]:= 0;
end;
procedure maximo(var max: real; var nomMax: string; suma: real; nombre: string);
begin
	if(suma > max) then
		begin
			max:= suma;
			nomMax:= nombre;
		end;
end;
procedure procesarLista(l: lista; var nomMax: string; var v: vecCategorias; var cantSondas: integer);
var
	pI: lista;
	sumaDuraciones: integer;
	max, duracionProm, sumaCostos, precioProm: real;
	cant: integer;
begin
	pI:= l;
	max:= -1;
	sumaDuraciones:= 0;
	sumaCostos:= 0;
	cant:= 0;

	while(l <> nil) do
		begin
			cant:= cant + 1;
			maximo(max, nomMax, l^.dato.costoConstruccion + l^.dato.costoMantenimiento, l^.dato.nombre);
			v[l^.dato.rango]:= v[l^.dato.rango] + 1;
			sumaDuraciones:= sumaDuraciones + l^.dato.duracion;
			sumaCostos:= sumaCostos + l^.dato.costoConstruccion;
			l:= l^.sig;
		end;

	duracionProm:= sumaDuraciones / cant;
	precioProm:= sumaCostos / cant;
	l:= pI;

	while(l <> nil) do
		begin
			if(l^.dato.duracion > duracionProm) then
				cantSondas:= cantSondas + 1;
			if(l^.dato.costoConstruccion > precioProm) then
				writeln(l^.dato.nombre);
			l:= l^.sig;
		end;
end;
procedure imprimirVector(v: vecCategorias);
var
	i: subCategoria;
begin
	for i:= 1 to DF do
		writeln(v[i]);
end;
var
	l: lista;
	v: vecCategorias;
	nomMax: string;
	cant: integer;
begin
	l:= nil;
	cant:= 0;
	generarLista(l);
	inicializarVector(v);
	procesarLista(l, nomMax, v, cant);
	writeln('El nombre de la sonda mas costosa es: ', nomMax);
	writeln('La cantidad de sondas que realizaran estudios en cada rango es: ');
	imprimirVector(v);
	writeln('La cantidad de sondas cuya duracion estimada supera la duracion promedio de todas las sondas es: ', cant);
end.