import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.time.LocalDateTime;

import ejemplo.cajero.control.Comando;

public aspect Auditoria {
	// TODO Auto-generated aspect
	pointcut logAuditoria() : call ( * ejemplo.cajero.Cajero.retornaComandoSeleccionado(..));

	@SuppressWarnings("resource")
	BufferedWriter Write = null;
	
	after() : logAuditoria() {
		
		String opcion = thisJoinPoint.getArgs()[1].toString();//corresponde al valor digitado por el usuario
		@SuppressWarnings("unchecked")
		LocalDateTime fechaActual = LocalDateTime.now();
		List<Comando> seleccion = (List<Comando>) thisJoinPoint.getArgs()[0];//corresponde al menu.		
	if (Write == null)
		try {
			Write = new BufferedWriter(new FileWriter("src/logAuditoria.txt"));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	
	try {
		String operacion = seleccion.get(Integer.parseInt(opcion)).getNombre();
		if(operacion != "Listar Operaciones") {
		Write.write("Fecha de operación:"+fechaActual+" Operación: "+operacion);
		Write.newLine();
		Write.flush();
		}
	} catch (Exception e) {
		// si hay una excepción, muestra el mensaje
		System.err.println(e.getMessage());
	}
	}
}