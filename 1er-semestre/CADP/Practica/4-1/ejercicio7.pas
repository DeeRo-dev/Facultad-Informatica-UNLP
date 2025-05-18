
{   
    7. Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
        debe procesarse) e informe:
        a. la cantidad de ocurrencias de cada dígito procesado.
        b. el dígito más leído.
        c. los dígitos que no tuvieron ocurrencias.
        Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
        Número 3: 2 veces
        Número 4: 2 veces
        Número 6: 2 veces
        Número 9: 4 veces
        El dígito más leído fue el 9.
        Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8
}

program ejercicio7;

type
  arreglo = array[0..9] of integer;

procedure procesarNum(num: integer; var v: arreglo);
var
  digito: integer;
begin
  if num = 0 then
    v[0] := v[0] + 1
  else
  begin
    while (num <> 0) do
    begin
      digito := num mod 10;
      v[digito] := v[digito] + 1;
      num := num div 10;
    end;
  end;
end;
function evaluarNum(v: arreglo): integer;
var
    i, aux: integer;
begin
    aux := 0;
    for i := 0 to 9 do
    begin
        if(v[i] > aux) then
            aux := v[i];
    end;
    evaluarNum:=aux;
end;
var
  num: integer;
  v: arreglo;
  i, numMasVeces: integer;
begin
    numMasVeces := 0;
    for i := 0 to 9 do
      v[i] := 0;
    writeln('Ingrese numeros, el programa finaliza al ingresar el valor -1');
    readln(num);
    while (num <> -1) do
    begin
        procesarNum(num, v);
        writeln('Ingrese otro valor');
        readln(num);
    end;
    numMasVeces := evaluarNum(v);
    writeln('Frecuencia de digitos del 0 al 9:');
    for i := 0 to 9 do
        writeln('Dígito ', i, ': ', v[i], ' veces');
        
    writeln('El numero mas veces leido es el: ', v[numMasVeces]);
    writeln('Los digitos sin ocurrencias son: ');
    for i := 0 to 9 do
        begin
            if(v[i] = 0) then
                writeln('Dígito ', i);
       end;
end.

