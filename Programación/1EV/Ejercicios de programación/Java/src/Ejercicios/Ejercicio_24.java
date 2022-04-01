package Ejercicios;
import java.util.Scanner;

public class Ejercicio_24{
	public static void main(String[]Args) {
		Scanner entrada = new Scanner (System.in);
		int N/*Número a compara*/ = 0,num/*Número con el que comparo N*/;
		boolean mayor=false,menor=false;
		do {
			System.out.println("Introduce el número N");
			N=entrada.nextInt();
			System.out.println("Introduce el número para comparar N");
			   num=entrada.nextInt();
			   if(N<num) {
				   System.out.println("Escribe si el número es mayor o menor");
				   mayor=entrada.nextBoolean();
				   mayor=true;
				   
			   }
			   else if(N>num) {
				   System.out.println("Escribe si el número es mayor o menor");
				   menor=entrada.nextBoolean();
				   menor=true;
			   }
			   
			   
			} while(mayor==false || menor==false);
		System.out.println("ERROR");
	
		entrada.close();
	}
}