package ar.edu.examenes

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertFalse
import static org.junit.jupiter.api.Assertions.assertTrue

class TestRespuestaNumerica {

	PreguntaNumerica nacimientoYPF
	PreguntaMultipleChoice cargosCafiero
	ItemExamenMultiple respuestaCafiero
	ItemExamenMultiple respuestaMalCafiero
	ItemExamenMultiple respuestaMalCafiero2

	@BeforeEach
	def void init() {
		nacimientoYPF = new PreguntaNumerica => [
			descripcion = "¿En qué año se originó YPF?"
			respuesta = new Respuesta(1922)
		]

		cargosCafiero = new PreguntaMultipleChoice => [
			descripcion = "¿cuáles de los siguientes puestos ocupó Antonio Cafiero en el gobierno?"
			agregarRespuestaCorrecta(new Respuesta("a"))
			agregarRespuestaCorrecta(new Respuesta("c"))
			agregarRespuestaCorrecta(new Respuesta("d"))
		]

		respuestaCafiero = new ItemExamenMultiple => [
			agregarRespuesta(new Respuesta("a"))
			agregarRespuesta(new Respuesta("c"))
			agregarRespuesta(new Respuesta("d"))
		]

		respuestaMalCafiero = new ItemExamenMultiple => [
			agregarRespuesta(new Respuesta("a"))
			agregarRespuesta(new Respuesta("d"))
		]

		respuestaMalCafiero2 = new ItemExamenMultiple => [
			agregarRespuesta(new Respuesta("a"))
			agregarRespuesta(new Respuesta("b"))
			agregarRespuesta(new Respuesta("c"))
			agregarRespuesta(new Respuesta("d"))
		]

	}

	@Test
	@DisplayName("'1922' es la respuesta la respuesta correcta a 'Nacimiento YPF'")
	def responderAnioNacimientoYPFOk() {
		assertTrue(nacimientoYPF.bienRespondida(new ItemExamenSimple(1922)))
	}

	@Test
	@DisplayName("'1923' no es la respuesta la respuesta correcta a 'Nacimiento YPF'")
	def responderAnioNacimientoYPFIncorrecta() {
		assertFalse(nacimientoYPF.bienRespondida(new ItemExamenSimple(1923)))
	}

	@Test
	@DisplayName("'a', 'c' y 'd' es la respuesta correcta a 'Cargos Cafiero'")
	def responderCargosCafiero() {
		assertTrue(cargosCafiero.bienRespondida(respuestaCafiero))
	}

	@Test
	@DisplayName("'a' y 'd' no es la respuesta correcta a 'Cargos Cafiero'")
	def responderCargosCafieroMalDeMenos() {
		assertFalse(cargosCafiero.bienRespondida(respuestaMalCafiero))
	}

	@Test
	@DisplayName("'a', 'b', 'c' y 'd' no es la respuesta correcta a 'Cargos Cafiero'")
	def responderCargosCafieroMalDeMas() {
		assertFalse(cargosCafiero.bienRespondida(respuestaMalCafiero2))
	}

}
