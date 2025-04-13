{
    3. Dado el siguiente programa, indicar cuál es el error y su causa.
}

program alcance3;
var 
    a: integer;
procedure uno;
var 
    b: integer;
begin
    b:= 2;
    writeln(b); //Imprime 2
end;
begin
    a:= 1;
    uno;
    writeln(a, b); //Dado que b no existe en este contexto, se da un error de programa 
end.