object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }

	method bulto() {
		return 1
	}

	method acidentado() {

	}
}

object arenaGranel {
	var property peso = 0
	const property pesoPorAccidente = 20

	method nivelPeligrosidad() { return 1 }

	method bulto() {
		return 1
	}

	method acidentado() {
		peso = peso + pesoPorAccidente
	}
}

object bumblebee {
	var property estado = bumblebeeAuto
	method peso() { 
		return 800 
	}
	
	method nivelPeligrosidad() {
		return estado.nivelPeligrosidad()
	}

	method bulto() {
		return 2
	}

	method acidentado() {
		estado = estado.inverso()
	}
}

object bumblebeeAuto {
	method nivelPeligrosidad() {
		return 15
	}
	
	method inverso() {
		return bumblebeeRobot
	}
}

object bumblebeeRobot {
	method nivelPeligrosidad() {
		return 30
	}

	method inverso() {
		return bumblebeeAuto
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

	method bulto() {
		return if (self.tieneEntreEstaCantidad(1 , 100)) {
			1
		} else {
			self.bultoOtroCaso()
		}
	}

	method tieneEntreEstaCantidad(min , max) {
		return cantidadDeLadrillos.between(min, max)
	}

	method bultoOtroCaso() {
		return if (self.tieneEntreEstaCantidad(101 , 300)) {
			2
		} else {
			3
		}
	}

	method acidentado() {
		if (cantidadDeLadrillos >= 12) {
			cantidadDeLadrillos = cantidadDeLadrillos - 12
		} else {
			cantidadDeLadrillos = 0
		}
	}
}

object bateriaAntiaerea {
	var property estado = bateriaAntiaereaCargada
	method peso() {
		return 300
	}

	method nivelPeligrosidad() {
		return estado.nivelPeligrosidad()
	}

	method bulto() {
		return estado.bulto()
	}

	method acidentado() {
		estado = bateriaAntiaereaVacia
	}
}

object bateriaAntiaereaCargada {
	method nivelPeligrosidad() {
		return 100
	}

	method bulto() {
		return 2
	}
}

object bateriaAntiaereaVacia {
	method nivelPeligrosidad() {
		return 0
	}

	method bulto() {
		return 1
	}
}

object residuosRadioactivos {
	var property peso = 0
	const property pesoPorAcidente = 15
	method peso() {
		return peso
	}

	method nivelPeligrosidad() {
		return 200
	}

	method bulto() {
		return 1
	}

	method acidentado() {
		peso = peso + pesoPorAcidente
	}
}

object contenedorPortuario {
	const property pesoContenedor = 100
	const property cosasDentro = []
	const property bulto = 1

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

	method bulto() {
		return bulto + cosasDentro.sum({cosa => cosa.bulto()})
	}

	method acidentado() {
		cosasDentro.forEach({cosa => cosa.acidentado()})
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

	method bulto() {
		return 2
	}

	method acidentado() {

	}
}