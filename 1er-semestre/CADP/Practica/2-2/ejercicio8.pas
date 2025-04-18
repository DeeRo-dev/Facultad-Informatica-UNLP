{
    8. Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega el
       número 1234, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos
       pares y la cantidad de dígitos impares que posee.
}
program ejercicio8;
    procedure procesarSecuencia(num: integer; var cantPar: integer; var cantImpar: integer);
    var
        dig: integer;
    begin
        dig := 0;
        while(num <> 0) do
            begin
                dig := num mod 10;
                if((dig mod 2) = 0) then
                    cantPar := cantPar + dig
                else
                    cantImpar := cantImpar + 1;
            num := num div 10;
            end;
    end;
var
    num, cantImpar, cantPar: integer;

 begin
    cantPar := 0;
    cantImpar := 0;
    writeln('Ingrese una secuencia de numeros, finaliza con 1234: ');
    readln(num);
    while (num <> 1234) do
        begin
            procesarSecuencia(num, cantPar, cantImpar);
            readln(num);
        end;

    writeln('--- RESULTADOS FINALES ---');
    writeln('Suma total de digitos pares: ', cantPar);
    writeln('Cantidad total de digitos impares: ', cantImpar);
end.
