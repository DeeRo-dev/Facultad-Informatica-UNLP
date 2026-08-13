{1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5.}

program practica;

const
  tope = 10;

var
  i, num, sum, cantMay: integer;

begin
  writeln('Hola mundo, ingrese 10 valores');
    sum :=0; 
    cantMay := 0;
  for i := 1 to tope do
  begin
    write('Ingrese un valor: ');
    readln(num);
    sum := sum + num;
    if(num > 5) then
        cantMay := cantMay + 1;
  end;
 writeln('La suma total es de: ', sum, ' y la cantidad de numeros mayores a 5 es de: ', cantMay);
end.
