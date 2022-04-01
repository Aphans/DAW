Algoritmo NotaAlumno3
	Escribir 'Escribe las notas de el alumno'
	Definir T1 Como Real
	Definir T2 Como Real
	Definir T3 Como Real
	Definir A Como Real
	Definir B Como Real
	Definir C Como Real
	Definir X Como Real
	Definir Z Como Real
	Definir nota como real
	Definir Total Como Real
	Repetir
		Escribir 'Escribe la nota del primer trimestre comprendida entre 0 y 10'
		Leer T1
	Hasta Que T1<=10 y T1>0
	Escribir 'Escribe la nota del segundo trimestre comprendida entre 0 y 10'
	Repetir
		Leer T2
	Hasta Que T2<=10
	Escribir 'Escribe la nota del tercer trimestre comprendida entre 0 y 10'
	Repetir
		Leer T3
	Hasta Que T3<=10
	A <- T1+T2+T3
	B <- T2+T3
	X <- A/3
	Z <- B/2
	Escribir 'La nota media es:'
	Si T1>T2 Entonces
		Escribir X
		nota <- X
	SiNo
		Escribir Z
		nota <- Z
	FinSi
	Si nota>=4 y (T2<5 O T3<5) Entonces
		Escribir 'La nota final es un : 4'
	FinSi
FinAlgoritmo
