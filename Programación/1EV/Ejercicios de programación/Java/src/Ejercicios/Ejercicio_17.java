package Ejercicios;
import java.util.Scanner;

public class Ejercicio_17 {
	public static void main(String[]Args) {
		Scanner entrada = new Scanner (System.in);
		System.out.println("Esribe un n�mero");
		int num;
		num=entrada.nextInt();
		while (num<=2) {
			System.out.println("Escribe otro n�mero,que sea mayor a 2");
			num=entrada.nextInt();
		}
		System.out.println(num);

		entrada.close();
	}
}