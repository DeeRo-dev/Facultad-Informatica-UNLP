{
    6.  
        a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la
          lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
        b. Implemente un programa que invoque al módulo del inciso a.
}

program ejercicio6;
    function lectura: integer;
        var num, aux: integer;
        begin
            write('Ingrese valores, el programa finaliza al ingresar un numero negativo: ');
            readln(num);
            aux := num;
            while(num >= 0) do
                begin
                    if(num > aux) then 
                        aux := num;
                    write('Ingrese otro valor: ');
                    readln(num);
                end;
            lectura := aux;    
        end;
begin
   write(lectura);
end.