import comidas.*
import comensales.*

object cosina {
	const property comidas = []
	
	method cosinarComidas(lista) { comidas.addAll(lista) }
	
	method nroCarnivoras() = comidas.count({ c => not c.esAptoVegetariano() })
	
	method nroVegetarianas() = comidas.count({ c => c.esAptoVegetariano() })
	
	method tieneBuenaOfertaVegetariana() = 
	  self.nroCarnivoras() - self.nroVegetarianas() <= 2
	  
	method comidasCarnivoras() = comidas.filter({ c => not c.esAptoVegetariano() })
	
	method platoFuerteCarnivoro() = self.comidasCarnivoras().max({ c => c.valoracion() })
	
	method comidasQueLeGuastaA(unComensal) = comidas.filter({ c => unComensal.leAgrada(c) })
	
	method leGustaAlgunaComidaA(unComensal) = comidas.any({ c => unComensal.leAgrada(c) })
	
	method elegirPlatoPara(unComensal) {
		const comida = self.comidasQueLeGuastaA(unComensal).anyOne()
		
		if (self.leGustaAlgunaComidaA(unComensal)) {
			unComensal.comer(comida)
			comidas.remove(comida)
		} else {assert.error("No le gusta ninguna")}
	}
}