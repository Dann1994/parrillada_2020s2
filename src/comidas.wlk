class Comida {
	var property peso = 0
	
	method valoracion()
	
	method esAptoVegetariano() = false

	method esAbundante() = peso > 250
}

class Proboleta inherits Comida {
	const property tieneEspecias = null
	
	override method valoracion() = if (self.esEspecial()) 120 else 80
	
	override method esAptoVegetariano() = not tieneEspecias 
	
	method esEspecial() = self.esAbundante() || tieneEspecias
	
}

class Hamburguesa inherits Comida {
	var property pan = null
	
	override method peso() = 250
	
	override method valoracion() = 60 + pan.valoracion()	
}

class HamburguesaVegetariana inherits Hamburguesa {
	var property legumbre = ""
	
	method valoracionPlus() = (2 * legumbre.size()).min(17)
	
	override method valoracion() = super() + self.valoracionPlus()
	
	override method esAptoVegetariano() = true
}

/**Panes */

object industrial {
	const property valoracion = 0
}

object casero {
	const property valoracion = 20
}

object masaMadre {
	const property valoracion = 45
}
/********************************* */




class Parrillada inherits Comida {
	var property cortes = []
	
	override method peso() = cortes.sum({ c => c.peso() })
	
	method maximaCalidad() = cortes.max({ c => c.calidad() }).calidad()
	
	method cantCortes() = cortes.size()
	
	override method valoracion() = (15 * self.maximaCalidad()) - self.cantCortes().max(0) 
	
	method agregarCortes(lista) = cortes.addAll(lista)
	
}

/**Cortes */

class Corte {
	const property calidad = 0
	const property peso = 0
}





