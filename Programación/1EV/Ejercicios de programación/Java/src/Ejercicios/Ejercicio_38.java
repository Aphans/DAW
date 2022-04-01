package Ejercicios;
import java.util.Scanner;

public class Ejercicio_38 {
	public static void main (String [] args) {
		Scanner entrada = new Scanner (System.in);
		int numero = Integer.MIN_VALUE, anterior = 0;
		do {
			anterior = numero;
			System.out.print("Escribe un número: ");
			numero = entrada.nextInt();
		}while(numero!=anterior);

		System.out.print("Fin del programa");
		entrada.close();
	}
}
