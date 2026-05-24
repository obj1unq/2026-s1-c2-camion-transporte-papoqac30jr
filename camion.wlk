import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		if (not(cosas.size() == 1))
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
}
