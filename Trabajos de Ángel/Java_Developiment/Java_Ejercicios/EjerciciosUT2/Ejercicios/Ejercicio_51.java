package Ejercicios;
import java.util.Scanner;
public class Ejercicio_51 {
	public static void main(String[] args) {
	    int num=0,multi=0;
	    int resultado =  0;
		Scanner entrada = new Scanner(System.in);
		System.out.println("Escribe n�meros a multiplicar");
		num =entrada.nextInt();
	   multi = entrada.nextInt();
		
		for (int i = 1; i <= multi; i++) {
			
			resultado=resultado+num;
		}
            	
		System.out.println(+resultado);
		entrada.close();
	}
}