package Ejercicios;
import java.util.Scanner;

public class Ejercicio_5 {
	public static void main (String[]args) {
		Scanner entrada = new Scanner(System.in);
		double salario=0;
		double horasExtra=0;
		System.out.println("Indique las horas del trabajador trabajadas en una semana");
		double horas=entrada.nextDouble();
		//Conditionals
		if(horas<35) {
			horas=15*horas;
		}
		else 
			//Operations
			horasExtra=22*horas;
		salario=(horas+horasExtra)*7;
		System.out.println("El salario del empleado es:"+salario);
		entrada.close();
	}
}
