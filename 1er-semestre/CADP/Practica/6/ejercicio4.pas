{
    4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
    
    a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
    
    b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
    
    c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de
    elementos de la lista que son múltiplos de A.
}

program ejercicio4;
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
procedure maxi(l:lista; var max: integer);
begin
    max:= -1; 
    while(l <> nil) do 
    begin
        if(l^.num > max) then
            max := l^.num;
        l := l^.sig;
    end;
end;
procedure mini(l:lista; var min: integer);
begin
    min:= 9999; 
    while(l <> nil) do 
    begin
        if(l^.num < min) then
            min := l^.num;
        l := l^.sig;
    end;
end;
procedure multiples(l:lista; multiplo: integer; var contador: integer);
begin
    while(l <> nil ) do
    begin
        if((l^.num MOD multiplo) = 0) then
            contador := contador + 1;
        l := l^.sig;
    end;
end;
var
    pri : lista;
    valor, inc, max, min, multiplo, contador: integer;
begin
    pri := nil;
    contador := 0;
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
    maxi(pri, max);
    writeln('El numer maximo leido es el : ', max);
    mini(pri, min);
    writeln('El numer minimo leido es el : ', min);
    write('Ingrese un numero para saber cuantos en la lista son multiplos: ');
    readln(multiplo);
    multiples(pri, multiplo, contador);
    writeln('La cantidad de multiplos es de : ', contador);
end.
