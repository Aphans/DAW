package Ejercicios;
import java.util.Scanner;
public class Ejercicio_11 {
	public static void main(String[]Args) {
	 Scanner entrada = new Scanner (System.in);
	 System.out.println("Escribe tres números:");
     double num1 = entrada.nextDouble();
     double num2 = entrada.nextDouble();
     double num3 = entrada.nextDouble();
     if (num1>num2 && num1>num3) {
    	 System.out.println("El número:"+""+num1+""+"es el más mayor");
     }else if 
    	 (num2>num1 && num2>num3) {
    	 System.out.println("El número:"+""+num2+""+"es el más mayor");
     }
    	 
     else 
    	 System.out.println("El número:"+""+num3+""+"es el más mayor");
     entrada.close(); 
     }

}
