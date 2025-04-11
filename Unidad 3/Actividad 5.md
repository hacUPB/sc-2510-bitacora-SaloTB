# Actividad 5
## ¿Cuál es la definición de un puntero?
Es una variable que almacena la direccion de memoria de otra variable , no guarda un valor directo si no donde esta almacenado ese valor en la memoria.
## ¿Dónde está el puntero?
El puntero esta en esta parte del codigo de ofApp.h:    

    private:
    
            vector<Sphere*> spheres;
            Sphere* selectedSphere;
## ¿Cómo se inicializa el puntero?
El puntero se incializa: 

    int variable; //Creamos un entero
    int * apuntador = &variable;
## ¿Para qué se está usando el puntero?
El puntero tiene dos usos en este caso, el primero es para darle una direccion de memoria a la clase "sphere" y asi que esta pueda ser utilizada en diferentes funciones con mas facilidad. La segunda es para almacenar una especie
de "array" de ubicaciones (esto es un vector)
## ¿Qué es exactamente lo que está almacenado en el puntero?
En el puntero se estan almacenando las ubicaciones de la clase Sphere 
