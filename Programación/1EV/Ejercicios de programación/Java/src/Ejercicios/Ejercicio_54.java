package Ejercicios;
import java.util.Scanner;

public class Ejercicio_54{
	public static void main (String [] args) {
		Scanner entrada = new Scanner (System.in);
		final int NT = 100;
		for (int num = 1; num < NT; num++) {
		if (num%2==0) {
			System.out.println(num);
		}
		entrada.close();

		}
	}
}