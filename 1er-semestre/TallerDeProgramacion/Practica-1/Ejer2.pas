{

2.- 
    El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
    las expensas de dichas oficinas.
    Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
   
    a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
    se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
    finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
    
    b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
    oficina.

    c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
}

program Ejercicio2;
const  
    cantOf = 300;
type
    dataOficina = record
        codigo: integer;
        dni: integer;
        valorExp: real;
    end;
    ventas = array [1..cantOf] of dataOficina; 

procedure leerOfi(var r: dataOficina);
begin
    writeln;
    writeln('---- Ingrese datos de la oficina ----');
    writeln('Codigo de verificacion: ');
    readln(r.codigo);
    if(r.codigo <> -1) then
    begin
        writeln('Dni del propietario: ');
        readln(r.dni);
        writeln('Valor de la expensa: ');
        readln(r.valorExp);
    end;
end;

procedure almacenarVentas(var v: ventas; var dimL: integer);
var
    i : integer;
    registro: dataOficina;
begin
    i := 1;
    leerOfi(registro);
    while((i < cantOf) and (registro.codigo <> -1) ) do 
    begin
        v[i] := registro;
        dimL := dimL + 1;
        i := i + 1;
        leerOfi(registro);
    end;
end;
procedure ordenarInsersion(var v: ventas; dimL : integer);
var
    i,j, actual, indice: integer;
    item: dataOficina;
begin   
    for i := 2 to dimL to
    begin
        actual := v[i];
        j := i - 1;
        while((j > 0) and (v[i]. codigo > v[j].codigo)) then
        begin
        end;
        
    end;
    
end;
var
    v : ventas;
    dimL: integer;
begin
    almacenarVentas(v, dimL);
End.