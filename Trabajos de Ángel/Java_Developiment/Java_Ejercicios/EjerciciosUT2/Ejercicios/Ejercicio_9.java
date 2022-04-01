package Ejercicios;
import java.util.Scanner;

public class Ejercicio_9 {
    public static void main(String[]Args) {
        Scanner entrada = new Scanner (System.in);
        System.out.println("Introduce dos números a comparar");
        double num1 = entrada.nextDouble();
        double num2 = entrada.nextDouble();
        if (num1>num2) {
            System.out.println("El primer número introducido es el mayor");
        } else if (num1<num2){
            System.out.println("El segundo número introducido es el mayor");
        }
        else System.out.println("Los números son iguales");
        entrada.close(); }

}
