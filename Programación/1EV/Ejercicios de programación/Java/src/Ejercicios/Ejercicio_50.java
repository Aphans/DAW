package Ejercicios;
import java.util.Scanner;

public class Ejercicio_50 {
	public static void main (String [] args) {
		Scanner entrada = new Scanner (System.in);
		System.out.println ("Introduce el número de filas");
		int filas = entrada.nextInt();
		for (int i = filas; i > 0; i--) {
			for (int j = 1; j <= i; j++) {
				System.out.print("*");
			}			
			System.out.println("");
		}
		entrada.close();
	}
}