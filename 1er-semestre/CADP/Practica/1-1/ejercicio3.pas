{
3. Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
Por ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir: 12 4 -10
}


program Hello;
    var 
        num1, num2, num3: integer;
begin
  writeln ('Ingrese en el programa 3 numeros para ordenar en descendente');
  write('Ingrese el primer numero: ');
  readln(num1);
  write('Ingrese el segundo numero: ');
  readln(num2);
  write('Ingrese el tercer numero: ');
  readln(num3);
  writeln ('Cargando...');
  if(num1 < num2) and (num1 < num3) and (num2 < num3) then
   write('Los valores ingresados en orden descendente son: ', num1,' ', num2,' ', num3)
  else if(num1 < num2) and (num1 < num3) and (num3 < num2) then
   write('Los valores ingresados en orden descendente son: ', num1,' ', num3,' ', num2)
  else if(num2 < num1) and (num2 < num3) and (num1 < num3) then
   write('Los valores ingresados en orden descendente son: ', num2,' ', num1,' ', num3)
  else if(num2 < num1) and (num2 < num3) and (num3 < num1) then
   write('Los valores ingresados en orden descendente son: ', num2,' ', num3,' ', num1)
  else if(num3 < num1) and (num3 < num2) and (num1 < num2) then
   write('Los valores ingresados en orden descendente son: ', num3,' ', num1,' ', num2)
  else 
   write('Los valores ingresados en orden descendente son: ', num3,' ', num2,' ', num1)
end.
