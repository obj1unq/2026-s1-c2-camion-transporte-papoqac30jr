import cosas.*

object camion {
	const property cosas = #{}
	const property tara = 1000
	const capacidadMaxima = 2500
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}

	method elPesoDeLasCosasEsPar() {
		return self.sumaDePesoEnElCamion().even()
	}

	method sumaDePesoEnElCamion() {
		return cosas.sum({cosa => cosa.peso()})
	}

	method tieneAlgoQuePesa(kilos) {
		return cosas.any({cosa => cosa.peso() == kilos})
	}

	method estaExcedidoDePeso() {
		return self.tara() + self.sumaDePesoEnElCamion() > capacidadMaxima 
	}

	method elQueTieneNivelDePeligrosidadDe(peligrosidad) {
		return cosas.find({cosa => cosa.nivelPeligrosidad() == peligrosidad})
	}

	method cosasQueSuperanEsteNivelDePeligrosidad(peligrosidad) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > peligrosidad})
	}

	method cosasQueSuperaAOtraEnPeligrosidad(cosa) {
		return self.cosasQueSuperanEsteNivelDePeligrosidad(cosa.nivelPeligrosidad())
	}

	method puedeCircularEnRutaDeNivel(peligrosidad) {
		return not(self.estaExcedidoDePeso()) and self.cosasQueSuperanEsteNivelDePeligrosidad(peligrosidad).size() == 0
	}

	method tieneAlgoQuePesaEntre(min , max) {
		return cosas.any({cosa => cosa.peso().between(min, max)})
	}

	method laCosaMasPesada() {
		return cosas.max({cosa => cosa.peso()})
	}

	method pesosDeLasCosasEnElCamion() {
		return self.pesoDeLasCosas(cosas.asList())
	}

	method pesoDeLasCosas(objectos) {
		return objectos.map({cosa => cosa.peso()})
	} 

	method totalBultos() {
		return cosas.sum({cosa => cosa.bulto()})
	}
}
