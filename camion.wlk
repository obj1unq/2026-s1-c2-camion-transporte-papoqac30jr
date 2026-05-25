import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}

	method suPesoEsPar() {
		return self.sumaDePesos().even()
	}

	method sumaDePesos() {
		return cosas.sum({cosa => cosa.peso()})
	}
}
