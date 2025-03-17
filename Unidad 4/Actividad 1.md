# Entendimiento de la aplicación
Esta aplicacion genera un conjunto de circulos que van apareciendo y desapareciendo al tiempo que siguen los movimeintos del mause generando la ilucion de una serpiente que se extiende dependiendo de la velocidad con la
que se este moviendo el maus. Y cuando se presiona la tecla "C" se borran todas las esferas que representan la serpiente

Para lograr este efecto se detrmina un nodo que debe de seguir al mause (en "x" y "y")en la seccion de setup(). Luego se genera en update(), otro nodo que regenra cada uno de los nodos para que pasen a estar en la posicion en
la que estaba el nodo anterior 
