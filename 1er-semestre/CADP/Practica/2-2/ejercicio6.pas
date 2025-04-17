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
    priceLow1, priceLow2: real;
    codePriceLow1, codePriceLow2: integer;

procedure calculate(code: integer; price: real);
begin
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
end;

var
    code, i: integer;
    typeProduct: string;
    price: real;

begin
    priceLow1 := 999999;
    priceLow2 := 999999;
    codePriceLow1 := -1;
    codePriceLow2 := -1;

    for i := 1 to 4 do
    begin
        writeln('Product ', i, ':');
        readProduct(code, typeProduct, price);
        calculate(code, price);
    end;

    writeln('Codigo del producto MAS BARATO: ', codePriceLow1);
    writeln('Codigo del SEGUNDO producto mas barato: ', codePriceLow2);
end.
