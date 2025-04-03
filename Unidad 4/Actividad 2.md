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


## Pruebas

## Preguntas del stack
1. 

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

## Pruebas

## Preguntas del queque

## Diferencia
![image](https://github.com/user-attachments/assets/571a8a05-6797-4442-9c07-80fccdc9f69d)

