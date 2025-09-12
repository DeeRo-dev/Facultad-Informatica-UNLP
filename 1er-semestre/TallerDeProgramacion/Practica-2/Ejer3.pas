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
        while((j > 0) and (v[j] > actual)) then
        begin
            v[j+1] := v[j];
            j:= j -1;
        end;
        v[j+1] := actual;
    end;
end;

var
	v: vector;
begin	
	Randomize;
	cargarVector(v, top);
	imprimir(v, top);
	insersion(v, top);
	imprimir(v, top);
End.
