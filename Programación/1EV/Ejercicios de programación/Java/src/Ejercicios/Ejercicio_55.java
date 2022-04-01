package Ejercicios;
import java.util.Scanner;

public class Ejercicio_55{
	public static void main (String [] args) {
		Scanner entrada = new Scanner (System.in);
		int suma = 1,contador = 0;
		System.out.println("Escribe números a sumar");
		do {
			int num = entrada.nextInt();
			suma +=num;
			contador++;
		}while (suma<=100);
		entrada.close();
		System.out.println("Los números sumados hasta llegar a 100 son:"+contador);
	}
}
