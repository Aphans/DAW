package Ejercicios;
import java.util.Scanner;
public class Ejercicio_31 {

	public static void main (String [] args) {
		final int alumno = 10;
		Scanner entrada = new Scanner (System.in);
		int suma = 0;
		System.out.println("Escribe las notas");
		for (int contador = 1; contador <= alumno; contador++) {
			System.out.print ("Nota del alumno"+contador+":");
			double nota = entrada.nextDouble ();
			if (nota>=5) {
				suma++;
			}
		}
			System.out.println ("Los alumnos aprobados son:"+suma);
		entrada.close();
}
}