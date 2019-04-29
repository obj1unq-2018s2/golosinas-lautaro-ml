object mariano {
	// para este objeto no damos pistas
	// definimos algunos métodos para que compile el test
	var golosinas = []
	
	method comprar(golosina)  { golosinas.add(golosina) }

	method desechar(golosina) { golosinas.remove(golosina) }
	
	method probarGolosinas() { 
		return golosinas.foreach( { golosina => golosina.mordisco() } )
	}
	
	method hayGolosinasSinTacc() {
		return golosinas.any( { golosina => golosina.libreGluten() } )
	}
	
	method preciosCuidados() {
		return golosinas.all( { golosina => golosina.precio() <= 10 } )
	}
	
	method golosinaDeSabor(unSabor) {
		return golosinas.find( { golosina => golosina.gusto() == unSabor } )
	}
	
	method golosinasDeSabor(unSabor) {
		return golosinas.filter( { golosina => golosina.gusto() == unSabor } )
	}
	
	method sabores() {
		return golosinas.map( { golosina => golosina.gusto() } ).asSet()
	}
	
	method golosinaMasCara() {
		return golosinas.max( { golosina => golosina.precio() } )
	}
	
	method pesoGolosinas() {
		return golosinas.sum( { golosina => golosina.peso() } )
	}
	
	method golosinasFaltantes(golosinasDeseadas) {
		golosinas.filter( 
			{ golosina => golosinasDeseadas.contains(golosina) }
		)
		return golosinasDeseadas.filter( 
			{ golosina => not golosinas.contains(golosina) }
		)
	}
	
	method gustosFaltantes(gustosDeseados) {
		return gustosDeseados.filter(
			{ gusto => not self.sabores().contains(gusto) }
		)
	}
}