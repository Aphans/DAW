package Pr�ctica1;

public class operacion {
	//Atributos
	private int numA,numB;
	// Constructor
	public operacion() {
		numA=1;
		numB=10;
	}
	//M�todos
	//M�todo Case 4:
	void pares() {
		if(numA<numB) {
			for(int i=numA;i<numB;i++) {
				if (i%2==0) {
					System.out.print(i+"\n");	
				}
			}
		}
				else {
					System.out.println("No existen n�meros pares en el rango");
				}
			}
    //M�todo Case 3:
	 void noPrimos() {
		 if(numA<numB) {
		 //Contador No Primos
		    int contador = 0;
            //Rango
	        for (int i = numA; i < numB; i++) {
	            boolean isPrimeNumber = true;
	            // Comprueba si un n�mero es primo
	            for (int j = 2; j < i; j++) {
	                if (i % j == 0) {
	                    isPrimeNumber = false;
	                    break; 
	                }
	            }
	            // Si los n�meros no son primos, se imprimir�n en pantalla
	            if (isPrimeNumber==false) {
	                contador++;
	                System.out.print(i + ", ");

	            }

	        }
	        System.out.println("Contador: " + contador);
		 }
	 }

	//Coge los valores de los m�todos "set" para dar valor a las variables
	public int getNumA() {
		return numA;
	}
	public int getNumB() {
		return numB;
	}
	/*Establece los valores del Constructor por defecto, si no se dan valor en la clase principal.
	Si se diesen valor a las variables en la clase principal,entonces se dar�an los valores de esta.*/
	public void setNumA(int numA) {
		this.numA = numA;
	}
	public void setNumB(int numB) {
		this.numB = numB;
	}
}