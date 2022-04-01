package Ejercicios;
import java.util.Scanner;
public class Ejercicio_8 {
	public static void main (String [] args) {
	Scanner entrada = new Scanner (System.in);	
		System.out.println("Introduzca dos números");
		double num = entrada.nextDouble();
		double num2= entrada.nextDouble();
		double suma = num+num2;
		double resta = num-num2;
		{
			if (num<0&&num2<0)
				System.out.println(resta);
		else {
			System.out.println(suma);
		}
		entrada.close();
	}
}
}