package Ejercicios;
import java.util.Scanner;

public class Ejercicio_18 {
	public static void main(String[]Args) {
		 Scanner entrada = new Scanner (System.in);
		 int num;
		 System.out.println("Escribe un número");
	     	num=entrada.nextInt();
	     	if(num%2==0 && num>=2) {
	     		System.out.println("El número par introducido es:"+num);
	     	}
	     	else System.out.println("ERROR.El número es impar o menor a 2");
	     	
entrada.close();
}
}
