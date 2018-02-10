package ar.edu.examenes

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestRespuestaNumerica {
	
	PreguntaNumerica nacimientoYPF
	PreguntaMultipleChoice cargosCafiero
	ItemExamenMultiple respuestaCafiero
	ItemExamenMultiple respuestaMalCafiero
	ItemExamenMultiple respuestaMalCafiero2
	
	@Before
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
	def responderAnioNacimientoYPFOk() {
		Assert.assertTrue("No es correcta la respuesta " + nacimientoYPF, nacimientoYPF.bienRespondida(new ItemExamenSimple(1922)))
	}

	@Test
	def responderAnioNacimientoYPFIncorrecta() {
		Assert.assertFalse("No es correcta la respuesta para " + nacimientoYPF, nacimientoYPF.bienRespondida(new ItemExamenSimple(1923)))
	}
	
	@Test
	def responderCargosCafiero() {
		Assert.assertTrue("No es correcta la respuesta para " + cargosCafiero, cargosCafiero.bienRespondida(respuestaCafiero))
	}

	@Test
	def responderCargosCafieroMalDeMenos() {
		Assert.assertFalse("No es correcta la respuesta para " + cargosCafiero, cargosCafiero.bienRespondida(respuestaMalCafiero))
	}

	@Test
	def responderCargosCafieroMalDeMas() {
		Assert.assertFalse("No es correcta la respuesta para " + cargosCafiero, cargosCafiero.bienRespondida(respuestaMalCafiero2))
	}

}