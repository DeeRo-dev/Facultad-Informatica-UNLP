{4) d) Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de
escritorio. 

program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
procedure cambiarTexto(pun: puntero_cadena);
begin
    new(pun); //Dado que si asigna una nueva direccion en memoria, esta asignacion queda encapsulada en el precudure. Ya que el valor se pasa por ref.
    pun^:= 'Otro texto';
end;
var
    pc: puntero_cadena;
begin
    new(pc);
    pc^:= 'Un texto';
    writeln(pc^);
    cambiarTexto(pc);
    writeln(pc^);
end.}
