package ar.edu.examenes

import java.util.HashSet
import java.util.List
import java.util.Set

abstract class ItemExamen {
	def List<Respuesta> respuestasRespondidas()
	def Object valor() {
		throw new UnsupportedOperationException("No está definido el comportamiento valor()")		
	}
}

class ItemExamenMultiple extends ItemExamen {
	Set<Respuesta> respuestas = new HashSet
	
	def void agregarRespuesta(Respuesta respuesta) {
		respuestas.add(respuesta)
	}

	override respuestasRespondidas() {
		newArrayList(respuestas)
	}
}

class ItemExamenSecuencia extends ItemExamen {
	List<Respuesta> respuestas

	override List<Respuesta> respuestasRespondidas() {
		respuestas
	}
}

class ItemExamenSimple extends ItemExamen {
	Respuesta respuestaContestada
	
	new(Object valor) {
		respuestaContestada = new Respuesta(valor)	
	}
	
	override valor() {
		respuestaContestada.valor
	}

	override respuestasRespondidas() {
		throw new UnsupportedOperationException("No está definido el comportamiento respuestasRespondidas()")
	}
}