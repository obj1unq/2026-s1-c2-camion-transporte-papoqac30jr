object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object arenaGranel {
	var property peso = 0

	method nivelPeligrosidad() { return 1 }
}

object bumblebee {
	var estaTranformado = true
	method peso() { 
		return 800 
	}
	
	method nivelPeligrosidad() {
		return if (estaTranformado) {
			15
		} else {
			30
		}
	}
}

object paqueteLadrillos {
	method peso() {
		return 2
	}

	method nivelPeligrosidad() {
		return 2
	}
}

object bateriaAntiaérea {
	var estaConLosMisiles = true
	method peso() {
		return 300
	}

	method nivelPeligrosidad() {
		return if(estaConLosMisiles) {
			100
		} else {
			0
		}
	}
}

object residuosRadioactivos {
	var peso = 0
	method peso() {
		return peso
	}

	method nivelPeligrosidad() {
		return 200
	}
}