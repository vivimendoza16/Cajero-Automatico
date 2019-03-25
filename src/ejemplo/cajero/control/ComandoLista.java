package ejemplo.cajero.control;

import java.awt.List;
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;

import ejemplo.cajero.Cajero;
import ejemplo.cajero.modelo.Banco;
import ejemplo.cajero.modelo.Cuenta;

public class ComandoLista implements Comando {
	@Override
	public String getNombre() {
		return "Listar Operaciones";
	}
	@SuppressWarnings("resource")
	@Override
	public void ejecutar(Banco contexto) throws Exception {
		BufferedReader Read=new BufferedReader(new FileReader("src/lista.txt"));
		String Nuevo=Read.readLine();
		while(Nuevo!=null){
            System.out.println(Nuevo);
            Nuevo=Read.readLine();
		}

	}
}
