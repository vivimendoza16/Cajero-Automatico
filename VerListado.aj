import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import ejemplo.cajero.Cajero;
import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComandoConsignar;
import ejemplo.cajero.control.ComandoLista;

public aspect VerListado {
	pointcut lista() : call ( * ejemplo.cajero.Cajero.retornaComandoSeleccionado(..));

		@SuppressWarnings("resource")
		BufferedWriter Write = null;
		
		after() : lista() {
			
			LocalDateTime locaDate = LocalDateTime.now();
			int hours  = locaDate.getHour();
			int minutes = locaDate.getMinute();
			boolean fin=false;
			//if (hours>=9  && minutes== 00) {
			
			String opcion = thisJoinPoint.getArgs()[1].toString();//corresponde al valor digitado por el usuario
			@SuppressWarnings("unchecked")
			List<Comando> seleccion = (List<Comando>) thisJoinPoint.getArgs()[0];//corresponde al menu.		
			
			if (Write == null)
			try {
				Write = new BufferedWriter(new FileWriter("src/lista.txt"));
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		
		try {
			String operacion = seleccion.get(Integer.parseInt(opcion)).getNombre();
			if(operacion != "Listar Operaciones") {
			Write.write(operacion);
			Write.newLine();
			Write.flush();
			}
		} catch (Exception e) {
			// si hay una excepción, muestra el mensaje
			System.err.println(e.getMessage());
		}
		//	}
	//System.out.println("El listado se verá a partir de las 18:00");
}
}