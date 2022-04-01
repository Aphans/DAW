Algoritmo NotaAlumno
	Escribir 'Escribe las notas de el alumno'
	Definir T1 Como Real
	Definir T2 Como Real
	Definir T3 Como Real
	Definir A Como Real
	Definir B Como Real
	Definir Total Como Real
	Escribir 'Escribe la nota del primer trimestre comprendida entre 0 y 10'
	Repetir
		Leer T1
	Hasta Que T1<=10
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
	Escribir "La nota final es:"
	Si T1>T2 Entonces
		Escribir A/3
	SiNo
		Escribir B/2
	FinSi
	Si T2 < 5 Entonces
		Escribir "Se va a la ordinaria con la segunda evaluación"
	FinSi
	Si T3 < 5 Entonces
		Escribir "Se va a la ordinaria con la tercera evaluación"
	FinSi
FinAlgoritmo
