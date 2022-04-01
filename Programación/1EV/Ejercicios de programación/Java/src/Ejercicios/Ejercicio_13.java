package Ejercicios;
import java.util.Scanner;

public class Ejercicio_13 {
	public static void main (String[]Args) {
		Scanner entrada = new Scanner (System.in);
		double precioTotal, precioRebajado;
		System.out.println("Escribe el precio inicial del producto");
		precioTotal=entrada.nextDouble();
		if (precioTotal>6 && precioTotal<60)
		{
			precioRebajado = precioTotal-0.05;
			System.out.println("El precio del producto con el valor de un 5% rebajado es:"+precioRebajado);
		}
		else if (precioTotal>=60) {
			precioRebajado = precioTotal-0.10;
			System.out.println("El precio del producto con el valor de un 10% rebajado es:"+precioRebajado);
		}
		else
			System.out.println("El producto no tiene rebajas:"+precioTotal);

		entrada.close();
	}
}