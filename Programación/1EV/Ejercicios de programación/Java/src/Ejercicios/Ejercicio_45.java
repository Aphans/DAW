package Ejercicios;
import java.util.Scanner;

public class Ejercicio_45{
	public static void main (String [] args) {
		Scanner entrada = new Scanner (System.in);
		System.out.println("Introduce la base:");
	int base = entrada.nextInt();
	System.out.println("Introduce la altura:");
	int altura = entrada.nextInt();
	for (int i = 1; i <= altura; i++) {
		for (int j = 1; j<= base; j++) {
			System.out.print("*");
		}
		System.out.println("");
	}
	entrada.close();
	}
}