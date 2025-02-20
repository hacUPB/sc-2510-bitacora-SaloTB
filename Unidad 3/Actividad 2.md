# Actividad 2 
## ¿Qué fue lo que incluimos en el archivo .h
setup(): Se ejecuta una sola vez al inicio
update(): Se ejecuta en cada frame antes de draw()
draw(): Se encarga de dibujar en la pantalla

Eventos de entrada del mouse:
mouseMoved(int x, int y): Se ejecuta cuando el usuario mueve el mouse.
mousePressed(int x, int y, int button): Se ejecuta cuando el usuario presiona un botón del mouse
Atributos privados:

vector<ofVec2f> particles;: Almacena las posiciones de las partículas (usando ofVec2f, que representa coordenadas en 2D)
ofColor particleColor;: Define el color de las partículas.

## ¿Cómo funciona la aplicación?
El programa funciona siguiendo los siguientes pasos: genera un circulo que sigue el mause dle usuario, ademas este tiene la capcidad de cambiar de color cuando se presiona el mismo mause y ademas tiene un limite de circulos
que siguen el mause y desaparecen despues de cierto punto

## ¿Qué hace la función mouseMoved?
Se agrega una nueva posición (x, y) al vector particle
Si hay más de 100 partículas, se elimina la más antigua (particles.erase(particles.begin()))
Esto crea un efecto donde las últimas 100 posiciones del mouse quedan marcadas con círculos

## ¿Qué hace la función mousePressed?
Se genera un nuevo vector posicion (x,y) que ademas tiene la opcion de button 
Tiene una funcion que permite al orpimir el mause randomizar el cambio del color en un rango der 250

## ¿Qué hace la función setup?
Establece el fondo de la ventana en negro e incia particle color en blanoc (el color del circulo) Esto lo hace una unica vez al incializar el programa

## ¿Qué hace la función update?
En este caso esta parte del codigo no parece estarhcaiendo nada, esta vacio

## ¿Qué hace la función draw?
Esta es la funcion encargada de dibujar el circulo con la funcion particle y ademas es el encargado de poner el color actual del circulo y por supuesto de hacer que los mismos permanezcan en la pántalla hasta cierto punto.
