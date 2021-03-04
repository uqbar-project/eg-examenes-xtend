package ar.edu.examenes

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertFalse
import static org.junit.jupiter.api.Assertions.assertTrue

@DisplayName("Dada una lista de preguntas")
class TestPregunta {

	PreguntaNumerica preguntaNumerica
	PreguntaMultipleChoice preguntaMultipleChoice
	ItemExamenMultiple respuestaCorrecta
	ItemExamenMultiple respuestaIncorrecta
	ItemExamenMultiple respuestaIncorrecta2

	@BeforeEach
	def void init() {
		preguntaNumerica = new PreguntaNumerica => [
			descripcion = "¿En qué año se originó YPF?"
			respuesta = new Respuesta(1922)
		]

		preguntaMultipleChoice = new PreguntaMultipleChoice => [
			descripcion = "¿Cuáles de los siguientes puestos ocupó Antonio Cafiero en el gobierno?"
			agregarRespuestaCorrecta(new Respuesta("a"))
			agregarRespuestaCorrecta(new Respuesta("c"))
			agregarRespuestaCorrecta(new Respuesta("d"))
		]

		respuestaCorrecta = new ItemExamenMultiple => [
			agregarRespuesta(new Respuesta("a"))
			agregarRespuesta(new Respuesta("c"))
			agregarRespuesta(new Respuesta("d"))
		]

		respuestaIncorrecta = new ItemExamenMultiple => [
			agregarRespuesta(new Respuesta("a"))
			agregarRespuesta(new Respuesta("d"))
		]

		respuestaIncorrecta2 = new ItemExamenMultiple => [
			agregarRespuesta(new Respuesta("a"))
			agregarRespuesta(new Respuesta("b"))
			agregarRespuesta(new Respuesta("c"))
			agregarRespuesta(new Respuesta("d"))
		]

	}

	@Test
	@DisplayName("Al responder el valor esperado la respuesta es considerada correcta")
	def preguntaNumericaConValorCorrecto() {
		assertTrue(preguntaNumerica.bienRespondida(new ItemExamenSimple(1922)))
	}

	@Test
	@DisplayName("Al responder un valor distinto al esperado la respuesta no es considerada correcta")
	def preguntaNumericaConValorIncorrecto() {
		assertFalse(preguntaNumerica.bienRespondida(new ItemExamenSimple(1923)))
	}

	@Test
	@DisplayName("Al responder con todos los valores esperados la respuesta es considerada correcta")
	def preguntaMultipleChoiceConValoresCorrectos() {
		assertTrue(preguntaMultipleChoice.bienRespondida(respuestaCorrecta))
	}

	@Test
	@DisplayName("Al responder solo con algunos de los valores esperados la respuesta no es considerada correcta")
	def preguntaMultipleChoiceConValoresCorrectosDeMenos() {
		assertFalse(preguntaMultipleChoice.bienRespondida(respuestaIncorrecta))
	}

	@Test
	@DisplayName("Al responder todos los valores esperados junto a valores incorrectos la respuesta no es considerada correcta")
	def preguntaMultipleChoiceConValoresCorrectosDeMas() {
		assertFalse(preguntaMultipleChoice.bienRespondida(respuestaIncorrecta2))
	}

}
