Algoritmo sin_titulo
	Definir num, contador, almacen Como Entero
	Escribir "Serie de n�meros"
	contador = 0
	Repetir
		Escribir "Leer un n�mero"
		Leer num
		Si num<>0 Entonces
			contador = contador + 1
			Si num%2=0
				Entonces Escribir "El n�mero es par"
			Sino Escribir "El n�mero es impar"
			FinSi
		FinSi
	Hasta Que num = 0
FinAlgoritmo
