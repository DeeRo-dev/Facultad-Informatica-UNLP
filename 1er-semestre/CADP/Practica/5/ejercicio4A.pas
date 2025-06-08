{4) a) Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de
escritorio.
program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    pc^:= 'un nuevo texto';
    new(pc);
    writeln(pc^);
end.}

program ejercicio4A;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    pc^:= 'un nuevo texto'; // Esto no es posible, ya que no tiene una direccion en memoria dinamica asignada, deberia hacerce luego del new()
    new(pc);
    writeln(pc^); //Imprime un valor basura, que es lo que hay en memoria dinamica
end.