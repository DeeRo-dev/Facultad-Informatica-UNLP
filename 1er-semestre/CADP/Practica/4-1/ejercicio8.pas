{
    Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
    Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido,
    nombre y año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
    
    a. El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
    
    b. Apellido y nombre de los dos alumnos de mayor edad.

}


program ejercicio8;
const DF = 400;
type
    dataAlumno = record
        numInscripcion: integer;
        dni: integer;
        apellido: string;
        nombre: string;
        nacimiento: integer;
    end;
    registros = array [1.. DF] of dataAlumno;
procedure cargarAlumnos(var datos: registros);

var
    i: integer;
    data: dataAlumno;
begin
    for i := 1 to DF do
    begin
        writeln('-----INGRESE LOS DATOS DEL ALUMNO--------');
        write('Ingrese el numero de inscripción: ');   
        readln(data.numInscripcion);
        write('Ingrese el nombre: ');   
        readln(data.nombre);
        write('Ingrese el apellido: ');   
        readln(data.apellido);
        write('Ingrese el dni: ');   
        readln(data.dni);
        write('Ingrese el numero de nacimiento: ');   
        readln(data.nacimiento);
        datos[i]:= data;
        end;
end;
procedure porcentaje(data: registros);
begin
    
end;
var
    datos: registros;
begin
     writeln('-----REGISTRO DE ALUMNOS DE LA FACULTAD--------');
    cargarAlumnos(datos);
end.