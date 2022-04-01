package Práctica1;

public class operacion {
	//Atributos
	private int numA,numB;
	// Constructor
	public operacion() {
		numA=1;
		numB=10;
	}
	//Métodos
	//Método Case 4:
	void pares() {
		if(numA<numB) {
			for(int i=numA;i<numB;i++) {
				if (i%2==0) {
					System.out.print(i+"\n");	
				}
			}
		}
				else {
					System.out.println("No existen números pares en el rango");
				}
			}
    //Método Case 3:
	 void noPrimos() {
		 if(numA<numB) {
		 //Contador No Primos
		    int contador = 0;
            //Rango
	        for (int i = numA; i < numB; i++) {
	            boolean isPrimeNumber = true;
	            // Comprueba si un número es primo
	            for (int j = 2; j < i; j++) {
	                if (i % j == 0) {
	                    isPrimeNumber = false;
	                    break; 
	                }
	            }
	            // Si los números no son primos, se imprimirán en pantalla
	            if (isPrimeNumber==false) {
	                contador++;
	                System.out.print(i + ", ");

	            }

	        }
	        System.out.println("Contador: " + contador);
		 }
	 }

	//Coge los valores de los métodos "set" para dar valor a las variables
	public int getNumA() {
		return numA;
	}
	public int getNumB() {
		return numB;
	}
	/*Establece los valores del Constructor por defecto, si no se dan valor en la clase principal.
	Si se diesen valor a las variables en la clase principal,entonces se darían los valores de esta.*/
	public void setNumA(int numA) {
		this.numA = numA;
	}
	public void setNumB(int numB) {
		this.numB = numB;
	}
}