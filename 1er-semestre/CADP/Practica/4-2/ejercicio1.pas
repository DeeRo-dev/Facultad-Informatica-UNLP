{
	1. 
	a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor
	n y retorne si n se encuentra en el vector o no.

	b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
	ascendente.
}


{
    
------- INCISO A----------
program ejercicio1;
const
	dimF = 10;
type
	vector = array [1..dimF] of integer;

procedure llenarVectorAleatorio(var v: vector; var dimL: integer);
var
  i: integer;
begin
  Randomize;
  dimL := Random(dimF) + 1; // Asegura al menos 1 elemento
  for i := 1 to dimL do
    v[i] := Random(100); // Valores entre 0 y 99
end;

procedure imprimirVector(v: vector; dimL: integer);
var
  i: integer;
begin
  for i := 1 to dimL do
    writeln('v[', i, '] = ', v[i]);
end;
function incisoA(v: vector; dimL: integer; pos: integer): boolean;
var
	i: integer;
	encontre: boolean;
begin
	encontre := false;
	i := 1;
	while((i <= dimL) and (encontre = false)) do
	begin
		if(v[i] = pos) then
			encontre := true;
		i := i + 1;
	end;
	incisoA := encontre;
end;
var
	v:vector;
	pos: integer;
	esta: boolean;
	dimL : integer;
begin
	dimL := 0;
	esta := false; 
	llenarVectorAleatorio(v, dimL);
	imprimirVector(v, dimL);
	write('Ingrese un numero para saber si existe: ');
	readln(pos);
	esta := incisoA(v, dimL, pos);
	if(esta = true) then
		write('El numero: ', pos, ' se encuentra en el arreglo')
	else
		write('El numero: ', pos, ' no se encuentra en el arreglo');
End.
    
}




program ejercicio1;
const
	dimF = 10;
type
	vector = array [1..dimF] of integer;

procedure llenarVectorAleatorio(var v: vector; var dimL: integer);
var
  i: integer;
begin
  Randomize;
  dimL := Random(dimF) + 1; // Asegura al menos 1 elemento
  for i := 1 to dimL do
    v[i] := Random(100); // Valores entre 0 y 99
end;

procedure imprimirVector(v: vector; dimL: integer);
var
  i: integer;
begin
  for i := 1 to dimL do
    writeln('v[', i, '] = ', v[i]);
end;
procedure ordenarVector(var v: vector; dimL: integer);
var
  i, j, aux: integer;
begin
  for i := 1 to dimL - 1 do
    for j := i + 1 to dimL do
      if v[i] > v[j] then
      begin
        aux := v[i];
        v[i] := v[j];
        v[j] := aux;
      end;
end;

function incisoB(v: vector; dimL: integer; pos: integer): boolean;
var
	i: integer;
	encontre: boolean;
begin
	encontre := false;
	i := 1;
	while((i <= dimL) and (v[i] < pos)) do
		i := i + 1;
	if((i <= dimL) and (v[i] = pos)) then
		incisoB := true;
	else 
		incisoB := false;
end;
var
	v:vector;
	pos: integer;
	esta: boolean;
	dimL : integer;
begin
	dimL := 0;
	esta := false; 
	llenarVectorAleatorio(v, dimL);
	ordenarVector(v, dimL);
	imprimirVector(v, dimL);
	write('Ingrese un numero para saber si existe: ');
	readln(pos);
	esta := incisoB(v, dimL, pos);
	if(esta = true) then
		write('El numero: ', pos, ' se encuentra en el arreglo')
	else
		write('El numero: ', pos, ' no se encuentra en el arreglo');
End.
    
