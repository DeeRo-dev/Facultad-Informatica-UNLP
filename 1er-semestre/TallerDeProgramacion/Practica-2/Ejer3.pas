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

procedure cargarVector(v: vector);
var
	i, valor: integer;
begin
	for i := 1 to 20 do 
	begin
		valor := 300 + Random(1550 - 300 + 1);
		v[i] := valor;
	end;
end;

var
	v: vector;
begin	
	Randomize;
	cargarVector(v);
End.

