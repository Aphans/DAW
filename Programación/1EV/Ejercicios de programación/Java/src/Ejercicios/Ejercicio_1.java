package Ejercicios;
import java.util.Scanner;
public class Ejercicio_1 {
	public static void main(String[] args) {
		Scanner entrada = new Scanner(System.in);
		System.out.println("Escribe la nota del alumno");
		double nota = entrada.nextDouble();
		if (nota>=5) {
			System.out.println("El alumno esta aprobado");
		}
		else {
			System.out.println("El alumno esta suspenso");

		}
		entrada.close();
	}
}