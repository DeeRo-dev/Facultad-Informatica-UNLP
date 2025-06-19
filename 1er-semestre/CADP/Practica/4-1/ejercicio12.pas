{
	12. En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
	irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
	Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
	Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
	
	a) La cantidad de galaxias de cada tipo.
	
	b) La masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
	porcentaje que esto representa respecto a la masa de todas las galaxias.
	
	c) La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
	
	d) El nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.
}

program ejercicio12; 
const
	cantGalaxias = 3;
type
	tipos = 1..4;
	datoGalaxia = record
		nombre: string;
		tipo: tipos;
		masa: integer;
		pc: integer;
	end;
	almGalaxias = array [1..cantGalaxias] of datoGalaxia;
	tiposGalaxias = array [tipos] of integer;
procedure leerGalaxia(var dato:datoGalaxia);
begin
	write('Ingrese el nombre de la galaxia: ');
	readln(dato.nombre);
	write('Tipo de galaxia (1. elíptica; 2. espiral; 3. lenticular; 4. irregular): ');
	readln(dato.tipo);
	write('Ingre el numero medido en kl de su masa: ');
	readln(dato.masa);
	write('Ingre el pc: ');
	readln(dato.pc);
end;
procedure guardarDatosGalaxias(var v: almGalaxias);
var
	d: datoGalaxia;
	i: integer;
begin
	for i := 1 to cantGalaxias do
	begin
	 	writeln('--- Galaxia ', i, ' ---');
		leerGalaxia(d);
		v[i] := d;
	end;
end;
procedure incisoA(v: almGalaxias; v2: tiposGalaxias);
var
	i, j, k : integer;
begin
	for i := 1 to 4 do
	begin
		v2[i] := 0;  
	end;
	for j := 1 to cantGalaxias do
	begin
		v2[v[j].tipo] := v2[v[j].tipo] + 1; 
	end;
	for k := 1 to 4 do
	begin
		writeln('Tipo ', k, ': ', v2[k], ' galaxias');
	end;
end;
procedure incisoB(v: almGalaxias; var totalMasa: integer; var masaPorTres:integer);
var
	 i: integer;
begin
	for i := 1 to cantGalaxias do
	begin
		if((v[i].nombre = 'la Vía Láctea') or (v[i].nombre = 'Andrómeda') or (v[i].nombre = 'Triángulo')) then
		begin
			masaPorTres := masaPorTres + v[i].masa;
		end;
		totalMasa := totalMasa + v[i].masa;
	end;
end;
function incisoC(v: almGalaxias): integer;
var
	 aux, i: integer;
begin
	aux	:= 0;
	for i := 1 to cantGalaxias do
	begin
		if((v[i].tipo <> 4) and (v[i].pc < 1000) ) then
		begin
			aux := aux + 1;
		end;
	end;
	incisoC := aux;
end;
procedure incisoD(v: almGalaxias; var nombreMin1: string; var nombreMin2: string; var nombreMax1: string; var nombreMax2: string);
-- d) El nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.--
var
	min1, min2, max1, max2 ,i:nteger;
begin
	min1 : 99999; 
	min2 := 9999;
	max1 := -2; 
	max2 := -1;
	for i := 1 to cantGalaxias do
	begin
		if(v[i].masa < min1) then
		begin
			min2 := min1;
			nombreMin2 := nombreMin1;
			min1 := v[i].masa;
			nombreMin1 := v[i].nombre;
		end
		else if(v[i] < min2) then
		begin
			min2 := v[i].masa;
			nombreMin2 := v[i].nombre;
		end;
		if(v[i].masa > max1) then
		begin
			max2 := max1;
			nombreMax2 := nombreMax1;
			max1 := v[i].masa;
			nombreMax1 := v[i].nombre;
		end
		else if(v[i] > max2) then
		begin
			max2 := v[i].masa;
			nombreMax2 := v[i].nombre;
		end;
	end
end;
var
	datosGalaxias: almGalaxias;
	datosTipos: tiposGalaxias;
	porcentaje: real;
	totalMasa, masaPorTres, min1, min2, max1, max2 : integer;
	nombreMin1, nombreMin2, nombreMax1, nombreMax2: string;
begin
	masaPorTres := 0;
	totalMasa := 0;
	guardarDatosGalaxias(datosGalaxias);
	incisoA(datosGalaxias, datosTipos);
	incisoB(datosGalaxias, totalMasa, masaPorTres);
	writeln('El total de las 3 galaxias principales son de: ', masaPorTres);
	porcentaje := (masaPorTres / totalMasa) * 100;
	writeln('El porcentaje de las primeras 3 galxias principales es de: ', porcentaje);
	writeln('La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc: ', incisoC(datosGalaxias));
	incisoD(datosGalaxias, nombreMin1, nombreMin2, nombreMax1, nombreMax2);
	writeln('La galaxia con menor masa es: ', nombreMin1, ', y la segunda es: ', nombreMin2);
	writeln('La galaxia con mayor masa es: ', nombreMax1, ', y la segunda es: ', nombreMax2);
End.