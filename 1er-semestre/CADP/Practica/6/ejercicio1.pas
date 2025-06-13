{1. Dado el siguiente programa:
program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;
procedure armarNodo(var L: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
end;
var
    pri : lista;
    valor : integer;
begin
    pri := nil;
    writeln(‘Ingrese un numero’);
    read(valor);
    while (valor <> 0) then begin
    armarNodo(pri, valor);
    writeln(‘Ingrese un numero’);
    read(valor);
end;
. . . imprimir lista 
end.
a. Indicar qué hace el programa.
b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la
lista.}

{a. El programa agrega numeros enteros a una lista, utilizando el modulo de agregarAdelante, hasta ingresar el 
numero 0, que no debe procesarse.
b. 48 - 13 - 21 - 10}


program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;
procedure armarNodo(var L: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
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
