{
    7. Dado el siguiente programa:

program alcanceYFunciones;
var
    suma, cant : integer;
function calcularPromedio : real
var
    prom : real;
begin
    if (cant = 0) then
        prom := -1
    else
        prom := suma / cant; //8
    writeln(‘El promedio es: ’ , prom) 
    calcularPromedio := prom // faltaba darle valor a la funcion   
end;
begin  //programa principal 
    readln(suma); //48
    readln(cant); //6
    if (calcularPromedio <> -1) then begin
        cant := 0;
    end;
    else
        writeln(‘Dividir por cero no parece ser una buena idea’);
end.

}

{
    a) La función calcularPromedio calcula y retorna el promedio entre las variables globales suma y cant, pero
       parece incompleta. ¿qué debería agregarle para que funcione correctamente?-
    b) En el programa principal, la función calcularPromedio es invocada dos veces, pero esto podría mejorarse.
       ¿cómo debería modificarse el programa principal para invocar a dicha función una única vez?-
    c) Si se leen por teclado los valores 48 (variable suma) y 6 (variable cant), ¿qué resultado imprime el
       programa? Considere las tres posibilidades:
    
        i) El programa original //0
        ii) El programa luego de realizar la modificación del inciso a) //-1
        iii) El programa luego de realizar las modificaciones de los incisos a) y b) //8
} 


