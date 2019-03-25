import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

import ejemplo.cajero.Cajero;
import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComandoConsignar;



public aspect Consignar {
	// TODO Auto-generated aspect
	pointcut opciones() : call ( * ejemplo.cajero.Cajero.cargaComandos(..));
	
	
	after() returning (List<Comando> comandos) :opciones(){
		
		comandos.add(new ComandoConsignar());
		for (int i=0; i < comandos.size(); i++) {
			System.out.println(i + ".-" + comandos.get(i).getNombre());

	}
}
	
}