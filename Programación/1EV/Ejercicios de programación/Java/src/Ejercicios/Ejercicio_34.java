package Ejercicios;
import java.util.Scanner;

public class Ejercicio_34 {
	public static void main (String [] args) {
		Scanner entrada = new Scanner (System.in);
		int num,multiplicador = 0,resultado;
		System.out.println("Escribe el número para reflejar su tabla de multiplicar");
		num = entrada.nextInt();
		if (num>=0 && num<=10) {
		do{
			multiplicador++;
			resultado = num*multiplicador;
			System.out.println(+num+"x" +multiplicador+":"+resultado);
		}while (multiplicador<10 && multiplicador>0);
		}
		else  {
			System.out.println("Introduce un número comprendido entre 0 y 10 para reflejar su tabla de multiplicar");
entrada.close();
}
}
}