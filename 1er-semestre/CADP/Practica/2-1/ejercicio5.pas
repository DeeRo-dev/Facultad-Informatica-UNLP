{
    5. Dado el siguiente programa, indicar cuál es el error.
}

program alcance4;
function cuatro: integer;
begin
    cuatro:= 4;
end;
var a: integer;
begin
    cuatro;
    writeln(a); //Pienso que no existe tal "error", si no es que imprime un valor basura, dado que A no se inicializa con ningun valor.
    writeln(cuatro);
end.