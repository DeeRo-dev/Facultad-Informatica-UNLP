{

         2. Dado el siguiente programa, complete las líneas indicadas, considerando que:
            a.  El módulo cargarVector debe leer números reales y almacenarlos en el vector que se pasa como
                parámetro. Al finalizar, debe retornar el vector y su dimensión lógica. La lectura finaliza cuando se
                ingresa el valor 0 (que no debe procesarse) o cuando el vector está completo.
            b.  El módulo modificarVectorySumar debe devolver el vector con todos sus elementos incrementados
                con el valor n y también debe devolver la suma de todos los elementos del vector.

}


program Vectores;
const
    cant_datos = 5;
type
    vdatos = array[1..cant_datos] of real;
    
procedure cargarVector(var v:vdatos; var dimL : integer);
var
    num : real;
begin
    dimL:=0;
    readln(num);
    while((dimL < cant_datos) and (num <> 0)) do
        begin
            dimL := dimL + 1;
            v[dimL] := num;
           if (dimL < cant_datos) then 
                begin
                    writeln('Ingrese otro valor de tipo real (0 para terminar):');
                    readln(num);
                end;
        end;
end;
procedure modificarVectorySumar(var v:vdatos; num: real;var suma: real; dimL:integer);
var
 i:integer;
begin
    for i := 1 to dimL do
        begin
            v[i] := v[i] + num;
            suma := suma + v[i];
        end;
end;


var
    datos : vdatos;
    i, dim : integer;
    num, sumaTotal : real;
begin
    dim := 0;
    sumaTotal := 0;
    cargarVector(datos, dim); 
    writeln('Ingrese un valor a sumar');
    readln(num);
    modificarVectorySumar(datos,num ,sumaTotal, dim);
    writeln('La suma de los valores es: ', sumaTotal:0:2);
    writeln('Se procesaron: ', dim, ' números')
end.
