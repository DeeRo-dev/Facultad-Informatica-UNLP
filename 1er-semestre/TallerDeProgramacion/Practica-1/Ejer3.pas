{   
    3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
    septiembre de 2025. De cada película se conoce: código de película, código de género (1:
    acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y
    puntaje promedio otorgado por las críticas.
    Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
    
    a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
    género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
    código de la película -1.
    
    b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
    obtenido entre todas las críticas, a partir de la estructura generada en a)..
    
    c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
    métodos vistos en la teoría.
    
    d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
    del vector obtenido en el punto c). 
}

program ejercicio3;
const
    limit = 8;
type 
    generos = 1..limit;
    
    pelicula = record
        codigoPel: integer;
        codigoGen: generos;
        puntaje: real;
    end;
    
    peliculas = ^dataPelicula;
    dataPelicula = record
        dato : pelicula;
        sig : peliculas;
    end;
    
    mejorPelicula = record
        codigoPel: integer;
        puntaje: real;
    end;

    dataGeneros = array [generos] of mejorPelicula;
    
procedure leerPelicula(var r: pelicula);
begin
    writeln('----- Vamos a leer informacion de la pelicula -----');
    write('Ingrese el codigo de pelicula: ');
    readln(r.codigoPel);
    if(r.codigoPel <> -1 ) then
    begin
        write('Ingrese el codigo de genero: ');
        readln(r.codigoGen);
        while((r.codigoGen < 1) or (r.codigoGen > limit)) do
        begin
            write('Ingrese el codigo 1..8: ');
            readln(r.codigoGen);
        end;
        write('Ingrese el puntaje promedio: ');
        readln(r.puntaje);
    end;
end;

procedure armarNodo(var l: peliculas; r: pelicula);
var
    nuevo: peliculas;
begin
    new(nuevo);
    nuevo^.dato:= r;
    nuevo^.sig:=l;
    l:=nuevo;
end;

procedure cargarInfo(var l: peliculas);
var
    r : pelicula;
begin
    leerPelicula(r);
    while(r.codigoPel <> -1 ) do
    begin
        armarNodo(l, r);
        leerPelicula(r);
    end;
end;
procedure imprimirPeliculas(l: peliculas);
begin
    while(l <> nil) do
    begin
        writeln;
        writeln('------ Datos de la pelicula -----');
        writeln('Codigo de la pelicula: ', l^.dato.codigoPel);
        writeln('Codigo del genero: ', l^.dato.codigoGen);
        writeln('Puntje promedio: ', l^.dato.puntaje:0:2);
        l:=l^.sig;
    end;
end;

procedure incisoB(l : peliculas; var g : dataGeneros);
var
    i: integer;
begin
    // Inicializar
    for i := 1 to limit do
    begin
        g[i].codigoPel := -1;
        g[i].puntaje := -1.0;
    end;

    // Recorrer la lista
    while (l <> nil) do
    begin
        if (l^.dato.puntaje > g[l^.dato.codigoGen].puntaje) then
        begin
            g[l^.dato.codigoGen].codigoPel := l^.dato.codigoPel;
            g[l^.dato.codigoGen].puntaje := l^.dato.puntaje;
        end;
        l := l^.sig;
    end;
end;


procedure ordernarSeleccion(var v : dataGeneros);
var
	i,j, pos: integer;
	item: mejorPelicula;
begin
	for i := 1 to limit - 1 do
	begin
		pos := i;
		for j := i + 1 to limit do
		begin
			if(v[j].puntaje < v[pos].puntaje) then
			begin
				pos := j;
			end;
			item := v[pos];
			v[pos] := v[i];
			v[i] := item;
		end;
	end;
end;

procedure incisoD(v : dataGeneros);
var
	i, codMax, codMin: integer;
	max, min: real;
begin
	max:= -1;
	min:= 999;
	for i := 1 to limit do
	begin
		if(v[i].puntaje > max) then
		begin
			codMax := v[i].codigoPel;
			max:= v[i].puntaje;
		end;
		if(v[i].puntaje < min) then
		begin
			codMin := v[i].codigoPel;
			min:= v[i].puntaje;
		end;
	end;
	writeln;
	writeln('La pelicula con mayor puntaje (', max , ') es la que tiene codigo: ', codMax);
	writeln;
	writeln('La pelicula con menor puntaje (', min , ') es la que tiene codigo: ', codMin);
	writeln;
end;

var
    l : peliculas;
    g :dataGeneros;
    i:integer;
begin
    l := nil;
    cargarInfo(l);
    imprimirPeliculas(l);
    incisoB(l, g);
    ordernarSeleccion(g);
    incisoD(g);
End.
