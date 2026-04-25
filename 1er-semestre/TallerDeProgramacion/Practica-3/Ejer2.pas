{

    2. Escribir un programa que:
        a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
        Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
        con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
       
        i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
        producto. Los códigos repetidos van a la derecha.
       
        ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
        código de producto. Cada nodo del árbol debe contener el código de producto y la
        cantidad total de unidades vendidas.
        
        iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
        código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
        las ventas realizadas del producto.
        Nota: El módulo debe retornar TRES árboles.
        
        b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
        total de productos vendidos en la fecha recibida.
        
        c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
        con mayor cantidad total de unidades vendidas.
       
        c. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
        con mayor cantidad de ventas.

}


program Ejer1;
type
    rango = 1..31;
    regVenta = record
        codigo: integer;
        fecha: rango;
        cantVendidas : integer;
    end;
    
    arbol = ^nodo;
    nodo = record
        dato: regVenta;
        HI: arbol;
        HD: arbol;
    end;

procedure registrarVenta(var d: regVenta);
var 
    cod: integer;
begin
    cod := random(100);
    if(cod <> 0) then
    begin
        d.codigo:= cod;
        d.fecha:= 1 + random(31);
        d.cantVendidas := random(200);
    end;
end;

procedure insertarEnArbol(var a: arbol; dato: regVenta);
begin
    if (a = nil) then
    begin
        new(a);
        a^.dato := dato;
        a^.HI := nil;
        a^.HD := nil;
    end
    else if (dato.codigo < a^.dato.codigo) then
        insertarEnArbol(a^.HI, dato)
    else
        insertarEnArbol(a^.HD, dato);
end;

procedure cargarVentas(var a: arbol);
var 
     dato: regVenta;
begin
    registrarVenta(dato);
    while (dato.codigo <> 0) do
    begin
        insertarEnArbol(a, dato);
        registrarVenta(dato);
    end;
end;

procedure productosDuplicados(var a: arbol; dato: regVenta);
begin
    if (a = nil) then
    begin
        new(a);
        a^.dato := dato;
        a^.HI := nil;
        a^.HD := nil;
    end
    else if (dato.codigo < a^.dato.codigo) then
        insertarEnArbol(a^.HI, dato)
    else if (dato.codigo >= a^.dato.codigo) then
        insertarEnArbol(a^.HD, dato)
    else 
        a^.dato.cantVendidas :=  a^.dato.cantVendidas + dato.cantVendidas;
end;


procedure procesarVentas(a: arbol; var aCant: arbol);
begin
    if (a <> nil )then
    begin
        procesarVentas(a^.HI, aCant);
        productosDuplicados(aCant, a^.dato);
        procesarVentas(a^.HD, aCant);
    end;
end;


var
    a, juntarProductos: arbol;
begin
    randomize;
    a := nil;
    juntarProductos := nil;
    cargarVentas(a);
    procesarVentas(a, juntarProductos);
    writeln ('Hello World');
end.