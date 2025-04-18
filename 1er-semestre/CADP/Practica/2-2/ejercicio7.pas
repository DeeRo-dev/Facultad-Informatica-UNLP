{
    7. 
        a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
        posee y la suma de los mismos.
        b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
        cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el
        cual debe procesarse.
}

program ejercicio7;

procedure calculate(num: integer; var cantDig: integer; var sum: integer; var sumDig:integer);
var
    digito: integer;
begin
    cantDig := 0;
    sum := 0;
    while (num <> 0) do 
    begin
        digito := num mod 10;
        cantDig := cantDig + 1;
        sumDig := sumDig + digito;
        sum := sum + digito;
        num := num div 10;
    end;
end;

var
    num, cantDigNum, sumNum, totalDigitos, sumDig: integer;
    fin: boolean;
begin
    fin := false;
    totalDigitos := 0;
    sumDig := 0;
    while (not fin) do
    begin
        write('Ingrese un número entero: ');
        readln(num);

        calculate(num, cantDigNum, sumNum, sumDig);

        totalDigitos := totalDigitos + cantDigNum;

        if (sumNum = 10) then
            fin := true;
    end;

    writeln('La cantidad total de dígitos ingresados es: ', totalDigitos, 'la suma de todos los digitos es de ', sumDig);
end.