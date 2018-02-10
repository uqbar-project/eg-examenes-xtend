package ar.edu.examenes

import java.util.HashSet
import java.util.List
import java.util.Set

abstract class ItemExamen {
	def List<Respuesta> respuestasRespondidas()
	def Object valor()
}

class ItemExamenMultiple extends ItemExamen {
	Set<Respuesta> respuestas = new HashSet
	
	def void agregarRespuesta(Respuesta respuesta) {
		respuestas.add(respuesta)
	}

	override respuestasRespondidas() {
		newArrayList(respuestas)
	}

	override valor() {
		throw new UnsupportedOperationException("Auto-generated function stub")
	}
	
}

class ItemExamenSecuencia extends ItemExamen {
	List<Respuesta> respuestas

	override List<Respuesta> respuestasRespondidas() {
		respuestas
	}
	
	override valor() {
		throw new UnsupportedOperationException("Auto-generated function stub")
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
		throw new UnsupportedOperationException("Auto-generated function stub")
	}
	
}