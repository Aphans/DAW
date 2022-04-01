package Ejercicios;
import java.util.Scanner;

public class Ejercicio_23 {
	public static void main(String[]Args) {
		Scanner entrada = new Scanner (System.in);
		System.out.println ("Introduzca números");
		int num,contador=0;
		do {
			   num=entrada.nextInt();
			   if(num>=0) {
				   contador++;
			   }
			} while( num>=0 );
		System.out.println("Los números introducidos son:"+contador);
		entrada.close();
	}
}