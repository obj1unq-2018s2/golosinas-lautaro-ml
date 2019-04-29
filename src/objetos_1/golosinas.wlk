object bombon {
	var peso = 15
	
	method precio()      { return 5 }
	method peso()        { return peso }
	method mordisco()    { peso = peso * 0.8 - 1 }
	method gusto()       { return "frutilla" }
	method libreGluten() { return true }
}

object alfajor {
	var peso = 300
	
	method precio()      { return 12 }
	method peso()        { return peso }
	method mordisco()    { peso = peso * 0.8 }
	method gusto()       { return "chocolate" }
	method libreGluten() { return false }
}

object caramelo {
	var peso = 5
	
	method precio()      { return 1 }
	method peso()        { return peso }
	method mordisco()    { peso = peso - 1 }
	method gusto()       { return "frutilla" }
	method libreGluten() { return true }
}

object chupetin {
	var peso = 7
	
	method precio()      { return 2 }
	method peso()        { return peso }
	method mordisco()    { peso = 2.max(peso * 0.9) }
	method gusto()       { return "naranja" }
	method libreGluten() { return true }
}

object oblea {
	var peso = 250
	
	method precio()      { return 5 }
	method peso()        { return peso }
	method mordisco() { 
		if(peso >= 70) { peso = peso * 0.5 }
		else { peso = peso * 0.75 }
	}
	method gusto()       { return "vainilla" }
	method libreGluten() { return false }
}

object chocolatin {
	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	var pesoInicial
	var pesoActual
	
	method precio()      { return 0.5 * pesoInicial }
	method peso()        { return pesoActual }
	method mordisco()    { pesoActual = pesoActual - 2 }
	method gusto()       { return "chocolate" }
	method libreGluten() { return false }
	
	/* al principio, el peso actual coincide con el inicial */
	method pesoInicial(cuanto) { 
		pesoInicial = cuanto
		pesoActual = cuanto
	}
}

object golosinaBaniada {
	var golosinaInterior
	var pesoBanio = 4
	
	method baniaA(g)     { golosinaInterior = g }
	method precio()      { return golosinaInterior.precio() + 2 }
	method peso()        { return golosinaInterior.peso() + 4 }
	method mordisco() {
		golosinaInterior.mordisco()
		if (pesoBanio > 0) { pesoBanio -= 2 }
		// otra forma de hacer la cuenta: pesoBanio = (pesoBanio - 2).max(0) 
	}	
	method gusto()       { return golosinaInterior.gusto() }
	method libreGluten() { return golosinaInterior.libreGluten() }	
}

object tuttifrutti {
	var peso = 5
	var gustos = ["frutilla", "chocolate", "naranja"]
	var i = 0
	
	method precio() { 
		return if (self.libreGluten()) { 7 } else { 10 }
	}
	method peso()        { return peso }
	method mordisco() { 
		peso = peso - 1
		if (i==2) { i = 0 } else { i += 1 }
	}
	method gusto() { return gustos.get(i) }
	method libreGluten() { return true }
	method ponerOSacarGluten() { return not self.libreGluten() }
}

