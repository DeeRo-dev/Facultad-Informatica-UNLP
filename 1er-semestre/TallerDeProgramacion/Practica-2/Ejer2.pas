{
    2.- Escribir un programa que:
       
        a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
        “random” en el rango 100-200. Finalizar con el número 100.
       
        b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
        mismo orden que están almacenados.
       
        c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
        la lista en orden inverso al que están almacenados.
       
        d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
        valor de la lista.
       
        e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
        verdadero si dicho valor se encuentra en la lista o falso en caso contrario.
}

program ejer2;
const
  top = 200;
type
  rango = 1..top;
  lista = ^nodo;
  nodo = record
    value: integer;
    sig: lista;
  end;

procedure cargarLista(var l: lista);
var
  nuevo: lista;
  value: integer;
begin
  value := 100 + random(101);  
  if (value <> 100) then
  begin
    new(nuevo);
    nuevo^.value := value;
    nuevo^.sig := l;   
    l := nuevo;
    cargarLista(l);
  end;
end;

procedure imprimirLista(l: lista);
begin
  if (l <> nil) then
  begin
    write(l^.value, ' ');
    imprimirLista(l^.sig);
  end;
  writeln;
end;

procedure imprimirListaInverso(l: lista);
begin
  if (l <> nil) then
  begin
    imprimirListaInverso(l^.sig);
    write(l^.value, ' ');
  end;
  writeln;
end;

function minimo(l: lista): integer;
var
  minResto: integer;
begin
  if (l = nil) then
    minimo := 9999  { valor "sentinela", porque la lista está vacía }
  else if (l^.sig = nil) then
    minimo := l^.value
  else
  begin
    minResto := minimo(l^.sig);
    if (l^.value < minResto) then
      minimo := l^.value
    else
      minimo := minResto;
  end;
end;


function encontrarValor(l: lista; valor: integer): boolean;
begin
  if (l = nil) then
    encontrarValor := false
  else if (l^.value = valor) then
    encontrarValor := true
  else
    encontrarValor := encontrarValor(l^.sig, valor);
end;

var
  l: lista;
  valor: integer;
begin
	 randomize;   { inicializar semilla SOLO una vez }
	l := nil;
	cargarLista(l);
	writeln('Lista cargada:');
	imprimirLista(l);
	writeln('Lista en orden inverso:');
	imprimirListaInverso(l);
	writeln('Valor mínimo de la lista: ', minimo(l));
	write('Ingrese un valor para buscar: ');
	readln;
	readln(valor);
	if(encontrarValor(l, valor)) then
		writeln('El valor esta')
	else
		write('El valor no esta');
	readln;
end.
