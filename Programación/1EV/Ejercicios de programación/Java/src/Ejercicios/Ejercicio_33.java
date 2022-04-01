package Ejercicios;
import java.util.Scanner;

public class Ejercicio_33 {
	public static void main (String [] args) {
		Scanner entrada = new Scanner (System.in);
		System.out.println ("Introduce el número");
		int num = entrada.nextInt ();
		System.out.println ("Los números pares anteriores a:" +num);
		for (int contador = 1;contador<num; contador++) {
			if (contador%2==0)
			System.out.print(+contador+",");
		}
		entrada.close();
	}
}
