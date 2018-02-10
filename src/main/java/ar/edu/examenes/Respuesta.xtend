package ar.edu.examenes

import java.util.List

class Respuesta {
	
	Object valor
	
	/** El valor solo puede ingresarse al generar la respuestas */
	new(Object v) {
		valor = v
	}
	
	def valor() {
		valor
	}
	
	def List<Object> respuestas() {
		#[valor]
	}
	
}