{
    6. Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
    producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
    ● Código de los dos productos más baratos.
    ● Código del producto de tipo “pantalón” más caro.
    ● Precio promedio.
    
}


program Ejercicio6;

procedure readProduct(var code: integer; var typeProduct: string; var price: real);
begin
    write('Enter CODE: ');
    readln(code);
    write('Enter TYPE: ');
    readln(typeProduct);
    write('Enter PRICE: ');
    readln(price);
end;

// Variables globales para los dos precios más bajos y sus códigos
var
    priceLow1, priceLow2, pricePants: real;
    codePriceLow1, codePriceLow2, codePants: integer;

procedure calculate(code: integer; price: real; typeProduct: string; var count: integer; var aux:real);
begin
    if((typeProduct = 'pantalon') and (price > pricePants)) then
        codePants := code;
    if (price < priceLow1) then
    begin
        priceLow2 := priceLow1;
        codePriceLow2 := codePriceLow1;

        priceLow1 := price;
        codePriceLow1 := code;
    end
    else if (price < priceLow2) then
    begin
        priceLow2 := price;
        codePriceLow2 := code;
    end;
    count := count + 1;
    aux := aux + price;
end;

var
    code, i, count: integer;
    typeProduct: string;
    price, average, aux: real;

begin
    priceLow1 := 999999;
    priceLow2 := 999999;
    codePriceLow1 := -1;
    codePriceLow2 := -1;
    codePants :=-1;
    pricePants := -1;
    aux := 0;
    count := 0;
    for i := 1 to 100 do
    begin
        writeln('Product ', i, ':');
        readProduct(code, typeProduct, price);
        calculate(code, price, typeProduct, count, aux);
    end;
    average := aux / count;
    writeln('Codigo del producto MAS BARATO: ', codePriceLow1);
    writeln('Codigo del SEGUNDO producto mas barato: ', codePriceLow2);
    if codePants <> -1 then
        writeln('Codigo del pantalon mas caro es: ', codePants)
    else
      writeln('No se ingresaron pantalones.');
    writeln('El promedio de los precios ingresados son de: ', average:0:2);
end.
