{
    4. Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
    alumno, apellido y nombre y cantidad de asistencias a clase.
    Dicha información se encuentra ordenada por nro de alumno de manera ascendente. Se pide:

    a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
    alumno seguro existe.
    
    b. Un módulo que reciba un alumno y lo inserte en el vector.
    
    c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
    
    d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
    
    e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
    
    Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos
    leídos de teclado.
    
}

program ejercicio4;
const
    dimF = 1000;
type
    alumno = record
        numeroAlm : integer;
        nombre: string[50];
        apellido: string[50];
        cantAsist: integer;
    end;
    dataAlumnos = array [1..dimF] of alumno;
    
procedure registrarAlumno(var v: dataAlumnos; var dimL: integer);
begin
    //se dispone
end;
function incisoA(v: dataAlumnos; dimL: integer; nro: integer): integer;
var
    i: integer;
begin
    i := 1;
    while (i <= dimL) and (v[i].numeroAlm <> nro) do
        i := i + 1;
        
    incisoA := i;
end;
procedure leerAlumno(var a: alumno);
begin
    writeln('-----Vamos a registrar un alumno-----');
    write('Ingrese el numero de alumno: ');
    readln(a.numeroAlm);
    write('Ingrese el nombre: ');
    readln(a.nombre);
    write('Ingrese el apellido: ');
    readln(a.apellido);
    write('Ingrese la cantidad de asistencia: ');
    readln(a.cantAsist);
end;
procedure insertarAlumno (var v: dataAlumnos; var dimL : integer; a: alumno);
var
    i, pos: integer;
begin
    if(dimL < dimF) then
    begin
        pos := 1;
        while((pos <= dimL) and (v[pos].numeroAlm < a.numeroAlm)) do
            pos := pos + 1;
        for i := dimL downto pos do
            v[i + 1] := v[i];
        v[pos] := a;
        dimL := dimL + 1;
    end
    else 
        write('No hay espacio para almacenar alumnos');
end;
procedure eliminarAlumno(var v: dataAlumnos; var dimL: integer; var ok : boolean; posElminar: integer);
var
    i : integer;
begin
    ok:= false;
    if((posElminar >= 1) and (posElminar <= dimL)) then
    begin
        for i := posElminar to (dimL - 1) do
            v[i] := v[i+1];
        ok := true;
        dimL := dimL - 1;
    end;
end;
procedure incisoD(var v: dataAlumnos; var dimL: integer; var ok : boolean; nroDeAlumnoEliminar: integer);
var
    pos: integer;
begin
    pos := incisoA(v, dimL, nroDeAlumnoEliminar);
    if (pos >= 1) and (pos <= dimL) then
        eliminarAlumno(v, dimL, ok, pos)
    else
        ok := false;
end;
procedure incisoE(var v: dataAlumnos; var dimL: integer);
var
    i: integer;
    ok: boolean;
begin
    i := 1;
    while i <= dimL do
    begin
        if v[i].cantAsist = 0 then
            eliminarAlumno(v, dimL, ok, i)
        else
            i := i + 1;
    end;
end;

var
    a: alumno;
    dimL, nro, posElminar : integer;
    v : dataAlumnos;
    ok: boolean;
begin
    dimL := 0;
    registrarAlumno(v, dimL);
    write('Ingrese un numero de alumno para buscarlo: ');
    readln(nro);
    writeln('El alumno está en la posición: ', incisoA(v, dimL, nro));
    leerAlumno(a);
    insertarAlumno(v, dimL, a);
    write('Ingrese un numero de alumno para alimanrlo: ');
    readln(nro);
    eliminarAlumno(v, dimL, ok, posElminar);
    // Eliminar por número de alumno
    write('Ingrese un numero de alumno para eliminarlo: ');
    readln(nro);
    incisoD(v, dimL, ok, nro);
    if ok then
        writeln('Alumno eliminado exitosamente.');
    else
        writeln('No se encontró el alumno.');
    write('Eliminar los alumnos con asistencias 0');
    incisoE(v, dimL, nro);
End.
