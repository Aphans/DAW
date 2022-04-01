package Objets;

public class Objet_Person {
public static void main (String []Args) {
	Person x = new Person();
	Person y = new Person();
	//values x
	x.nombre="Ángel";
	x.edad=21;
	x.dni="0888383T";
	x.sexo="masculino";
	x.peso=71;
	x.altura=1.89;
	//Values y
	y.nombre = "Pepe";
	System.out.println("El nombre es:"+x.nombre+"\n"+"La edad es:"+x.edad+"\n"+"El dni es:"+x.dni+"\n"+"El sexo es:"+x.sexo+"\n"+"El peso es:"+x.peso+"\n"+"La altura es:"+x.altura);
}
}
