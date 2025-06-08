{4) b) Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de
escritorio.

program punteros;
type
    cadena = string[50]; // 50 + 1 = 51
    puntero_cadena = ^cadena; 
var
    pc: puntero_cadena; //= 4 memoria estatica
begin
    new(pc);
    pc^:= 'un nuevo nombre';
    writeln(sizeof(pc^), ' bytes'); //51 en memoria dinamica
    writeln(pc^);
end.


.}

