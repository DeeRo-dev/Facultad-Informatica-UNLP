{
    8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
        Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
        año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
        
        a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
        b) Apellido y nombre de los dos alumnos de mayor edad.
}

program ejercicio8;
const 
    dimF = 400;
type
    registroAlum = record 
        numInscripcion: integer;
        dni:integer;
        apellido: string;
        nombre: string;
        anioNacimientto: integer;
    end;
    registro = array [1..dimF] of registroAlum;
procedure leerAlumn(var infoAlumn: registroAlum);
    begin
        write('Ingrese el numero de inscripción: ');
        readln(infoAlumn.numInscripcion);
        write('Ingrese el DNI: ');
        readln(infoAlumn.dni);
        write('Ingrese el apellido: ');
        readln(infoAlumn.apellido);
        write('Ingrese el nombre: ');
        readln(infoAlumn.nombre);
        write('Ingrese el anio de nacimiento: ');
        readln(infoAlumn.anioNacimientto);
        writeln('--- ingrese un nuevo alumno----');
    end;
procedure leerRegistro(var v:registro);
var
    i:integer;
    dataAlumn : registroAlum;
begin
    for i := 1 to dimF do
        begin
            leerAlumn(dataAlumn); 
            v[i]:= dataAlumn;
        end;
end;
procedure procesarInfo(v:registro);
var
    i:integer;
    
begin
    for i := 1 to dimF do
        begin
            v[i]
        end;
end;
var 
    registroFacultad: registro;
begin
    leerRegistro(registroFacultad);
end.