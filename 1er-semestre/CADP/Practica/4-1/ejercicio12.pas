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
var
	datosGalaxias: almGalaxias;
	datosTipos: tiposGalaxias;
	porcentaje: real;
	totalMasa, masaPorTres : integer;
begin
	masaPorTres := 0;
	totalMasa := 0;
	guardarDatosGalaxias(datosGalaxias);
	incisoA(datosGalaxias, datosTipos);
	incisoB(datosGalaxias, totalMasa, masaPorTres);
	writeln('Masa total de las 3 galaxias principales: ', masaPorTres:0:2);
	porcentaje := (masaPorTres / totalMasa) * 100;
	writeln('Representan el ', porcentaje:0:2, '% de la masa total.');
End.