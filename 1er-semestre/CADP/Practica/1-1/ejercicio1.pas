{1. Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los dos
números es el mayor. Si son iguales debe informar en pantalla lo siguiente:
Los números leídos son iguales
}


program PuntoUno;
var 
    num1, num2: integer; 
begin
    write('Ingrese el primer número entero: ');
    readln(num1);
    write('Ingrese el segundo número entero: ');
    readln(num2);
    if (num1 > num2) then
        writeln('El primer valor ingresado', (num1), 'es el mayor')
    else if (num2 > num1) then
        writeln('El segundo valor ingresado ', (num2), ' es el mayor')
    else
        writeln('Ambos valores son iguales');
end.
