{
    9. Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
       lee: número de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con número de
       inscripción 1200, que debe procesarse. Se pide calcular e informar:
       ● Apellido de los dos alumnos con número de inscripción más chico.
       ● Nombre de los dos alumnos con número de inscripción más grande.
       ● Porcentaje de alumnos con nro de inscripción par.
}

program ejercicio9; 
    procedure leerInfoAlumn(var num:integer; var apell : string; var nom:string);
    begin
        write('Ingrese el numero de inscripcion: '); 
        readln(num);
        write('Ingrese el apellido: ');
        readln(apell);
        write('Ingrese el nombre: ');
        readln(nom);
    end;    
    procedure calcular(num: integer; apell: string; var alum1:string; var alum2: string; var numAlum1: integer; var numAlum2: integer; var alumMax1: string; var alumMax2:string; var numAlumMax1: integer; var numAlumMax2 : integer);
    begin
        if (num < numAlum1) then
            begin
                numAlum2 := numAlum1;
                alum2 := alum1;
                numAlum1 := num;
                alum1 := apell;
            end
        else if (num < numAlum2) then
            begin
                numAlum2 := num;
                alum2 := apell;
            end;
        if(num > numAlumMax1) then
            begin
                numAlumMax2:= numAlumMax1;
                alumMax2:= alumMax1;
                numAlumMax1:= num;
                alumMax1:=apell;
            end
        else if(num > numAlumMax2) then
            begin
                numAlumMax2:= num;
                alumMax2:= apell;
            end;
    end;
    procedure cantAlumPar(num: integer; var cantAlumPares: integer; var cantAlum: integer);
    begin
         cantAlum:= cantAlum + 1;
         if((num mod 2) = 0) then 
            cantAlumPares := cantAlumPares + 1 ;
    end;
var
    num, numAlum1, numAlum2,numAlumMax1, numAlumMax2, cantAlum, cantAlumPares: integer;
    apell, nom, alum1, alum2, alumMax1, alumMax2: string;
    porcentajeAlumPar : real;

begin
    numAlum1:=9999;
    numAlum2:=9999;
    numAlumMax1:=-1;
    numAlumMax2:=-1;
    cantAlum:= 0;
    cantAlumPares:=0;
    porcentajeAlumPar:=0;
    writeln('Vamos a leer los alumnos de la facultad, ingrese datos de alumnos. El programa finaliza al ingresar el numero de inscripcion 1200');
    repeat
    leerInfoAlumn(num, apell, nom);
    calcular(num, apell, alum1, alum2, numAlum1, numAlum2, alumMax1, alumMax2, numAlumMax1, numAlumMax2);
    cantAlumPar(num,cantAlum, cantAlumPares);
    until(num = 1200);
    writeln('Los alumnos con numero de legajo mas chicos son: ', alum1, ' y ', alum2);
    writeln('Los alumnos con numero de legajo mas alto son: ', alumMax1, ' y ', alumMax2);
    porcentajeAlumPar := (cantAlumPares / cantAlum) * 100;
    writeln('El promedi de alumnos con numero de legajo para es de: ', porcentajeAlumPar:0:2);
end.
