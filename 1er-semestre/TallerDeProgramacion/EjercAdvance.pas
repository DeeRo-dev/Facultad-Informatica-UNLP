{
    Se desea procesar la información de las ventas de productos de un comercio (como máximo 50). 
    Implementar un programa que invoque los siguientes módulos:
    
    a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce el día de la venta,
    código del producto (entre 1 y 15) y cantidad vendida
    (como máximo 99 unidades). El código y el dia deben generarse automáticamente (random) y la cantidad se debe leer.
    El ingreso de las ventas finaliza con el día de venta 0     
    (no se procesa).
    
    b. Un módulo que muestre el contenido del vector resultante del punto a).
    
    c. Un módulo que ordene el vector de ventas por código.
    
    d. Un módulo que muestre el contenido del vector resultante del punto c).
    
    e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos valores que se ingresan como parámetros. 
    
    f. Un módulo que muestre el contenido del vector resultante del punto e).
    
    g. Un módulo que retorne la información (ordenada por código de producto de menor a mayor) de cada código par de producto junto a la cantidad total
    de productos vendidos.
    
    h. Un módulo que muestre la información obtenida en el punto g).
    
}


program practica1;
const 
    ventasMax = 50;
type
    dataVenta = record
        dia: integer;
        codigo: integer;
        cantVend: integer;
    end;
    ventas = array [1..ventasMax] of dataVenta;

    resumenVenta = record
        codigo: integer;
        totalVend: integer;
    end;
    resumenArray = array[1..ventasMax] of resumenVenta;

procedure leerVenta(var r:dataVenta);
begin
    r.dia:= random(31);
    r.codigo := random(15) + 1;
    if(r.dia <> 0) then
    begin
        writeln('Ingrese la cantidad de ventas: ');
        writeln('Dia: ', r.dia);
        writeln('Codigo: ', r.codigo);
        write('Cantidad de ventas: ');
        readln(r.cantVend);
        while(r.cantVend > 99) do
        begin
            writeln('La cantidad de ventas debe ser menor a 99');
            readln(r.cantVend);
        end;
    end
    else
        writeln('---El dia es 0 y no se procesa, fin---');
end;

procedure registrarVentas(var v: ventas; var dimL: integer);
var
    registro: dataVenta;
    i : integer;
begin
    i:=1;
    leerVenta(registro);
    while((registro.dia <> 0) and (dimL < ventasMax)) do
    begin
        v[i] := registro;
        dimL := dimL + 1;
        i := i + 1;
        leerVenta(registro);
    end;
end;

procedure imprimirVentas(v:ventas; dimL:integer);
var
    i : integer;
begin
    for i := 1 to dimL do 
    begin
        writeln('-----  Venta -------');
        writeln('Dia: ', v[i].dia);
        writeln('Codigo: ', v[i].codigo);
        writeln('Ventas: ', v[i].cantVend);
        writeln('--------------------');
    end;
end;

procedure acomodarElArray(var v: ventas; dimL: integer);
var
    i, j , pos: integer;
    item : dataVenta;
begin
    for i := 1 to dimL - 1 do
    begin
        pos := i;
        for j :=  i + 1 to dimL  do
        begin
            if(v[j].codigo < v[pos].codigo ) then
                pos := j;
        end;
        item := v[pos]; 
        v[pos] := v[i]; 
        v[i] := item; 
    end;
end;

procedure eliminarVentas(var v: ventas; var dimL: integer; rango1, rango2: integer);
var
    i, j: integer;
begin
    i := 1;
    while (i <= dimL) do
    begin
        if (v[i].codigo >= rango1) and (v[i].codigo <= rango2) then
        begin
            // Desplazar a la izquierda
            for j := i to dimL - 1 do
                v[j] := v[j+1];
            dimL := dimL - 1;   // achicar dimensión lógica
            // NO incrementamos i, porque ahora hay un nuevo elemento en la misma posición
        end
        else
            i := i + 1;
    end;
end;

procedure resumenCodigosPares(v: ventas; dimL: integer; var r: resumenArray; var dimR: integer);
var
    i, actualCodigo, total: integer;
begin
    dimR := 0;
    i := 1;
    while (i <= dimL) do
    begin
        actualCodigo := v[i].codigo;
        total := 0;
        
        // Acumular todas las ventas del mismo código
        while (i <= dimL) and (v[i].codigo = actualCodigo) do
        begin
            total := total + v[i].cantVend;
            i := i + 1;
        end;
        
        // Solo guardamos si es código par
        if (actualCodigo mod 2 = 0) then
        begin
            dimR := dimR + 1;
            r[dimR].codigo := actualCodigo;
            r[dimR].totalVend := total;
        end;
    end;
end;

procedure imprimirResumen(r: resumenArray; dimR: integer);
var
    i: integer;
begin
    writeln('--- Resumen de codigos pares ---');
    for i := 1 to dimR do
    begin
        writeln('Codigo: ', r[i].codigo, '  Total vendido: ', r[i].totalVend);
    end;
end;


var 
    resumen: resumenArray;
    dimR: integer;
    dimL, rango1, rango2 : integer;
    v: ventas;
begin
    randomize;
    dimL := 0;
    registrarVentas(v, dimL);
    imprimirVentas(v, dimL);
    acomodarElArray(v, dimL);
    imprimirVentas(v, dimL);
    write('Ingrese dos rangos para eliminar elementos del arrray: ');
    readln(rango1);
    write('Ahora un segundo: ');
    readln(rango2);
    eliminarVentas(v, dimL, rango1, rango2);
    imprimirVentas(v, dimL);
    resumenCodigosPares(v, dimL, resumen, dimR);
    imprimirResumen(resumen, dimR)
End.
