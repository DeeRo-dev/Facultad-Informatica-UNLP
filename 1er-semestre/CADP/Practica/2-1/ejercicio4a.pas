{
    4. Dado los siguientes programas, explicar la diferencia.
}

program alcance4a;
var 
    a, b: integer;
procedure uno;
begin
    a := 1;
    writeln(a); //Imprime el valor de 1
end;
begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, ' ', a); // Imprime 2, 1... Cabe destacar que la variable global ha sido modificacada en "procedure uno"
end.

{
    La diferencia es que en el programa 4A, en el preceso se declara la varaible a.El programa es correcto.
    En 4B sucede lo contrario, ya que en el precso, no existe contexto de la variable a, dado que A es una variable local del programa principal
}