package Ejercicios;
import java.util.Scanner;

public class Ejercicio_22 {
	public static void main(String[]Args) {
		Scanner entrada = new Scanner (System.in);
		System.out.println ("Introduzca un n�mero");
		int num;
		do {
			num = entrada.nextInt();
			if (num%2==0) {
				System.out.println("El n�mero es par");
			}
			else 
				System.out.println ("El n�mero es impar");
			
		} while(num%2==0||num%2!=0);
		System.out.println(num);
		entrada.close();
	}
}