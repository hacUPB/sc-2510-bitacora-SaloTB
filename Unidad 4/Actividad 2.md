# Actividad 2 
## Analicis codigo de la pila

### Calse Node 
    class Node {
    public:
        ofVec2f position; // Guarda la posición del nodo
        Node* next; // Apunta al siguiente nodo en la pila
    
        Node(float x, float y) {
            position.set(x, y);
            next = nullptr;
        }
    };
### Clase Stack (push, pop, clear)

    class Stack {
    public:
        Node* top; // Apunta al ultimo nodo agregado
    
        Stack() { top = nullptr; } // Inicializa la pila vacia
    
        ~Stack() { clear(); } // Destructor que limpia la pila
    
        void push(float x, float y) {
            Node* newNode = new Node(x, y);
            newNode->next = top;
            top = newNode;
        }
    
        void pop() {
            if (top != nullptr) {
                Node* temp = top;
                top = top->next;
                delete temp;  // Liberar memoria del nodo eliminado
            }
        }
    
        void clear() {
            while (top != nullptr) {
                pop();
            }
        }
    
        void display() {
            Node* current = top;
            while (current != nullptr) {
                ofDrawCircle(current->position.x, current->position.y, 20);
                current = current->next;
            }
        }
    };

push(x, y): Crea un nodo y lo pone en la cima de la pila

pop(): Quita el nodo de la cima y libera su memoria

clear(): Borra toda la pila

display(): Dibuja los circulos en la pantalla

### KeyPressd 

    void ofApp::keyPressed(int key) {
        if (key == 'a') { 
            circleStack.push(ofGetMouseX(), ofGetMouseY()); // Agrega circulo en la posicion del mouse
        }
        else if (key == 'd') { 
            circleStack.pop(); // Elimina el ultimo circulo agregado
        }
    }


## Preguntas del stack
1. Para la creacion manual de memoria se utiliza un heap que permite crear un nuevo nodo con new y eliminarlo manualmente con delte, lo que permite tener un control total de cuando utilizar y eliminar esta meoria pero al mismo tiempo deja a posibilidad el cometer un error que genere una perdida de rendimeinto del programa
2. Es importante proque si no se elimina este ndoo seguira ocupando espacio lo que afectara graveemnete el rendimeinto dle prograna
3. Las principales diferencias radican en que el STL (std::stack) es mas limitado pero da ventajas que le manual impone como su facil uso y le ehhco de que no utiliza punteros
4. El stack sigue una estructura LIFO (Last In, First Out) loq ue significa que le primer elemento que se agrega es el primero en salir, lo que le permite actuar como si se hiciera un Crt+z, eliminando la ultima accion realizada.
5. Para modificar clases de dats mas compleos se me ocurre crear una clase con las acracteristicas que se quieran crear y esta msima podria ser llamada y eliminada con mas libertad durante el codigo

## Analicis codigo de la cola
### Enqueque
Crea elementos 

     void enqueue(float x, float y) {
            Node* newNode = new Node(x, y); // Crear un nuevo nodo
        
            if (rear == nullptr) { // Si la cola esta vacia
                front = rear = newNode; // Ambos apuntan al nuevo nodo
            } 
            else { // Si hay elementos en la cola
                rear->next = newNode; // El ultimo nodo apunta al nuevo nodo
                rear = newNode;       // se actualiza al nuevo nodo
            }
        }

Elimina elementos

    void dequeue() {
        if (front != nullptr) {  // Si la cola no esta vacia
            Node* temp = front;  // Guardamos el nodo que vamos a eliminar
            front = front->next; // Avanzamos el puntero front
    
            if (front == nullptr) { // Si la cola queda vacia, "rear" tambien debe ser nullptr
                rear = nullptr;
            }
    
            delete temp; // se libera la memoria del nodo eliminado
        }
    }

  clear()

      void clear() {
        while (front != nullptr) {
            dequeue(); // Llamamos a dequeue hasta que la cola este vacia
        }
    }


### Key pressed 
    

    void ofApp::keyPressed(int key) {
        if (key == 'a') { // Encolar un nuevo círculo
            circleQueue.enqueue(ofGetMouseX(), ofGetMouseY()); // Agrega circulo en la posicion del mouse
        }
        else if (key == 'd') { // Desencolar el primer círculo
            circleQueue.dequeue();
        }
    }

## Preguntas del queque
1. Al utilizar enqueue se crea un nuevo nodo con new, el cual se ubica al final de la cola (rear) y al usar dequeue, se elimina el nodo al frente (front) con delete. Este proceso es manual al igual que en el stack se deve crear y eliminar por cuenta propia
2. La principal diferencia y loq ue lo hace ligeramente mas dificil de manejar es que en el enqueuqe se manejan dos punteros, a diferencia dle stack donde solo se maneja uno. Estsos punteros siendo front y rear, quienes deben ser catualizados correctamente durante el codigo
3. esta diseñado para procesar elementos en el orden en elq ue llegaron loq ue hace que sea util para sosas como listas o turnos, siempre teneindo en cuenta el primero creado y no el ultimo en cola.
4. Un queue circular funcionaria como un bucle con un array de tamño fijo lo que hace que vuelva al incio, esto ayudnaod al uso de memoria y e procesamiento rapido
5. Podrian aber problemas como fugas de memoria o intentar accerder a memoria liberada.
   
## Diferencia
![image](https://github.com/user-attachments/assets/571a8a05-6797-4442-9c07-80fccdc9f69d)

