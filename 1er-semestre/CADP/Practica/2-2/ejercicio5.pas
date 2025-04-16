{
    5. a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.
       b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de
          números hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de
          pares en las que numB es el doble de numA.
          Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores
          4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).}

program ejercicio5;
    function isDouble(numA : integer; numB: integer) : boolean;
        begin
            if((numB * 2) = numA) then
                isDouble := true
            else
                isDouble := false;    
        end;
    var
        num1, num2, cantNums : integer;
    begin    
        writeln('Enter numbers');
        readln(num1);
        readln(num2);
        cantNums := 1;
        while((num1 <> 0) and (num2 <> 0)) do
            begin
                if(isDouble(num1, num2)) then
                    writeln('Value ' , num1 , ' is double to ', num2)
                else 
                    writeln('Value ' , num1 , ' not is double to ', num2);
                readln(num1);
                readln(num2);
                cantNums := cantNums + 1;
            end;
        write('number of numbers read: ', cantNums);
    end.
end.