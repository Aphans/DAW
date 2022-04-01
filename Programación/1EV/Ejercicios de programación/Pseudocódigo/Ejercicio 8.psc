Algoritmo sin_titulo
	Definir N,numero,contador,sumaPar,productoImpares Como Entero
	sumaPar <- 0
	productoImpares <- 1
	contador <- 0
	Escribir 'Introduzca la cantidad de números'
	Leer N
	Repetir
		contador <- contador+1
		Escribir 'Introduzca un número'
		Leer numero
		Si numero MOD 2=0 Entonces
			sumaPar <- numero+sumaPar
		SiNo
			productoImpares <- numero*productoImpares
		FinSi
	Hasta Que contador>=N
	Escribir 'La suma de los pares es:',sumaPar
	Escribir 'El producto de los impares es:',productoImpares
FinAlgoritmo
