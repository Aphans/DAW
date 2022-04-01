package Ejercicios;
import java.util.Scanner;

public class Ejercicio_27 {
	public static void main(String[]Args) {
		Scanner entrada = new Scanner (System.in);
		int sueldo=0, contador=0,total=0;
		System.out.println("Introduce el sueldo del empleado");
		do {
		sueldo=entrada.nextInt();
		contador++;		
		}while(contador<10);
		if (sueldo<1000) {
		total+=1;
		System.out.println("La cantidad de empleados con sueldos mayor a 1000 euros son:"+total);
		entrada.close();
			}
	}
}