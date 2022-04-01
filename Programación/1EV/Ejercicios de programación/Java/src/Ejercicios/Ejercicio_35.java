package Ejercicios;
import java.util.Scanner;
public class Ejercicio_35 {
	public static void main(String[] args) {
		final int CANTIDAD_NUMEROS = 5;
		Scanner entrada = new Scanner(System.in);
		System.out.println("Introduce"+CANTIDAD_NUMEROS+" n�meros:");
		// Inicializo mayor al menor n�mero posible
		int mayor = Integer.MIN_VALUE;
		for(int contador = 1; contador<=CANTIDAD_NUMEROS; contador++) {
			System.out.print("Introduce un n�mero: ");
			int numero = entrada.nextInt();
			// Si el n�mero es mayor que el mayor hasta el momento, actualizo el mayor
			if(numero>mayor) {
				mayor=numero;
			}
		}
		System.out.println("El mayor n�mero escrito es "+mayor);
		entrada.close();
	}
}