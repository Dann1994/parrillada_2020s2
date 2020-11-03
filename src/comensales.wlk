import comidas.*


class Comensal {
	const property comidas = []
	var property peso = 0
	
	method leAgrada(unaComida)
	
	method comidasPeso() = comidas.sum({ c => c.peso() })
	
	method satisfecho() = self.comidasPeso() >= peso * 0.01
	
	method comer(unaComida) { comidas.add(unaComida) }
}


class Vegetariano inherits Comensal {
	
	override method leAgrada(unaComida) = 
	   unaComida.esAptoVegetariano() && unaComida.valoracion() > 85
	
	override method satisfecho() = super() && not comidas.any({ c => c.esAbundante() })
	
}

class Popular inherits Comensal {
	
	override method leAgrada(unaComida) = unaComida.esAbundante()

}

class PaladarFino inherits Comensal {
	
	override method leAgrada(unaComida) = unaComida.peso().between(150,300) && unaComida.valoracion() > 100
	
	override method satisfecho() = super() && comidas.size().even()
}