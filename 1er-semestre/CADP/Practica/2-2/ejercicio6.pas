{
    6. Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
    producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
    ● Código de los dos productos más baratos.
    ● Código del producto de tipo “pantalón” más caro.
    ● Precio promedio.
    
}



program Ejercicio6;
    var
        codePriceLow1, codePriceLow1, codePants: integer;
        average: real;
        
    procedure readProduct(var code: integer; var typeProduct: string; var price: real);
        var 
            i: integer;
        begin
            for i := 0 to 10 do
            begin
                writeln('Data product: ');
                write('Enter CODE: ');
                readln(code);
                write('Enter TYPE: ');
                readln(typeProduct);
                write('Enter PRICE: ');
                readln(price);
            end;
        end;
    procedure calculate(code: integer; typeProduct: string; price: real; var codePriceLow: integer,var codePants: integer; var average: real);
        var
            priceLow1, priceLow2: real;
        begin
            priceLow1 :=9999;
            priceLo2 :=99999;
            codePriceLow := 9999; 
            codePriceLow:= 0;
            average: 0;
            if(price < priceLow) then
                begin
                    codePriceLow := 
                end;
        end;
    
    var
        code, codePriceLow, codePants: integer;
        typeProduct: string;
        price, average: real;
begin
    writeln ('Hello World');
    readProduct(code, typeProduct, price);
end.
