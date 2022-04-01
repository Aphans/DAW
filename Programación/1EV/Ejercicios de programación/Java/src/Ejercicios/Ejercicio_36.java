package Ejercicios;
import java.util.Scanner;
public class Ejercicio_36 {
	public static void main(String[] args) {
		Scanner entrada = new Scanner(System.in);
		System.out.print("Introducza un número: ");
		int num1 = entrada.nextInt();
		System.out.print("Introducza otro número: ");
		int num2 = entrada.nextInt();
		if (num1 < num2) {
			
			for(int contador=num1; contador<=num2; contador++) {
				System.out.print(contador+" ");
			}
		}
		else if (num1 > num2) {
			for(int contador=num1; contador>=num2; contador--) {
				System.out.print(contador+" ");
			}
		}
		else
			System.out.println("Los números son iguales");
		
		entrada.close();
	}
}
