package Ejercicios;
import java.util.Scanner;

public class Ejercicio_21 {
	public static void main(String[]Args) {
		Scanner entrada = new Scanner (System.in);
		System.out.println ("Introduzca un número");
		double num;
		do {
			num = entrada.nextDouble();
			if (num>0) {
				System.out.println("El número es positivo");
			}
			else if (num<0) {
				System.out.println ("El número es negativo");
			}
		} while(num>0||num<0);
		System.out.println(num);
		entrada.close();
	}
}