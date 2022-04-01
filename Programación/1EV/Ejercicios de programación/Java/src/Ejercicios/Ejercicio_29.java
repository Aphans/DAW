package Ejercicios;
import java.util.Scanner;

public class Ejercicio_29{
	public static void main(String[]Args) {
		Scanner entrada = new Scanner (System.in);
		int notas,suspensos=0,aprobados=0,notables=0,sobresalientes=0;
		System.out.println("Introducir las notas de los alumnos");
		do {
			notas=entrada.nextInt();
			if (notas<5 && notas>0) {
				suspensos++;
			}
			else if (notas>=5 && notas<7) {
				aprobados++;
			}
			else if (notas>=7 && notas<8) {
				notables++;
			}
			else if(notas >=8 && notas <=10) {
				sobresalientes++;
			}
			}while(notas>0);{
			System.out.println("FIN");
			}
		System.out.println("Los alumnos supensos son:"+suspensos);
		System.out.println("Los alumnos aprobados son:"+aprobados);
		System.out.println("Los alumnos con nota notable son:"+notables);
		System.out.println("Los alumnos con sobresaliente son:"+sobresalientes);
		entrada.close();
		}
	}
