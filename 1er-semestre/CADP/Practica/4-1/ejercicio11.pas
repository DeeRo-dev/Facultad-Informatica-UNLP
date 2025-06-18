{
	11. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
	ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
	información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
	comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
	lectura, el programa debe procesar los datos e informar:
	
	a) Título de la foto más vista (la que posee mayor cantidad de clics).
	
	b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
	
	c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.

}

program ejercicio11;
const
	cantImagenes = 200;
type
	foto = record
		titulo: string;
		autor: string;
		cantMegustas: integer;
		cantClics: integer;
		cantComent: integer;
	end;
	guardadoDeFotos = array [1..cantImagenes] of foto;

procedure leerInfoFoto(var f:foto);
begin
		write('Ingrese el titulo de la foto: ');
		readln(f.titulo);
		write('Ingrese el nombre del autor: ');
		readln(f.autor);
		write('Ingrese la cantidad de likes: ');
		readln(f.cantMegustas);
		write('Ingrese la cantidad de Clics: ');
		readln(f.cantClics);
		write('Ingrese la cantidad de comentarios: ');
		readln(f.cantComent);
end;
procedure almacenarFoto(var g: guardadoDeFotos);
var
	f:foto;
	i:integer;
begin
	writeln('Vamos a registrar cada foto publicada en su página de Facebook');
	for i := 1 to cantImagenes do
	begin
	    writeln('-----Datos de la foto: -----');
		leerInfoFoto(f);
		g[i] := f;
	end;
end;
procedure incisoA(g: guardadoDeFotos);
var
    aux,pos, i : integer;
begin
    aux := -1;
    for i := 1 to cantImagenes do
	begin
	    if(g[i].cantClics > aux) then
	    begin
	        aux := g[i].cantClics;
	        pos := i;
	    end;
	end;
	writeln('la foto más vistadad es: ', g[pos].titulo);
end;
procedure incisoB(g: guardadoDeFotos);
var
    aux, i : integer;
begin
    aux := 0;
    for i := 1 to cantImagenes do
	begin
	    if(g[i].autor = 'Art Vandelay') then
	    begin
	        aux := aux + g[i].cantMegustas;
	    end;
	end;
	writeln('la cantidad de me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay” : ', aux);
end;
procedure incisoC(g: guardadoDeFotos);
var
    aux, i : integer;
begin
    aux := 0;
    for i := 1 to cantImagenes do
        writeln('Foto "', g[i].titulo, '" recibió ', g[i].cantComent, ' comentarios.');
end;

var
	g: guardadoDeFotos;
begin
	almacenarFoto(g);
	incisoA(g);
	incisoB(g);
	incisoC(g);
End.