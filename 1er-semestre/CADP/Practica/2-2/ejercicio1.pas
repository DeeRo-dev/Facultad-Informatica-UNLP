{
    1. Responda las preguntas en relación al siguiente programa:

program Ejercicio1;
procedure suma(num1: integer; var num2:integer);5 20
    begin
        num2 := num1 + num2; 2 11
        num1 := 0;
    end;
    var
        i, x : integer; 13
    begin
        read(x); //leo la variable 10
        for i:= 1 to 5 do
            suma(i,x);
        write(x); //imprimo las variable x 
    end.


a. ¿Qué imprime si se lee el valor 10 en la variable x ?
    //EL valor que imprime es de x:= 25
b. ¿Qué imprime si se lee el valor 10 en la variable x y se cambia el encabezado del procedure por:
procedure suma(num1: integer; num2:integer);
    //Lo que sucede que al imprimir el valor de x:= 10; ya que no importa lo que haga el modulo procedimiento, ya que la variables son por valor.

c. ¿Qué sucede si se cambia el encabezado del procedure por:
procedure suma(var num1: integer; var num2:integer);
    //El programa daria error ya que i no puede ser alterada. Solo puede incrementar en el loop del for
}
