package Ejercicios;
import java.util.Scanner;

public class Ejercicio_23 {
	public static void main(String[]Args) {
		Scanner entrada = new Scanner (System.in);
		System.out.println ("Introduzca n�meros");
		int num,contador=0;
		do {
			   num=entrada.nextInt();
			   if(num>=0) {
				   contador++;
			   }
			} while( num>=0 );
		System.out.println("Los n�meros introducidos son:"+contador);
		entrada.close();
	}
}