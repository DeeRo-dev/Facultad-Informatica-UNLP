{
    8.
        Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la
        lista queden ordenados de manera ascendente (insertar ordenado).
}



program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;


procedure armarNodo(var L: lista; v: integer);
var
    aux, ant, act : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := nil;
    if(l = nil) then
        L := aux;
    else
    begin
        act := L;
        ant := L;             
        while ((act <> nil) and (act^.num < aux^.num)) do 
            ant := act;
            act := act^.sig;
    end;
    if(act = L) then
    begin
        aux^.sig := L;
        L := aux;
    end;
    else 
    begin
        ant^.sig := aux;
        aux^.sig := act;
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
    pri : lista;
    valor, inc : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do
    begin
        armarNodo(pri, valor);
        read(valor);
        writeln('‘Ingrese un numero’');
    end;
    leerLista(pri);
    writeln('Íngrese un valor para incrementar cada dato de la lista: ');
    read(inc);
    incrementar(pri, inc);
    leerLista(pri);
end.
