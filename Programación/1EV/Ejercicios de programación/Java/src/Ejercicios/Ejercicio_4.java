package Ejercicios;
import java.util.Scanner;
public class Ejercicio_4 {
	//Definition input
	public static void main(String[]args)
	{
		Scanner entrada = new Scanner(System.in);
		System.out.println("Escribe dos n�meros para realizar la comparaci�n");
		//Read user
		int num1=entrada.nextInt();
		int num2=entrada.nextInt();
		{
			//Operations
			if(num1==num2) {
				System.out.println("Los n�meros son iguales");
			}
			else System.out.println("Los n�meros no son iguales");
		}
		entrada.close();
	}
}