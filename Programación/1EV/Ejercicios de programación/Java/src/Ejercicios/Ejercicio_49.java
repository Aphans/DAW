package Ejercicios;
import java.util.Scanner;

public class Ejercicio_49 {
	public static void main (String [] args) {
		Scanner entrada = new Scanner (System.in);
		System.out.println("Introduce cualquier número:");
		int filas= entrada.nextInt();
		for (int i = 1; i <= filas; i++) {
			for (int j = 1; j <= i; j++) {
				System.out.print ("*");
			}
			System.out.println(" ");
		}
		entrada.close();
	}
}