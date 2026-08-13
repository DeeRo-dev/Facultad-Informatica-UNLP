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
//Otra forma de hacerlo es la siguiente:
program Ejercicio6;
    procedure leerNums(num: integer);
    var
        numAlto:integer;
    begin
        numAlto:=0;
        writeln('Ingrese valores positivos: ');
        readln(numAlto);
        while(num >= 0) do
        begin
            if(num > numAlto) then
                numAlto:=num;
            writeln('Ingrese otro numero');
            read(num);
        end;
        writeln('El numero mas alto ingresado es de: ', numAlto);
    end;
var
    num: integer;
begin
    leerNums(num);
End.
