object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object arenaGranel {
	var property peso = 0

	method nivelPeligrosidad() { return 1 }
}

object bumblebee {
	var property estado = bumblebeeAuto
	method peso() { 
		return 800 
	}
	
	method nivelPeligrosidad() {
		return estado.nivelPeligrosidad()
	}
}

object bumblebeeAuto {
	method nivelPeligrosidad() {
		return 15
	}
}

object bumblebeeRobot {
	method nivelPeligrosidad() {
		return 30
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

object bateriaAntiaerea {
	var property estado = bateriaAntiaereaVacia
	method peso() {
		return 300
	}

	method nivelPeligrosidad() {
		return estado.nivelPeligrosidad()
	}
}

object bateriaAntiaereaCargada {
	method nivelPeligrosidad() {
		return 100
	}
}

object bateriaAntiaereaVacia {
	method nivelPeligrosidad() {
		return 0
	}
}

object residuosRadioactivos {
	var property peso = 0
	method peso() {
		return peso
	}

	method nivelPeligrosidad() {
		return 200
	}
}