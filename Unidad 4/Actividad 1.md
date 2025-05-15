# Entendimiento de la aplicación
Esta aplicacion genera un conjunto de circulos que van apareciendo y desapareciendo al tiempo que siguen los movimeintos del mause generando la ilucion de una serpiente que se extiende dependiendo de la velocidad con la
que se este moviendo el maus. Y cuando se presiona la tecla "C" se borran todas las esferas que representan la serpiente

Para lograr este efecto se detrmina un nodo que debe de seguir al mause (en "x" y "y")en la seccion de setup(). Luego se genera en update(), otro nodo que regenra cada uno de los nodos para que pasen a estar en la posicion en la que estaba el nodo anterior:
### #1

    void LinkedList::display() {
        Node* current = head;
        while (current != nullptr) {
            ofSetColor(ofColor(255, 0, 0));  // Color rojo
            ofDrawCircle(current->x, current->y, 10);  // Dibuja cada nodo
            current = current->next;  // Avanza al siguiente nodo
        }
    }

Se rrecorre cada nodo utilizando while hasta que llegue al final. (Cada nodo es la esfera roja) 

Para borrar la serpiente serecorre cada nodo y se borra con delte: 
### #2

    void LinkedList::clear() {
        Node* current = head;
        while (current != nullptr) {
            Node* nextNode = current->next;
            delete current;  // Libera la memoria del nodo actual
            current = nextNode;  // Avanza al siguiente nodo
        }
        head = nullptr;
        tail = nullptr;
        size = 0;
    }

## Lista enlazada
La lista enlazada es lo que permite el seguimiento de los nodos, pues esta msima es una estructura de datos en la que los elementos (nodos) estan conectados entre si mediante punteros. Teniendo esto en cuenta se podria decir que una lista enlasada se usa escencialmente cuando: Necesitas inserciones/eliminaciones frecuentes y/o no conoces el tamaño exacto de los datos; mientras que un arreglo se utilizaria mas para cuando necesitas acceso rapido a los elementos y el tamaño es fijo o cambia poco

## Coneccion de los nodos
### #3

    void LinkedList::addNode(float x, float y) {
        Node* newNode = new Node(x, y);  // Crea un nuevo nodo
    
        if (tail != nullptr) {  // Si la lista ya tiene nodos
            tail->next = newNode;  // Conecta el nuevo nodo al final
            tail = newNode;  // Actualiza la cola (ultimo nodo)
        } else {  // Si la lista esta vacia
            head = tail = newNode;  // El nuevo nodo es la cabeza y la cola
        }
        size++;  // Incrementa el tamaño de la lista
    }

En este codigo se puede evidenciar como los nodos en este caso estan conectados entre si mediante punteros (next). Ademas la lista enlazada almacena tanto la direccion (x,y) y un puntero (next). Finalmente para liberar la memoria se utiliza la funcion (clear) 

## Gestion de memoria
### #4

    void LinkedList::addNode(float x, float y) {
        Node* newNode = new Node(x, y);  // Se crea un nuevo nodo en el heap
    
        if (tail != nullptr) {  // Si la lista tiene nodos
            tail->next = newNode;  // Conecta el nuevo nodo al final
            tail = newNode;  // Actualiza la cola
        } else {  // Si la lista está vacía
            head = tail = newNode;
        }
        size++;  // Se incrementa el tamaño de la lista
    }

En este codigo se puede evienciar como new Node(x, y) reserva memoria para el nuevo nodo en el heap; el puntero "tail->next" conecta el nuevo nodo al final y la variable "size" ayuda a llevar un control del numero de nodos. Por otro lado para al eliminacion se utiliza el codigo #2 utilizado anteriormente donde se puede ver como se utiliza un bucle while para recorrer cada nodo y asi eliminarlo correctamente.

## Listas enlasadas y arreglos 
La mayor diferencia es que en el arreglo es necesario el mover los elementos lo que puede causar una demora o una ineficiencia a la hora de correr el programa, mientras que con la lista enlazada mo hay que mover los elementos y simplemente se les ajustan los punteros tanto del nodo anterior como del siguienmte nodo, agilisando el proceso.

## Fugas de memoria y destructor 
El destructor (~LinkedList()) es clave para evitar fugas de memoria porque elimina todos los nodos caundo la lista deja de existir. Cuando un objeto LinkedList es destruido, automaticamente se ejecuta clear(), que recorre y elimina todos los nodos: (Esto tambien se puede ver en el codigo #2)
### #5

    LinkedList::~LinkedList() {
        clear();  // Llama a `clear()` para liberar memoria
    }

## C++ y C#
En C++ es el programador quien tiene la repsonsabilidad de trabajar con la memoria y por ende sus posibles fugas, en cambio en C# se tiene el (GC) o (Garbage collector) quien se encarga de eliminar todo objeto que ya no posea una referencia. Cone sto en cuenta se puede decir que trabajar con C# es mucho mas facil y eficiente para un programador no muy experimentado, mientras C++ conyeva mas responsabilidad a la hora de optimizar el programa, sin emabrgo, esto tambien significa que el programador tiene la capacidad de manipular y ordenar este manejo de memoria como mejor le parezca, y al no estar automatizado evita los errores de eliminacion que podrian presentarse en C#. Otra cosa es que poder acceder directamente a la memoria en C++ da muchas ventajas de manejo de la misma sin emabrgo, tambien posibilita muchos errores como el acceso a memoria invalida y fugas de memoria, lo que hace su tratamiento mas complejo y minucioso. 

## Optimizacion de artegenerativo y Estructura de datos personalizada
Para garantizar que sea eficiente abria que tener varios puntos en cosideracion, entre ellos primero:
Cada vez que se crea un nodo con "new" este tiene que ser eliminado tan pronto ya no sea necesario, para esto usaria un destructor en la lista enlazada que los vaya eliminando con respecto sea necesario

     delete current; // se libera la memoria del nodo actual
     clear(); // se llama a clear para eliminar todos los nodos correctamente

Tambien se debe de tener en cuenta que al eliminar un nodo se debe de actualizar tail (Puntero) correctamente para evitar llamar a referencias de memoria eliminadas. Y finalmente verificaria que no se estubieran recorreindo listas enlazadas de forma inecesaria que pudiera realentizar el programa

## Prueba del programa
    
