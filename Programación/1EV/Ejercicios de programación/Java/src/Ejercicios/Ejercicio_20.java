package Ejercicios;
import java.util.Scanner;

public class Ejercicio_20{
	public static void main(String[]Args) {
		 Scanner entrada = new Scanner (System.in);
		 System.out.println("Introduce un número positivo para mostrar su cuadrado");
		 int num,cuad;
		 do {
			   num = entrada.nextInt();
			   cuad=num*num;
			   System.out.println(cuad);
			} while( num>=0 );
		 System.out.println("END");
		 entrada.close();
	}
}