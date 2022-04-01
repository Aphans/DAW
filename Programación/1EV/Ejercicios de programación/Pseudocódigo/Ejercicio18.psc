Algoritmo Ejercicio18
	Definir num1,num2,suma,resta Como Entero
	Escribir 'Introduce un número'
	Leer num1
	Escribir 'Introduce otro número'
	Leer num2
	suma <- num1+num2
	resta <- num1-num2
	Si num1 = 0
		Entonces Escribir"El primer número es incorrecto"
	FinSi
	Si num2=0
		Entonces Escribir "El segundo número introducido es incorrecto"
	FinSi
	Si num1>0 Y num2>0 Entonces
		Escribir 'El resultado de la suma es:',suma
	FinSi
	Si num1<0 Y num2<0 Entonces
		Escribir "El resultado de la resta es:", resta
	FinSi
FinAlgoritmo
