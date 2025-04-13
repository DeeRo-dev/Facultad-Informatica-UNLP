{
    4. Dado los siguientes programas, explicar la diferencia. 
}
program alcance4b;
procedure uno;
begin
    a := 1;
    writeln(a); //
end;
var 
    a,b: integer;
begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a); //
end.

{
    La diferencia es que en el programa 4A, en el preceso se declara la varaible a.El programa es correcto.
    En 4B sucede lo contrario, ya que en el precso, no existe contexto de la variable a, dado que A es una variable local del programa principal
}