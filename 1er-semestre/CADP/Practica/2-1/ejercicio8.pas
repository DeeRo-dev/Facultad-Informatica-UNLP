{
    8. Dado el siguiente programa:

program anidamientos;
procedure leer;
var
    letra : char;
    function analizarLetra : boolean;
    begin
        if (letra >= ‘a’) and (letra <= ‘z’) then
            analizarLetra := true;
        else
            if (letra >= ‘A’) and (letra <= ‘Z’) then
                analizarletra := false;
    end; //fin de la funcion analizarLetra
begin
    readln(letra);
    if (analizarLetra) then
        writeln(‘Se trata de una minúscula’)
    else
        writeln(‘Se trata de una mayúscula’);
end; // fin del procedure leer

var
    ok : boolean;
begin // programa principal
    leer;
    ok := analizarLetra;
    if ok then
        writeln(‘Gracias, vuelva prontosss’);
end.

        a. La función analizarLetra fue declarada como un submódulo dentro del procedimiento leer, pero esto
        puede traer problemas en el código del programa principal.

        i) ¿Qué clase de problema encuentra?
            //El problema es que esta fuera del contexto del programa principal
        ii) ¿Cómo se puede resolver el problema para que el programa compile y funcione correctamente?
            //Se podria declarar la funcion por dentro del programa princiapl
        b. La función analizarLetra parece incompleta, ya que no cubre algunos valores posibles de la variable
        letra.

        i) ¿De qué valores se trata?
            //Se trata de otros caracteres que no sean de tipo letra
        ii) ¿Qué sucede en nuestro programa si se ingresa uno de estos valores?
            //Daria error ya que al ingresar por ejemplo @, la funcion no retorna un  valor real. Podria devolver siempre false
        iii) ¿Cómo se puede resolver este problema?
              //El programa deberia poder evaluar el tipo de caracter posible, por ejemplo tener una condicion mas, que evalue si no esta dentro de 'a .. z' o 'A..Z' 
              imprima que no esta en el abecedario. Habria que analizar si la funcion es correcta o se cambia a un proceso.             
}