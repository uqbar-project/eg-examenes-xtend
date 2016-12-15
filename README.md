
# Ejercicio de Diseño - Exámenes de aspirantes

<img src="images/examen.jpg" style="width: 50%; height: 50%"/> 

## Dominio
Acme S.A. arma exámenes para evaluar a los aspirantes a ingresar, particularizados para cada aspirante.

Cada examen se compone de un conjunto de preguntas, cada pregunta puede ser:

* **Multiple choice:** varias opciones de las cuales una es la correcta.
* **Secuencia:** varias opciones que el usuario debe ordenar, p.ej. si la pregunta tiene cinco opciones una respuesta posible es a-c-e-d-b. Se acepta como correcta la secuencia inversa a la esperada. P.ej. si la respuesta correcta es a-c-e-d-b, también se acepta b-d-e-c-a (ver nota debajo de todo).
* **Numérica:** el usuario ingresa un número. Por ej. la pregunta podría ser ¿en qué año se fundó YPF? (respuesta: 1922)

A cada pregunta se le asigna un puntaje: para las numéricas, se puede definir que si la respuesta está en un rango que incluye a la correcta se asigna un puntaje menor (en el ejemplo, si la pregunta da 5 puntos, se puede establecer p.ej. que si el usuario respondió entre 1920 y 1925 se le dan 2 puntos). Para cada examen se define el puntaje mínimo para considerarlo aprobado; en algunos exámenes también se pide que haya al menos una cantidad de preguntas correctas, donde dentro de las correctas no se incluyen las aproximadas. 

Dar un modelo de lo que se describió que cumpla con estos requisitos:

* conocer el puntaje que obtuvo un examen.
* saber si un examen está o no aprobado.

## Extensiones

Acme S.A. hace distintas búsquedas, las personas que se presentan como aspirantes eligen a qué búsqueda apuntan (una sola, para simplificar el modelo). Cada búsqueda define cuántos exámenes deben rendir los aspirantes que se anotan en ella. Los exámenes son particulares para cada aspirante, lo único que indica cada búsqueda es qué cantidad de exámenes debe rendir cada aspirante. Una vez que un aspirante rindió la cantidad de exámenes necesaria para una búsqueda, se puede establecer si califica o no. Para algunas búsquedas se pone una cota de puntaje total obtenido en los exámenes, sin importar para cada uno si lo aprobó o no; p.ej. se dice que para calificar un aspirante tiene que haber obtenido, en total, al menos 420 puntos.

Para las otras, se pone una cota de cantidad de exámenes aprobados; p.ej. se dice que para calificar un aspirante tiene que aprobar 3 exámenes de los 5 que hay que rendir para la búsqueda.

Se pide:

* registrar la inscripción de un aspirante, donde el objeto que representa al aspirante ya está armado.
* registrar que un aspirante rindió un examen, donde el objeto que representa al examen ya está armado.
* saber, para una búsqueda, los aspirantes que todavía no se pueden evaluar, por no haber rendido la cantidad de exámenes requerida.
* obtener el ranking de aspirantes que califican para una búsqueda, ordenados por el puntaje total que obtuvieron. Recordar que para calificar es necesario haber rendido la cantidad de exámenes requerida por la búsqueda.
* obtener, para una búsqueda, la colección del total de los puntajes obtenidos por cada aspirante. Se espera como resultado una colección de números.

## Conceptos a ver

* Interfaz y clases Xtend
* Testeo unitario


