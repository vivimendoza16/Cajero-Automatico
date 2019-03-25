import ejemplo.cajero.modelo.Cuenta;

public aspect SaldoReducido {
	// TODO Auto-generated aspect
	pointcut minsaldo() : call ( * ejemplo.cajero.modelo.Cuenta.retirar(..)throws *..*Exception*);
	
	void around() throws Exception: minsaldo(){
		Cuenta retiro=(Cuenta)thisJoinPoint.getTarget();
		Long saldo = retiro.getSaldo();
		long valor = Long.parseLong(thisJoinPoint.getArgs()[0].toString());
	
		long cantidad = saldo-valor;
	
		if (cantidad < 200000) {	

			throw new Exception("No se puede retirar, la cuenta se encuentra en el saldo mínimo");

		}
		proceed();
		
		
	
	}
		
	}
