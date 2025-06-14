{
	3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
	
	a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que
	fueron ingresados (agregar atrás).
	
	b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que
	fueron ingresados, manteniendo un puntero al último ingresado.
}
 
//inciso A
program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;
procedure armarNodo(var L: lista; v: integer);
var
  aux, act: lista;
begin
  new(aux);
  aux^.num := v;
  aux^.sig := nil;
  
  if (L = nil) then
    L := aux
  else
  begin
    act := L;
    while (act^.sig <> nil) do
      act := act^.sig;
    act^.sig := aux;
  end;
end;
procedure incrementar(var l: lista; num: integer);
var
    aux: lista;
begin
    aux := l;
    while(aux <> nil) do
    begin
        aux^.num := aux^.num + num;
        aux := aux^.sig;
    end;
end;
procedure leerLista(l: lista);
begin
    while(l <> nil) do
    begin
        writeln('El contenido de la lista es: ', l^.num);
        l := l^.sig;
    end;
end;
var
    pri, ult : lista;
    valor, inc : integer;
begin
    pri := nil;
    ult := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do
    begin
        armarNodo(pri, ult, valor);
        read(valor);
        writeln('‘Ingrese un numero’');
    end;
    leerLista(pri);
    writeln('Íngrese un valor para incrementar cada dato de la lista: ');
    read(inc);
    incrementar(pri, inc);
    leerLista(pri);
end.




//inciso B
program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;
procedure armarNodo(var L, ult: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := nil;
    if(L = nil) then
        L := aux
    else
        ult^.sig := aux;
    ult := aux;
end;
procedure incrementar(var l: lista; num: integer);
var
    aux: lista;
begin
    aux := l;
    while(aux <> nil) do
    begin
        aux^.num := aux^.num + num;
        aux := aux^.sig;
    end;
end;
procedure leerLista(l: lista);
begin
    while(l <> nil) do
    begin
        writeln('El contenido de la lista es: ', l^.num);
        l := l^.sig;
    end;
end;
var
    pri, ult : lista;
    valor, inc : integer;
begin
    pri := nil;
    ult := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do
    begin
        armarNodo(pri, ult, valor);
        read(valor);
        writeln('‘Ingrese un numero’');
    end;
    leerLista(pri);
    writeln('Íngrese un valor para incrementar cada dato de la lista: ');
    read(inc);
    incrementar(pri, inc);
    leerLista(pri);
end.
