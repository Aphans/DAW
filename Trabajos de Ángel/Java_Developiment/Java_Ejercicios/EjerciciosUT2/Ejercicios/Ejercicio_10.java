package Ejercicios;
import java.util.Scanner;
public class Ejercicio_10 {
public static void main(String[]Args) {
	 Scanner entrada = new Scanner (System.in);
	System.out.println("Escribe dos números para ordenarlos");
	int num1 = entrada.nextInt();
    int  num2= entrada.nextInt();
	//Declaración de variables
    int mayor,menor;
	//Condicionales
    {
    if(num1>num2) {
    	mayor=num1;
    	menor=num2;
    }else if(num1<num2) {
    	menor=num1;
    	mayor=num2;
    	System.out.println("Los números ordenados de menor a mayor son:"+"\n"+menor+"\n"+mayor);
    	System.out.println("Los números ordenados de mayor a menor son:"+"\n"+mayor+"\n"+menor);
    }else if (num1==num2) {
    	System.out.print("Los números son iguales:"+"\n"+num1+"\n"+num2);
    }
    
    entrada.close();
}
}
}