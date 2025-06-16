{
    5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
    producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se
    ingresa el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular
    e informar:

    a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
    
    b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
    
    c. Código de los dos productos más económicos.
}


program ejercicio5;
type
    lista = ^almProductos;
    producto = record
        cod: integer;
        descripcion: string;
        stockAct: integer;
        stockMin: integer;
        precio: real;
    end;
    almProductos = record
        dato: producto;
        sig: lista;
    end;
procedure leerProducto(var p: producto);
begin
    writeln('-----Vamos a ingresar un producto-----');
    write('Ingrese el codigo: ');
    readln(p.cod);
    if(p.cod <> -1) then
    begin
        write('Ingrese una breve descripcion: ');
        readln(p.descripcion);
        write('Ingrese stock actual: ');
        readln(p.stockAct);
        write('Ingrese stock minimo que puede haber: ');
        readln(p.stockMin);
        write('Ingrese el precio: ');
        readln(p.precio);
    end;
end;
procedure almacenarProductos(var l: lista; p: producto);
var
    aux: lista;
begin
    new(aux);
    aux^.dato := p;
    aux^.sig := l;
    l:= aux;
end;
procedure generarProductos(var l: lista);
var
    p: producto;
begin
    leerProducto(p);
    while(p.cod <> -1) do
    begin
        almacenarProductos(l, p);
        leerProducto(p);
    end;
end;
procedure incisoA(l: lista; var porcentage: real);
var
    cantStock, cantStockMin: integer;
begin
    cantStock:= 0;
    cantStockMin:= 0;
    while(l <> nil) do
    begin
        if(l^.dato.stockAct < l^.dato.stockMin) then
            cantStockMin:= cantStockMin + 1;
        cantStock := cantStock + 1;
        l:= l^.sig;
    end;
    porcentage:= (cantStockMin / cantStock) * 100;
end;
procedure incisoB(l:lista);
var
    cont, aux, num: integer;
begin
    while(l <> nil) do
    begin
        num:= l^.dato.cod;
        cont := 0;
        while(num <> 0) do 
        begin
            aux:= (num MOD 10);
            if((aux MOD 2) = 0) then
                cont := cont + 1;
            num := num DIV 10;
        end;
        if(cont >= 3 ) then
            writeln(l^.dato.cod, ': ', l^.dato.descripcion);
        l := l^.sig;
    end; 
end;
procedure incisoC(l : lista);
var
    codMin, codMasMin: integer;
    precioMin, precioMasMin: real;
begin
    precioMin:=9999;
    precioMasMin:=99999;
    codMin := -1;
    codMasMin := -1;
    while(l <> nil) do
    begin
        if(l^.dato.precio < precioMasMin) then
        begin
            precioMin := precioMasMin;
            codMin := codMasMin;
            precioMasMin := l^.dato.precio;
            codMasMin := l^.dato.cod;
        end
        else if(l^.dato.precio < precioMin) then
        begin
            precioMin := l^.dato.precio;
            codMin := l^.dato.cod;
        end;
        l := l^.sig;
    end;
    writeln('El codigo mas del producto mas barato es el: ', codMasMin, '. Y el segundo mas barato es el: ', codMin);
end;
procedure leerLista(l: lista);
begin
    while(l <> nil) do
    begin
        writeln('El contenido de la lista es: ', l^.dato.cod);
        l := l^.sig;
    end;
end;
var
    l: lista;
    porcentage : real;
begin
    l:= nil;
    porcentage:= 0;
    generarProductos(l);
    incisoA(l, porcentage);
    writeln('El porcentage de productos con stock actual es menor al stock minimo es de: ', porcentage:0:2, '%');
    incisoB(l);
    incisoC(l);
    leerLista(l);
End.