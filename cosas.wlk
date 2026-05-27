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
	var property cantidadDeLadrillos = 1
	method peso() {
		return 2 * cantidadDeLadrillos
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

object contenedorPortuario {
	const property pesoContenedor = 100
	const property cosasDentro = []

	method meter(cosa) {
		cosasDentro.add(cosa)
	}

	method peso() {
		return pesoContenedor + self.pesoDeLasCosasAdentro()
	}

	method pesoDeLasCosasAdentro() {
		return cosasDentro.sum({cosa => cosa.peso()})
	}

	method nivelPeligrosidad() {
		return self.cosaMasPeligrosaDentro()
	}

	method cosaMasPeligrosaDentro() {
		return if (cosasDentro.size() == 0) {
			0
		} else {
			self.nivelPeligrosidadDe(cosasDentro).max()
		}
	}

	method nivelPeligrosidadDe(cosas) {
		return cosas.map({cosa => cosa.nivelPeligrosidad()})
	}
}

object embalajeDeSeguridad {
	var property encubre = arenaGranel
	method peso() {
		return encubre.peso()
	}

	method nivelPeligrosidad() {
		return encubre.nivelPeligrosidad() / 2
	}
}