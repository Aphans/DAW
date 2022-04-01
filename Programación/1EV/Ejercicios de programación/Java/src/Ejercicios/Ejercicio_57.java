package Ejercicios;
import java.util.Scanner;

public class Ejercicio_57{

	public static void main (String [] args){
		Scanner entrada = new Scanner (System.in);
		int cantRestos = 0;
		int num;
		System.out.println("Escribe números");
		do {
			num = entrada.nextInt();
			for (int j = 0; j<=num; j++) {
				if (num%num==0) {
					cantRestos++;
				}
			}
		}while (num!=-1);
		System.out.println("Los números primos son:"+cantRestos);
		entrada.close();
	}
}