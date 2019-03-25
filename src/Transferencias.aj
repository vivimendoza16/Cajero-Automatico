import java.util.List;

import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComandoConsignar;
import ejemplo.cajero.control.ComandoTransferir;

public aspect Transferencias {
	// TODO Auto-generated aspect
	pointcut opciones() : call ( * ejemplo.cajero.Cajero.cargaComandos(..));
		
	after() returning (List<Comando> comandos) :opciones(){
		
				
		comandos.add(new ComandoTransferir());
		for (int i=0; i < comandos.size(); i++) {
			System.out.println(i + ".-" + comandos.get(i).getNombre());

	}
}
}