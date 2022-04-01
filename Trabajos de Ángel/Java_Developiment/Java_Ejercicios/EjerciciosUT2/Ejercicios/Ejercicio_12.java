package Ejercicios;
import java.util.Scanner;

public class Ejercicio_12{
	public static void main(String[]Args) {
		Scanner entrada = new Scanner (System.in);
		double i,v,dis,d,precioKm,precioTotalKm,precioTotal,precioTotalRebajado;
		precioKm=0.05;
		System.out.println("Introduce el precio del billete de ida");
		i=entrada.nextDouble();
		System.out.println("Introduce el precio del billete de vuelta");
		v=entrada.nextDouble();
		System.out.println("Introduce la distancia a recorrer en Km");
		dis=entrada.nextDouble();
		System.out.println("Introduce los días de estancia");
		d=entrada.nextDouble();
		if(dis<1000 && d<7) {
		precioTotalKm=(dis*precioKm);
		precioTotal=i+v+precioTotalKm;
		System.out.println("El precio total del viaje es:"+precioTotal);
		}
		else if 
		(dis>1000 && d>7) {
			precioTotalKm=(dis*precioKm)-0.3;
			precioTotalRebajado=i+v+precioTotalKm;
			System.out.println("El precio total rebajado del viaje es:"+precioTotalRebajado);
		entrada.close();
	}
	}
}
