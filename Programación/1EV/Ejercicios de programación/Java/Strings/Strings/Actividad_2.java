package Strings;
import java.util.Scanner;

public class Actividad_2 {
	public static void main (String [] args) {
		Scanner entrada = new Scanner (System.in);
		String frase;
		int contador = 0;
		System.out.println("Escribe una frase");
		frase = entrada.nextLine();
		frase.length();
		System.out.println("Escribe la letra de la frase que quieres contar el número que se repite");
		char a = entrada.nextLine().charAt(0);
		System.out.println("El carácter leído es:"+a);
		for (int i = 0;i < frase.length();i++) {
			if(frase.charAt(i) == a){
				contador ++;
			}
		}
		if (contador != 0) {
			System.out.println("El caracter "+a+ " se repite " + contador + " veces");
		}else{
			System.out.println("El caracter no se encuentra en este texto");
		}
		entrada.close();
	}

}