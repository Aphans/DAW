Algoritmo Ejercicio18
	Definir num1,num2,suma,resta Como Entero
	Escribir 'Introduce un n�mero'
	Leer num1
	Escribir 'Introduce otro n�mero'
	Leer num2
	suma <- num1+num2
	resta <- num1-num2
	Si num1 = 0
		Entonces Escribir"El primer n�mero es incorrecto"
	FinSi
	Si num2=0
		Entonces Escribir "El segundo n�mero introducido es incorrecto"
	FinSi
	Si num1>0 Y num2>0 Entonces
		Escribir 'El resultado de la suma es:',suma
	FinSi
	Si num1<0 Y num2<0 Entonces
		Escribir "El resultado de la resta es:", resta
	FinSi
FinAlgoritmo
