package Ejercicios;
import java.util.Scanner;

public class Ejercicio_25{
	public static void main(String[]Args) {
		 Scanner entrada = new Scanner (System.in);
		 int num,contador = 0,suma = 0;
		 System.out.println("Introduce números distintos a 0 para realizar su suma");
		 do {
			num=entrada.nextInt();
			suma=suma+num;
			contador++;
			} while(num!=0 && contador<=10);
		 System.out.println("El total de la suma es:"+suma);
		 entrada.close();
	}
}

