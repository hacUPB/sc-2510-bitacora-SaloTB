# Actividad 7
## ¿Qué sucede cuando presionas la tecla “c”?
Al oprimir la tecla "c" utilizando el codigo sale un mensaje hacerca de la creacion de un objeto y su ubicacion, pero este objeto no se ve en pantalla. Caundo se hace la correccion dada por el profesor este genera el 
mismo etxtop, pero esta vez si muestra la imagen del dibujo nombrado en este caso una esfera. 
## ¿Por qué ocurre esto?
Se crea la variable "localSphere", que es un objeto Sphere, dentro de createObjectInStack(); como es una variable local, su memoria se asigna en la pila (stack), esto significa que solo existirá mientras createObjectInStack() 
esté ejecutándose, lo que implica que cuando este deja de existit, se destruira automaticamente llevando a que la funcion este trtando de acceder a un punto de memoria vacio, lo que genera el problema. En otras palabras el 
problema esta dado porque una funcion local se guardo de forma global. 

localSphere se destruye cuando la funcion termina:

    void ofApp::createObjectInStack() {
        Sphere localSphere(ofRandomWidth(), ofRandomHeight(), 30);  
        globalVector.push_back(&localSphere);  
    }  // Aquí localSphere se destruye automáticamente
Cuando se accede al puntero en draw() o keyPressed(), se obtiene la memoria basura:

      void ofApp::draw() {
      for (Sphere* sphere : globalVector) {  // Aquí accedemos al puntero colgante
          if (sphere != nullptr) {
              ofDrawBitmapString("Stored Object Position: " + ofToString(sphere->x) + ", " + ofToString(sphere->y), 20, 60);
              sphere->draw();  // Esto falla
          }
      }
    }
Se almacena la dirección de localSphere en globalVector:

    globalVector.push_back(&localSphere);  // Guardamos la dirección de localSphere

localSphere se crea en la pila dentro de createObjectInStack():

    void ofApp::createObjectInStack() {
        Sphere localSphere(ofRandomWidth(), ofRandomHeight(), 30);  
    }
