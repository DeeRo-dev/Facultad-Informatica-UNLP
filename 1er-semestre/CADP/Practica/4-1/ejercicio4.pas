{
        4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
            a. posicion: dado un número X y el vector de números, retorna la posición del número X en dicho
            vector, o el valor -1 en caso de no encontrarse.
        b. intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo
            vector donde se intercambiaron los valores de las posiciones x e y.
        c. sumaVector: retorna la suma de todos los elementos del vector.
        d. promedio: devuelve el valor promedio de los elementos del vector.
        e. elementoMaximo: retorna la posición del mayor elemento del vector
        f. elementoMinimo: retorna la posicion del menor elemento del vector
}


program Vectores;
const
    cant_datos = 10;
type
    vdatos = array[1..cant_datos] of real;
    
procedure cargarVector(var v:vdatos; var dimL : integer);
var
    num : real;
begin
    readln(num);
    while((dimL < cant_datos) and (num <> 0)) do
        begin
            dimL := dimL + 1;
            v[dimL] := num;
           if (dimL < cant_datos) then 
                begin
                    writeln('Ingrese otro valor de tipo real (0 para terminar): ');
                    readln(num);
                end;
        end;
end;
procedure encontrarX(v:vdatos; posicionV:integer; dimL:integer; var posicion:integer; var encontre: boolean);
var
    i:integer;
begin
    i:=1;
    while((i <= dimL) and (encontre = false)) do
        begin
            if(posicionV = v[i]) then
                begin
                    encontre := true;
                    posicion:= i;
                end;
            i := i + 1;
        end;
end;


procedure intercambiar(var v: vdatos; posicionX: integer; posicionY: integer; dimL:integer);
var
    i, aux1, aux2:integer;
    encontre1, encontre2: boolean;
    aux: real;
begin
    aux1 := -1;
    aux2 := -1;
    encontrarX(v, posicionX, dimL, aux1, encontre1);
    encontrarX(v, posicionY, dimL, aux2, encontre2);
    if((encontre1 = true) and (encontre2 = true)) then
        begin
            aux:= v[posicionX];
	        v[posicionX]:= v[posicionY];
	        v[posicionY]:= aux;
	        for i := 1 to dimL do
	            writeln(v[i]:0:2);
        end
    else
        writeln('Al menos uno de los dos valores no existe dentro del vector');
end;
procedure calcularValoresVector(v: vdatos; dimL: integer; var sumaTotal: real; var promedio: real; var posMin:integer; var posMay: integer);
var 
    i : integer;
    numMin, numMay: real;
begin
    numMin := 999;
    numMay := -1;
    sumaTotal := 0;
    promedio := 0;
    for i := 1 to dimL do
        begin
            sumaTotal := sumaTotal + v[i];
            if(v[i] < numMin) then
                begin
                    numMin := v[i];
                    posMin := i;
                end;
            if(v[i] > numMay) then
                begin
                    numMay := v[i];
                    posMay := i;
                end;
            
        end;
    promedio := sumaTotal / dimL;
end;
var
    dim, num, val1,val2, aux, posMin, posMay:integer;
    datos: vdatos;
    encontre : boolean;
    promedio, sumaTotal: real;
begin
    dim := 0;
    aux:=-1;
    encontre:=false;
    cargarVector(datos, dim);
    write('Ingrese un numero paa buscar la posicion en el vector: ');
    readln(num);
    encontrarX(datos, num, dim, aux, encontre);
    if(encontre = true) then
        writeln('El valor ingresado fue encontrado en la posicion: ', aux)
    else
        writeln('No se encontro el valor buscado: ', aux);
    writeln('Ingrese X e Y para intercambiar la posicion en el vector: ');
    write('Ingrese X: ');
    readln(val1);
    write('Ingrese Y: ');
    readln(val2);
    intercambiar(datos, val1, val2, dim);
    calcularValoresVector(datos, dim, sumaTotal, promedio, posMin, posMay);
    writeln('La suma de todos los elementos del vector es de : ', sumaTotal:0:2);
    writeln('La posicion del numero menor es de: ', posMin);
    writeln('La posicion del numero mayor es de: ', posMay);
end.
