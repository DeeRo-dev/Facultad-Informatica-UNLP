{

        Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
        debe procesarse) e informe:
        a. La cantidad de ocurrencias de cada dígito procesado.
        b. El dígito más leído.
        c. Los dígitos que no tuvieron ocurrencias.
        Por ejemplo: si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
        Número 3: 2 veces
        Número 4: 2 veces
        Número 6: 2 veces
        Número 9: 4 veces
        El dígito más leído fue el 9.
        Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8

}

program Ejercicio7;
type
   tipoDeNumeros = array [0..9] of integer;
procedure procesarNumero(var storage: tipoDeNumeros; num: integer);
var
    aux, digito: integer;
begin
    aux := num;
    if(num = 0) then
        storage[0] := storage[0] + 1;
        
    while(aux <> 0) do
    begin
      digito := aux mod 10;
      storage[digito] := storage[digito] + 1;
      aux := aux div 10;
    end;
end;
procedure digitoMasLeido(storage: tipoDeNumeros);
var
    i, maxCantidad, digito: integer;
begin
    maxCantidad := -1;
    digito := -1;
    for i := 0 to 9 do
    begin
        if(storage[i] > maxCantidad) then
        begin
            maxCantidad := storage[i];
            digito := i;
        end;
    end;
    writeln('El dígito más leído fue el: ', digito);
end;

procedure digitosLeidos(storage: tipoDeNumeros);
var
    aux,i : integer;
begin
    aux := 0;
     writeln('--- Cantidad de ocurrencias por dígito ---');
    for i := 0 to 9 do
    begin
        if(storage[i] > 0) then
            writeln('Dígito ', i, ': ', storage[i], ' veces');
    end;
     writeln('--- Dígitos sin ocurrencias ---');
    for i := 0 to 9 do
    begin
        if(storage[i] = 0) then
            writeln(i);
    end;
end;
var
   numero, i, digH: integer;
   numeros: tipoDeNumeros;
begin
    digH := 0;
    writeln('Ingrese un numero, el programa se termina cuando ingresa el numero -1');
    readln(numero);
    while(numero <> -1 ) do 
    begin
        procesarNumero(numeros ,numero);
        writeln('Ingrese otro valor para procesar');
        readln(numero);
    end;
    writeln('Se termino de procesar los numeros');
    digitoMasLeido(numeros);
    digitosLeidos(numeros);
end.
