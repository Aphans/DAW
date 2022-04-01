package Ejercicios;

import java.util.Scanner;

public class Ejercicio_39 {
	public static void main (String [] args) {
		Scanner entrada = new Scanner (System.in);
		int num, cantRestos=0;
		System.out.println ("Introduce un número:");
		num = entrada.nextInt();
		for (int i = 1; i <=num; i++) {
			if (num%i==0)
				cantRestos++;
			}
		if (cantRestos==2) {
			System.out.println("El número es primo");
		} else  {
			System.out.println("El número no es primo");
		}
		entrada.close();
		}
	}