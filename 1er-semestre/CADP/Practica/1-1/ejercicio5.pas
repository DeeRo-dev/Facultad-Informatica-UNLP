{
    5. Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
    reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
    número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.
}

program ejercicio5;
    var 
        num1, num2, num3: real;
        aux: integer;
begin
  num2:= 0;
  writeln ('Ingrese en el programa numeros  hasta que se ingrese uno cuyo valor sea exactamente el doble del primer número leído. Solo se permite ingresar hasta 10 valores');
  write('Ingrese el primer numero: ');
  readln(num1);
  num3 := num1 * 2;
  aux := 1;
  while(num2 <> num3) and (aux <> 10) do
    begin
        writeln(aux);
        writeln('Ingrese valores hasta indicar el doble de ', num1:0:2, ' : ');
        readln(num2);
        aux := aux + 1;
    end;
  if(aux <> 10 ) then
    writeln('Genial, ingresaste ', num2:0:2, ', que es el doble de: ', num1:0:2)
  else 
     writeln('Llego al limite de ingresos de numeros, y no se ha ingresado el doble de', num1:0:2)
end.
