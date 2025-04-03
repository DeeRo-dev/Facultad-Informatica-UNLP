{
    4. Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
    ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído).
}

program Hello;
    var 
        num1, num2, num3: real;
begin
  num2:= 0;
  writeln ('Ingrese en el programa numeros  hasta que se ingrese uno cuyo valor sea exactamente el doble deel primer número leído');
  write('Ingrese el primer numero: ');
  readln(num1);
  num3 := num1 * 2;
  while(num2 <> num3) do
    begin
        writeln('Ingrese valores hasta indicar el doble de ', num1:0:2, ' : ');
        readln(num2);
    end;
   writeln('Genial, ingresaste ', num2:0:2, ', que es el doble de: ', num1:0:2)
end.
