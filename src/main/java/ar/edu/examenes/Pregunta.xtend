package ar.edu.examenes

import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Pregunta {
	String descripcion

	abstract def boolean bienRespondida(ItemExamen itemExamen)
	
	override String toString() {
		"Pregunta: " + descripcion
	}
}

class PreguntaMultipleChoice extends Pregunta {
	Set<Respuesta> respuestasCorrectas

	new() {
		descripcion = ""
		respuestasCorrectas = newHashSet
	}
	
	def agregarRespuestaCorrecta(Respuesta respuestaCorrecta) {
		respuestasCorrectas.add(respuestaCorrecta)
	}	
	
	override boolean bienRespondida(ItemExamen itemExamen) {
		val respondidas = itemExamen.respuestasRespondidas.map [ valor ].toList
		val correctas = respuestasCorrectas.map [ valor ].toList
		correctas.forall( [ respondidas.contains(it) ]) &&
			respondidas.forall( [ correctas.contains(it) ]) 
	}
}

class PreguntaNumerica extends Pregunta {
	@Accessors Respuesta respuesta

	new() {}
		
	new(Respuesta r) {
		respuesta = r
	}
	
	override boolean bienRespondida(ItemExamen itemExamen) {
		respuesta.valor.equals(itemExamen.valor)	
	}
}