package Ejercicios;
import java.util.Scanner;

public class Ejercicio_30{
	public static void main(String[]Args) {
		Scanner entrada = new Scanner (System.in);
		int contadornum=1,npares=0, nimpares=0, nnulos=0;
		final int nummax = 5;
		int num=0;
		System.out.println ("Introduce los números que desees");
		do {
			num= entrada.nextInt();
		if (num%2==0 && num>0) {
			npares++;
			contadornum++;
		}
		else if (num%2!=0 && num>0) {
			nimpares++;
			contadornum++;
		}
		else if (num<0) {
			
			nnulos++;
			contadornum++;
		}
		} while (contadornum<=nummax);{
		System.out.println ("Fin");
		}
		System.out.println ("Los números son pares:"+npares);
		System.out.println ("Los números son nulos:"+nnulos);
		System.out.println ("Los números son impares:"+nimpares);
		entrada.close();
	}
}