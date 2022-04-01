package Ejercicios;
import java.util.Scanner;
public class Ejercicio_11 {
	public static void main(String[]Args) {
		Scanner entrada = new Scanner (System.in);
		System.out.println("Escribe tres números:");
		double num1 = entrada.nextDouble();
		double num2 = entrada.nextDouble();
		double num3 = entrada.nextDouble();
		if (num1>num2 && num2>num3) {
			System.out.println("El orden es el siguiente:"+num1+","+num2+","+num3);
		}else if 
		(num1>num3 && num3>num2) {
			System.out.println(num1+","+num3+","+num2);
		}

		else if
		(num2>num1 && num1>num3) {
			System.out.println(num2+","+num1+","+num3);
		}
		else if
		(num2>num3 && num3>num2) {
			System.out.println(num2+","+num3+","+num1);
		}
		else if
		(num3>num2 && num2>num1) {
			System.out.println(num3+","+num2+","+num1);
		}
		else if
		(num3>num1 && num1>num2) {
			System.out.println(num3+","+num1+","+num2);
		}
		entrada.close(); 
	}

}