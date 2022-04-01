Algoritmo sin_titulo
	Definir num, contador, almacen Como Entero
	Escribir "Serie de números"
	contador = 0
	Repetir
		Escribir "Leer un número"
		Leer num
		Si num<>0 Entonces
			contador = contador + 1
			Si num%2=0
				Entonces Escribir "El número es par"
			Sino Escribir "El número es impar"
			FinSi
		FinSi
	Hasta Que num = 0
FinAlgoritmo
