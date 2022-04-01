package Ejercicios;
import java.util.Scanner;

public class Ejercicio_52 {
	public static void main (String [] args) {
		Scanner entrada = new Scanner (System.in);
		char caracter ;
		int altura,base,resultado; //Rectángulo
		int lado; //Cuadrado
		do {
			System.out.println("Indique la figura: cuadrado (c) o rectangulo (r)");
			caracter = entrada.next().charAt(0);
			entrada.nextLine();
			switch (caracter) {
			case 'r': 
				System.out.println("Escribe la altura del rectángulo");
				altura = entrada.nextInt();
				System.out.println("Escribe la base del rectángulo");
				base = entrada.nextInt();
				resultado = base*altura;
				System.out.println("El área del rectángulo es:"+resultado);
				break;
			case 'c': 
				System.out.println("Indique el lado del cuadrado");
				lado = entrada.nextInt();
				resultado = lado*lado;
				System.out.println("El área del cuadrado es:"+resultado);
				break;
			default:
				System.out.println("ERROR: uso correcto:"+"\n"+ "r = rectángulo"+"\n"+"c=cuadrado");
			}
		}while (caracter !='r' && caracter !='c');

		entrada.close();

	}
}