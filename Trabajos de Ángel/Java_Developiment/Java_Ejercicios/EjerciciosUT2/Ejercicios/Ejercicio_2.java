package Ejercicios;
import java.util.Scanner;
public class Ejercicio_2 {
	public static void main(String[]args) {
		Scanner entrada = new Scanner(System.in);
		System.out.println("Introduce una cantidad de dinero en dólares");
		double euros=entrada.nextDouble();
		double dolar;
		dolar=euros*0.87;
		System.out.println("La cantidad de dolares en euros es:"+dolar);
		entrada.close();
	}
}