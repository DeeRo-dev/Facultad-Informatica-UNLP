{
    5) De acuerdo a los valores de la tabla que indica la cantidad de bytes que ocupa la representación
    interna de cada tipo de dato en Pascal, calcular el tamaño de memoria en los puntos señalados a partir
    de(I), suponiendo que las variables del programa ya están declaradas y se cuenta con 400.000 bytes
    libres. Justificar mediante prueba de escritorio.
}

program ejercicio5;
Type
    TEmpleado = record
        sucursal: char; // 1 bytes
        apellido: string[25]; // 1 + 25 = 26 bytes
        correoElectronico: string[40]; // 1 + 40 = 41 bytes
        sueldo: real; // 8 bytes
    end; total de bytes = 76
    Str50 = string[50];
Var
    alguien: TEmpleado;
    PtrEmpleado: ^TEmpleado; // 4 bytes: memorira estatica
Begin
    {Suponer que en este punto se cuenta con 400.000 bytes de memoria disponible (I)}
    Readln( alguien.apellido );
    {Pensar si la lectura anterior ha hecho variar la cantidad de memoria (II)}
    New( PtrEmpleado );
    {¿Cuánta memoria disponible hay ahora? (III)} 
    Readln( PtrEmpleado^.Sucursal, PtrEmpleado^.apellido );
    Readln( PtrEmpleado^.correoElectronico, PtrEmpleado^.sueldo );
    {¿Cuánta memoria disponible hay ahora? (IV)}
    Dispose( PtrEmpleado );
    {¿Cuánta memoria disponible hay ahora? (V)}
end.


(I), suponiendo que las variables del programa ya están declaradas y se cuenta con 400.000 byte
(II): La lectura anterior no cuesta memoria, dado que se guarda la memoria cuando se declara la variable
(III): Luego de de hacer new() se resta el tipo de variable que tiene el puntero, quedaria libres 399.924 bytes
(IV): La lectura anterior no cuesta memoria, dado que se guarda la memoria cuando se declara la variable
(V): Libera la memoria asi que volveria a quedar 400.000 bytes disponibles

