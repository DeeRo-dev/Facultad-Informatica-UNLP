contador = 0;
entrada = input("Ingrese un palabra y te diremos la cantidad de vocales que tiene: ")
for i, char in enumerate(entrada):
    if char in "aeiouAEIOU":
        contador += 1;
        print("Se detecto una vocal en la posicion: " , i);
        continue;
if contador > 0: 
    print("La cantidad de vocales para la palabra ", entrada, " es: ", contador);
else:
    print("La palabra ", entrada, " no tiene vocales");
