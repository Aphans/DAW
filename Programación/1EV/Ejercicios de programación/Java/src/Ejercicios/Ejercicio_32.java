package Ejercicios;
import java.util.Scanner;

public class Ejercicio_32 {
	public static void main (String [] args) {
		Scanner entrada = new Scanner (System.in);
		System.out.println ("Introduce el n�mero");
		int num = entrada.nextInt ();
		System.out.println ("Los n�meros anteriores a:" +num);
		for (int contador = 1;contador<num; contador++) {
			System.out.print(+contador+",");
		}
		entrada.close();
	}
}
