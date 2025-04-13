{
    Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La lectura
    finaliza cuando se ingresa el legajo -1, que no debe procesarse. Por ejemplo: se lee la siguiente secuencia:
    33423
    8.40
    19003
    6.43
    -1
    En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo 19003, cuyo
    promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un promedio).
    Al finalizar la lectura, informar:
    a. La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2).
    b. La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar 1).
    c. El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean menor
    al valor 2500 (en el ejemplo anterior, se debería informar 0%).
}

program Program6;
    var 
        average, porcentage: real;
        fileNumber, count, aux1, aux2: integer;
begin
    count := 0;
     aux1 := 0;
     aux2 := 0;
    writeln('Hello, enter the file number and averge, enter the number -1, to end program');
    readln(fileNumber);
  while(fileNumber <> -1) do 
    begin
        count := count + 1;
        write('Enter averge: ');
        readln(average);
        if(average > 6.5) then
            aux1 := aux1 + 1;
        if(average > 8.5) and (fileNumber < 2500) then
            aux2 := aux2 + 1;
        write('Enter the file number: ');
        readln(fileNumber);
    end;
    porcentage := (aux2 * 100) / aux1;
    writeln('Program finished. The number of students read is: ', count, '. ' , 'Students with a grade point average above 6.5 is of: ', aux1, '.  The porcentage of students with a grade point average above 8.5 and file number  menor a 2500 is of: ', porcentage:0:2);
end.