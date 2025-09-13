
{
	  3.- Implementar un programa que invoque a los siguientes módulos.
		
		a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
		y menores a 1550 (incluidos ambos).

		b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
		en la práctica anterior)

		c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
		encabezado:
		Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
		Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
		en el vector.
	   
   
}


program Ejer3;
const 
	top = 20;
type
	vector = array [1..top] of integer;

procedure cargarVector(var v: vector; top : integer);
var
    valor: integer;
begin
	if( top > 0) then
	begin
    	valor := 300 + Random(1251);
		cargarVector(v, top - 1);
		writeln('Voy a cargar en la Posicion: ', top);
		v[top] := valor;
	end;
end;

procedure imprimir(v: vector; top: integer);
begin
    if(top > 0) then
    begin
        imprimir(v, top - 1);
        writeln('Posicion ', top, ' :', v[top]);
    end;
end;

procedure insersion(var v : vector; top: integer);
var
    i,j, actual: integer;
begin
    for i := 2 to top do 
    begin
        actual := v[i];
        j := i - 1;
        while((j > 0) and (v[j] > actual)) do
        begin
            v[j+1] := v[j];
            j:= j -1;
        end;
        v[j+1] := actual;
    end;
end;
Procedure busquedaDicotomica (v: vector; ini, fin, dato:integer; var pos: integer);
var
	medio : integer;
begin
	fin := top;
	ini := 1;
	medio := (ini + fin) div 2;
	while((ini <= fin) and (dato <> v[medio])) do
	begin
		if(dato < v[medio]) then
			fin := medio - 1
		else
			ini := medio + 1;
		medio := (ini + fin) div 2;
	end;
	if( (ini <= fin) and (v[medio] = dato) ) then
		pos := medio;
end;

procedure busquedaDicotomicaRecursivo(v: vector; ini, fin, dato: integer; var pos: integer);
var
  medio: integer;
begin
  if (ini > fin) then
    pos := -1
  else
  begin
    medio := (ini + fin) div 2;  { posición central }
    if (v[medio] = dato) then
      pos := medio
    else if (dato < v[medio]) then
      busquedaDicotomica(v, ini, medio - 1, dato, pos)  { buscar en la izquierda }
    else
      busquedaDicotomica(v, medio + 1, fin, dato, pos); { buscar en la derecha }
  end;
end;

var
	v: vector;
	dato, pos:integer; 
begin	
	Randomize;
	pos := -1;
	cargarVector(v, top);
	imprimir(v, top);
	insersion(v, top);
	imprimir(v, top);
	writeln;
	write('ingrese un valor para buscarlo dentro del vector: ' );
	readln(dato);
	busquedaDicotomicaRecursivo (v, 1, top, dato, pos);
	if(pos <> -1 ) then
		writeln('El valor se encontro en la posicon: ', pos)
	else
		write('El valor que busca no fue encontrado dentro del vector');
		
End.
