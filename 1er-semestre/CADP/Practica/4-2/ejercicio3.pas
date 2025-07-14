{
    3. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
    cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
    con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida por
    el camión (medida en kilómetros).
    
    a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
    cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
    
    b. Realizar un módulo que reciba el vector generado en a) e informe:
    - El monto promedio transportado de los viajes realizados
    - La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
    - La cantidad de viajes realizados cada día del mes.
    
    c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
    recorrida sea igual a 100 km.
    
    Nota: para realizar el inciso b, el vector debe recorrerse una única vez.}
    
    
    
program ejercicicio3;
const
    totalViajes = 200;
type
    cantDias = 1..31;
    infoViaje = record
        dia: cantDias;
        montoDinero: real;
        km: integer;
    end;
    datosViajes = array [1..totalViajes] of infoViaje;
    mes = array [cantDias] of integer;
procedure leerViaje(var r: infoViaje);
begin
    writeln('Ingrese información acerca del viaje: ');
    write('Ingrese la distancia recorrida: ');
    readln(r.km);
    if(r.km <> 0) then
    begin
        write('Ingrese el dia en el cual se realizo el viaje (1 a 31): ');
        readln(r.dia);
        write('Ingrese el monto promedio que tranporto el vieje: ');
        readln(r.montoDinero);
    end;
    
   
end;
procedure almacenarDatos(var v:datosViajes; var dimL: integer);
var
   r: infoViaje; 
begin
    leerViaje(r);
   while (r.km <> 0) and (dimL < totalViajes) do
    begin
        dimL := dimL + 1;
        v[dimL] := r; 
        leerViaje(r);
    end;
end;
procedure calcularPromedio(v: datosViajes; dimL: integer;  var m: mes);
var 
    i, menorDia, menorKm : integer;
    promedio, totalMonto, menorDinero: real;
    
begin
    totalMonto := 0;
    menorDinero := 9999;
   
    for i := 1 to dimL do
    begin
        totalMonto := totalMonto + v[i].montoDinero;
        if(v[i].montoDinero < menorDinero) then
        begin
            menorKm := v[i].km;
            menorDinero := v[i].montoDinero;
            menorDia := v[i].dia;
        end;
        m[v[i].dia] := m[v[i].dia] + 1;
    end;
    promedio := totalMonto / dimL;
    writeln('El monto promedio es de: ', promedio);
    writeln('La distancia recorrida del mes en que se realizó el viaje que transportó menos dinero: ', menorKm, ' , el dia', menorDia);
    for i := 1 to 31 do 
        writeln('En el dia ' , i , ' la cantidad de viajes fueron: ', m[i]);
end;
procedure eliminarOcurrencia(var v: datosViajes; var dimL: integer);
var
    i, j: integer;
begin
    i := 1;
    while i <= dimL do
    begin
        if v[i].km = 100 then
        begin
            for j := i to dimL - 1 do
                v[j] := v[j + 1];
            dimL := dimL - 1;
        end
        else
            i := i + 1;  
    end;
end;

var
    d: datosViajes;
    dimL, i: integer;
    m: mes;
begin
    dimL := 0;
    almacenarDatos(d, dimL);
    for i := 1 to 31 do
        m[i] := 0;
    calcularPromedio(d, dimL, m);
        
End.
