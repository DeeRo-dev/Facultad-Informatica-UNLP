{
    3.  Encontrar los 6 errores que existen en el siguiente programa. Utilizar los comentarios entre llaves como
        guía, indicar en qué línea se encuentra cada error y en qué consiste:

program ejercicio5;
{ suma los números entre a y b, y retorna el resultado en c }
procedure sumar(a, b, c : integer)
var
    suma : integer;
begin
    for i := a to b do
        suma := suma + i;
        c := c + suma;
    end;
 var
    result : integer;
 begin
    result := 0;
    readln(a); 
    readln(b);
    sumar(a, b, 0);
    write(‘La suma total es ‘,result);
    { averigua si el resultado final estuvo entre 10 y 30}
    ok := (result >= 10) or (result <= 30);
    if (not ok) then
      write (‘La suma no quedó entre 10 y 30’);
 end.
}
{
    1. En el procedimiento sumar, no se declara la variable i para el for.
    2. Dentro del for, se quiero sumar a la funcion suma el valor de una variable que no tiene tipo y suma no esta inicializada.
    3.Las variables a, b y c, no se declaran nunca.
    4. Result Siempre daria 0.
    5. ok la condicion deberia ser and.
    6.El proceso no retorna nada.
}