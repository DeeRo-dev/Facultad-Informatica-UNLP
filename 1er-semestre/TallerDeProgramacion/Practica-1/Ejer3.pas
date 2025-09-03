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
    
    dataGeneros = array [generos] of integer;
    
procedure leerPelicula(var r: pelicula);
begin
    writeln('----- Vamos a leer informacion de la pelicula -----');
    write('Ingrese el codigo de pelicula: ');
    readln(r.codigoPel);
    if(r.codigoPel <> -1 ) then
    begin
        write('Ingrese el codigo de genero: ');
        readln(r.codigoGen);
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
    gen: generos;
begin
    // Inicializar el vector con valores mínimos
    for gen := 1 to limit do
    begin
        g[gen].puntaje := -1; // valor muy bajo
        g[gen].codigoPel := -1;
    end;

    // Recorrer la lista una sola vez
    while (l <> nil) do
    begin
        gen := l^.dato.codigoGen;
        if (l^.dato.puntaje > g[gen].puntaje) then
        begin
            g[gen].puntaje := l^.dato.puntaje;
            g[gen].codigoPel := l^.dato.codigoPel;
        end;
        l := l^.sig;
    end;
end;
var
    l : peliculas;
    g :dataGeneros;
    i:integer;
begin
    l := nil;
    cargarInfo(l);
    imprimirPeliculas(l);
    for i := 1 to limit do
        g[i] := -1;
    incisoB(l, g);
End.
