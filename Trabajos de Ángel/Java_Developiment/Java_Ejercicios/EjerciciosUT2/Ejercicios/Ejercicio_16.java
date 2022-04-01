package Ejercicios;
import java.util.Scanner;

public class Ejercicio_16 {
	public static void main(String[]Args) {
		 Scanner entrada = new Scanner (System.in);
		 System.out.println("Escribe la nota del alumno");
		 double nota = entrada.nextDouble();
		if (nota<0 || nota>10) {
			System.out.println("Escribe una nota comprendida entre el 0 y el 10");
		}
		else if(nota<5) {
	    	System.out.println("SUSPENSO");
	    }
		else if(nota==5) {
	    	System.out.println("SUFICIENTE");
	    	
	    }
	    else if (nota >5 && nota<7) {
	    	System.out.println("BIEN");
	    }
	    else if (nota>=7 && nota<=8.9) {
	    	System.out.println("NOTABLE");
	    }else if (nota>=9 && nota<=10) {
	    	System.out.println("SOBRESALIENTE");
	   entrada.close();
}
}
}
