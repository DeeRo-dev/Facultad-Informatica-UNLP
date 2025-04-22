{
    2.  El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
        2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
    
    a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.

    b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
    en el inciso a).
    
    c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
    ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los
    meses de verano (enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de
    cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha.
}



program ejercicio3;
type 
    fecha = record
        dia: integer;
        mes: string;
        anio: integer;
    end;
var    
    count, countAux : integer;
procedure calcular(fechaDeCasamiento: fecha);
begin
  
    if((fechaDeCasamiento.mes = 'enero' ) or (fechaDeCasamiento.mes = 'febrero') or (fechaDeCasamiento.mes = 'marzo')) then
        count := count + 1;
    if(fechaDeCasamiento.dia < 11) then
        countAux := countAux + 1;
end;
procedure crearFecha(var fechaDeCasamiento: fecha);
    begin
        write('Ingrese el anio: ');
        readln(fechaDeCasamiento.anio);
        if(fechaDeCasamiento.anio <> 2020) then
            begin
                write('Ingrese el dia: ');
                readln(fechaDeCasamiento.dia);
                write('Ingrese el mes: ');
                readln(fechaDeCasamiento.mes);
                calcular(fechaDeCasamiento);
            end;
    end;
var
    fechaDeCasamiento: fecha;
 
begin
    count:=0;
    countAux:=0;
    writeln ('Ingresemos la fecha de los casamientos, el programa finaliza al ingresar el anio 2020');
    crearFecha(fechaDeCasamiento);
    while(fechaDeCasamiento.anio <> 2020) do
        begin
            crearFecha(fechaDeCasamiento);
        end;
    writeln('la cantidad de casamientos realizados durante los meses de verano: ', count);
    writeln('y la cantidad de casamientos realizados en los primeros 10 días de cada mes: ', countAux);
end.
