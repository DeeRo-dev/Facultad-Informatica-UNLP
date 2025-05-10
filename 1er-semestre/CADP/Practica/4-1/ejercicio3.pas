{

    3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
        a. Realizar un módulo que imprima el vector desde la primera posición hasta la última.
        b. Realizar un módulo que imprima el vector desde la última posición hasta la primera.
        c. Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
           desde la mitad más uno hacia la última posición.
        d. Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde
            la posición X hasta la Y. Asuma que tanto X como Y son menores o iguales a la dimensión lógica. Y
            considere que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o
            hacia atrás.
        e. Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.
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
procedure leerVector(v:vdatos; dimL:integer);
var 
    i: integer;
begin
    writeln('-------- Lectura en asc --------');
    for i := 1 to dimL do
        begin
            writeln('El valor en la posición ', i, ' es de: ', v[i]:0:2);
        end;
    writeln('------ Lectura en dsc -----------');    
    for i := dimL downto 1 do
        begin
            writeln('El valor en la posición ', i, ' es de: ', v[i]:0:2);
        end;
    writeln('------ Lectura en mitad dsc -----------');    
    for i := (dimL DIV 2) downto 1 do
        begin
            writeln('El valor en la posición ', i, ' es de: ', v[i]:0:2);
        end;
end;
procedure leerVectorXandY(v:vdatos; x:integer; y:integer);
var
    i:integer;
begin
    if(x < y) then
        begin
            for i := x to y do
                begin
                    writeln('El valor en la posición ', i, ' es de: ', v[i]:0:2);
                end;
              writeln('------ Lectura dimL DIV 2 asc -----------');        
            for i := (dimL DIV 2) to y do
        begin
            writeln('El valor en la posición ', i, ' es de: ', v[i]:0:2);
        end;
        end
    else if(x > y) then
        begin
            for i := x downto y do
                begin
                    writeln('El valor en la posición ', i, ' es de: ', v[i]:0:2);
                end;
            writeln('------ Lectura dimL DIV 2 dsc -----------');            
            for i := (dimL DIV 2) downto y do
        begin
            writeln('El valor en la posición ', i, ' es de: ', v[i]:0:2);
        end;    
        end
    else
        writeln('Se eligio la misma posicion, el valor es: ', v[x]:0:2);
end;
var
    datos : vdatos;
    dim, posicionX, posicionY : integer;
    
begin
    dim := 0;
    cargarVector(datos, dim);
    leerVector(datos, dim);
    writeln('Elija una posicion para leer el vector: ');
    writeln('Posicion x:' );
    readln(posicionX);
    writeln('Posicion y:' );
    readln(posicionY);
    leerVectorXandY(datos, posicionX, posicionY);
end.
