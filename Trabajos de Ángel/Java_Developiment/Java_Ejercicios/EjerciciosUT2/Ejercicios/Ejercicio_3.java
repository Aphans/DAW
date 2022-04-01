package Ejercicios;
import java.util.Scanner;

public class Ejercicio_3{
	public static void main(String[]Args) {
		Scanner entrada = new Scanner(System.in);
		//Declared variables
		double dolars;
		double comisión;
		//Input
		System.out.println("Indique la cantidad de euros a pasar en dolares.Se aplica comisión si se quieren transferir menos de 100 dolares");
		double euros=entrada.nextDouble();
		//Operations
		dolars=euros*0.87;
		if(dolars<100) {
			comisión=dolars-0.98;
			//Output
			System.out.println("La cantidad de euros en dolares es:"+dolars);
		}
		//Enter Close
		entrada.close();

	}
}