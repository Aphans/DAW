package Strings;

public class Ejercicio_2 {
	public static void main (String[]Args) {
		String text = "Hola Mundo";
		int contador=0;
		while (contador < text.length())  {
			char caracter = text.charAt(contador);
			contador++;
			System.out.println(caracter);
			
		}
	}

}
