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
}
