package Ejercicios;
import java.util.Scanner;

public class Ejercicio_56{

	public static void main (String [] args){
		Scanner entrada = new Scanner (System.in);
		final int NT = 10;
		int contador = 0;
		int menor = Integer.MAX_VALUE;
		System.out.println("Escribe 10 números negativos");
		do {
			int num = entrada.nextInt();
			if (num<0) 
				contador++;
			if (num<menor) {
				menor = num;
			}
		}while (contador<NT);
		entrada.close();
		System.out.println("El número menor es:"+menor);
	}
}