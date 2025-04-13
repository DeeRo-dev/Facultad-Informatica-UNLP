{
    7. Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un
    almacén. La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse.
    Para cada producto leído, el programa deberá indicar si el nuevo precio del producto supera en un
    10% al precio anterior.
    Por ejemplo:
    ○ Si se ingresa el código 10382, con precio actual 40, y nuevo precio 44, deberá imprimir: “el
    aumento de precio del producto 10382 no supera el 10%”
    ○ Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir: “el
    aumento de precio del producto 32767 es superior al 10%”
}


program Program7;
    const porcentage = 10;
    var 
        currentPrice, newPrice: real;
        codeProduct: integer;
begin
    writeln('Hello, enter the code product, enter the codigo product 32767 to end program: ');
    repeat
        write('enter the code product: ');
        readln(codeProduct);
        write('Enter the current price: ');
        readln(currentPrice);
        write('and of new price: ');
        readln(newPrice);
        if( newPrice > (currentPrice * 1.10)) then
            writeln('el aumento de precio del producto ',codeProduct, ' supera el 10%')
        else 
            writeln('el aumento de precio del producto ',codeProduct, ' no supera el 10%')
    until (codeProduct = 32767);
    writeln('Program finished.');
end.
