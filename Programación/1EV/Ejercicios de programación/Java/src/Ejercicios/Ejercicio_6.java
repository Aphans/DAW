package Ejercicios;
import java.util.Scanner;
public class Ejercicio_6 {
	public static void main (String [] args) {
		Scanner entrada = new Scanner(System.in);
		System.out.println("Introduzca la nota en programaci�n");
		double prog = entrada.nextDouble();
		System.out.println("Introduzca la nota en marcas");
		double marcas= entrada.nextDouble();
		{
		}
		if (prog >= 5) {
			System.out.println("El alumno ha aprobado programaci�n");
		}
		else { System.out.println("El alumno ha suspendido programaci�n");
	}
		if (marcas >= 5) {
			System.out.println("El alumno ha aprobado marcas");
		}
		else { System.out.println("El alumno ha suspendido marcas");
}
		entrada.close();
	}
}