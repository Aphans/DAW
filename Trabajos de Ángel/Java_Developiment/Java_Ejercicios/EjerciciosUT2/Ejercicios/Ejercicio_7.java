package Ejercicios;
import java.util.Scanner;
public class Ejercicio_7 {
	public static void main (String [] args) {
		Scanner entrada = new Scanner (System.in);
		System.out.println ("Introduzca la temporatura en grados cent�grados");
		double temp = entrada.nextDouble();
		{
			if (temp>30) {
				System.out.println("La temperatura es adecuada para realizar nataci�n");
			}
			{
				if (20<temp&&temp<=30) {
					System.out.println("La temperatura es adecuada para hacer tenis");
				}
				{
					if (10<temp&&temp<= 20) {
						System.out.println ("La temperatura es adecuada para hacer golf");
					}
					{
						if (5 < temp&&temp <= 10) {
							System.out.println ("La temperatura es adecuada para esquiar");
						}
						{
							if (temp <=5) {
								System.out.println ("La temperatura es adecuada para jugar al parch�s");
							}
							entrada.close();
						}
					}
				}
			}
		}
	}
}