/*Autores:Ángel Cucalón Gutiérrez y Juan Daniel Suarez Cabal*/

package Práctica1;
import java.util.Scanner;

public class Principal {
	public static void main(String[] args) {
		/* Si en un supuesto caso no elegimos la opción 1 para dar valor a el número A.Este tendrá por defecto el valor 1.
		 Si en un supuesto caso no elegimos la opción 2 para dar valor a el número B.Este tendrá por defecto el valor 10.
		 Por ello se inicializan las variables de los números "A" y "B" con unos valores por defecto.
		 */
		int operacion;
		Scanner entrada = new Scanner(System.in);
		operacion range = new operacion();
		do {
			System.out.println("Elija una opción:\r\n"
					+ "1. Introducir número A\r\n"
					+ "2. Introducir número B\r\n"
					+ "3. Contar números no primos en el rango\r\n"
					+ "4. Mostrar pares en el rango\r\n"
					+ "5. Salir");
			operacion = entrada.nextInt();
			// En función de la operación, utilizamos un método u otro
			switch(operacion) {
			// Elegir la operación 1
			case 1:
				do {
					System.out.print("Introduce el número A.Este tiene que ser mayor a 1: ");
					range.setNumA(entrada.nextInt()); 
				}while(range.getNumA()<1);
				break;
				// Elegir la operación 2
			case 2:
				do {
					if(range.getNumB()>range.getNumA()) {
					System.out.print("Introduce el número B.Este tiene que ser mayor a 1: ");
					}
					else {
						System.out.println("Introduce un número mayor que"+" "+range.getNumA());
					}
					range.setNumB(entrada.nextInt()); 
				}while(range.getNumB()<1);
				break;
				
				// Elegir la operación 3
			case 3:
				if(range.getNumA()<range.getNumB()) {
					System.out.print("Los números no primos a mostrar comprendidos entre"+" "+range.getNumA()+" "+"y"+" "+range.getNumB()+" "+"son:"+"\n");
				range.noPrimos();
				}
				else {
					System.out.println("ERROR.El número A:"+" "+range.getNumA()+" "+"es mayor o igual que el número B:"+" "+range.getNumB()+"\n"+"Por favor,introduzca un valor para el número B que sea mayor que el valor del número A para poder iniciar l");
				}
				break;
				//Elegir la operación 4
			case 4:
				if(range.getNumA()<range.getNumB()) {
				System.out.print("Los números pares a mostrar comprendidos entre"+" "+range.getNumA()+" "+"y"+" "+range.getNumB()+" "+"son:"+"\n");
			    range.pares();
				}
				else {
					System.out.println("ERROR.El número A:"+" "+range.getNumA()+" "+"es mayor o igual que el número B:"+" "+range.getNumB()+"\n"+"Por favor,introduzca un valor para el número B que sea mayor que el valor del número A para poder iniciar l");
				}
				break;
			case 5:
				System.out.print("Gracias por utilizar el programa");
				break;
			default:
				//En cualquier otro caso la operación no es válida.
				System.out.println("ERROR"+"\n"+"Elige una opción comprendida entre el 1 y el 5");
				operacion=entrada.nextInt();
				if (operacion==5) {
			    	System.out.println("Gracias por usar el programa");
			    }
			}

		}while(operacion!=5);
	
		entrada.close();
	}
}
