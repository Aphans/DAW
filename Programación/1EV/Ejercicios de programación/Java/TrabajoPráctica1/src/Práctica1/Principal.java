/*Autores:�ngel Cucal�n Guti�rrez y Juan Daniel Suarez Cabal*/

package Pr�ctica1;
import java.util.Scanner;

public class Principal {
	public static void main(String[] args) {
		/* Si en un supuesto caso no elegimos la opci�n 1 para dar valor a el n�mero A.Este tendr� por defecto el valor 1.
		 Si en un supuesto caso no elegimos la opci�n 2 para dar valor a el n�mero B.Este tendr� por defecto el valor 10.
		 Por ello se inicializan las variables de los n�meros "A" y "B" con unos valores por defecto.
		 */
		int operacion;
		Scanner entrada = new Scanner(System.in);
		operacion range = new operacion();
		do {
			System.out.println("Elija una opci�n:\r\n"
					+ "1. Introducir n�mero A\r\n"
					+ "2. Introducir n�mero B\r\n"
					+ "3. Contar n�meros no primos en el rango\r\n"
					+ "4. Mostrar pares en el rango\r\n"
					+ "5. Salir");
			operacion = entrada.nextInt();
			// En funci�n de la operaci�n, utilizamos un m�todo u otro
			switch(operacion) {
			// Elegir la operaci�n 1
			case 1:
				do {
					System.out.print("Introduce el n�mero A.Este tiene que ser mayor a 1: ");
					range.setNumA(entrada.nextInt()); 
				}while(range.getNumA()<1);
				break;
				// Elegir la operaci�n 2
			case 2:
				do {
					if(range.getNumB()>range.getNumA()) {
					System.out.print("Introduce el n�mero B.Este tiene que ser mayor a 1: ");
					}
					else {
						System.out.println("Introduce un n�mero mayor que"+" "+range.getNumA());
					}
					range.setNumB(entrada.nextInt()); 
				}while(range.getNumB()<1);
				break;
				
				// Elegir la operaci�n 3
			case 3:
				if(range.getNumA()<range.getNumB()) {
					System.out.print("Los n�meros no primos a mostrar comprendidos entre"+" "+range.getNumA()+" "+"y"+" "+range.getNumB()+" "+"son:"+"\n");
				range.noPrimos();
				}
				else {
					System.out.println("ERROR.El n�mero A:"+" "+range.getNumA()+" "+"es mayor o igual que el n�mero B:"+" "+range.getNumB()+"\n"+"Por favor,introduzca un valor para el n�mero B que sea mayor que el valor del n�mero A para poder iniciar l");
				}
				break;
				//Elegir la operaci�n 4
			case 4:
				if(range.getNumA()<range.getNumB()) {
				System.out.print("Los n�meros pares a mostrar comprendidos entre"+" "+range.getNumA()+" "+"y"+" "+range.getNumB()+" "+"son:"+"\n");
			    range.pares();
				}
				else {
					System.out.println("ERROR.El n�mero A:"+" "+range.getNumA()+" "+"es mayor o igual que el n�mero B:"+" "+range.getNumB()+"\n"+"Por favor,introduzca un valor para el n�mero B que sea mayor que el valor del n�mero A para poder iniciar l");
				}
				break;
			case 5:
				System.out.print("Gracias por utilizar el programa");
				break;
			default:
				//En cualquier otro caso la operaci�n no es v�lida.
				System.out.println("ERROR"+"\n"+"Elige una opci�n comprendida entre el 1 y el 5");
				operacion=entrada.nextInt();
				if (operacion==5) {
			    	System.out.println("Gracias por usar el programa");
			    }
			}

		}while(operacion!=5);
	
		entrada.close();
	}
}
