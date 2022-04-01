package Ejercicios;
import java.util.Scanner;
public class Ejercicio_35 {
	public static void main(String[] args) {
		final int CANTIDAD_NUMEROS = 5;
		Scanner entrada = new Scanner(System.in);
		System.out.println("Introduce"+CANTIDAD_NUMEROS+" números:");
		// Inicializo mayor al menor número posible
		int mayor = Integer.MIN_VALUE;
		for(int contador = 1; contador<=CANTIDAD_NUMEROS; contador++) {
			System.out.print("Introduce un número: ");
			int numero = entrada.nextInt();
			// Si el número es mayor que el mayor hasta el momento, actualizo el mayor
			if(numero>mayor) {
				mayor=numero;
			}
		}
		System.out.println("El mayor número escrito es "+mayor);
		entrada.close();
	}
}