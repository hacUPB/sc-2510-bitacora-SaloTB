# Reto

## OffApp.h

       #pragma once
    #include "ofMain.h"
    
    // Clase que representa un nodo de la lista enlazada
    class Node {
    public:
        float x, y;        // Pocicion del circulo
        Node* next;        // Puntero al siguiente nodo
    
        // Constructor del nodo
        Node(float _x, float _y) {
            x = _x;
            y = _y;
            next = nullptr;
        }
    
        // Destructor del nodo
        ~Node() {}
    };
    
    // Clase de la aplicación principal
    class ofApp : public ofBaseApp {
    public:
        void setup();
        void update();
        void draw();
        void keyPressed(int key);
    
    private:
        Node* front = nullptr;   // Primer nodo (cabeza de la cola)
        Node* rear = nullptr;    // ultimo nodo (cola)
    
        void enqueue(float x, float y); // Agrega un nodo al final
        void dequeue();                // Elimina un nodo del inicio
        void clear();                  // limpia toda la memoria
    };

## OffApp.Cpp

    #include "ofApp.h"
    
    void ofApp::setup() {
        ofBackground(0); // Fondo negro
    }
    
    void ofApp::update() {

    }
    
    void ofApp::draw() {
    
        // se recorre la lista y se dibuja cada nodo (circulo)
        Node* current = front;
        while (current != nullptr) {
        ofSetColor(ofRandom(50, 255), ofRandom(50, 255), ofRandom(50, 255)); //Color aleatorio
        ofDrawCircle(current->x, current->y, 20);
            current = current->next;
        }
    }
    
    // Funsiones al presionar la tecla "a" o "d"
    void ofApp::keyPressed(int key) {
        if (key == 'a') {
            // Interaccion con usuario, agrega un nodo
            enqueue(ofGetMouseX(), ofGetMouseY());
        } else if (key == 'd') {
            // Interaccion con usuario, elimina el primer nodo
            dequeue();
        }
    }
    
    // Agrega un nuevo nodo al final de la lista (cola)
    void ofApp::enqueue(float x, float y) {
        Node* newNode = new Node(x, y); // se crea un nuevo nodo 
    
        if (rear == nullptr) {
            // Si la cola está vacía
            front = rear = newNode;
        } else {
            rear->next = newNode; // se concecta el nuevo nodo al final
            rear = newNode;       // Se marca como el nuevo final
        }
    }
    
    // Elimina el primer nodo y libera su memoria
    void ofApp::dequeue() {
        if (front != nullptr) {
            Node* temp = front;         // Guarda el nodo a eliminar
            front = front->next;        // se mueve el inicio al siguiente nodo
    
            if (front == nullptr) {
                rear = nullptr;         // Si la lista quedo vacia, "rear" tambien es "null"
            }
    
            delete temp; // liberacion de memoria (heap)
        }
    }
    
    // Borra todos los nodos de la lista y libera su memoria
    void ofApp::clear() {
        while (front != nullptr) {
            dequeue(); 
        }
    }

  El programa crea circulos que cambian constantemente de color sobre un fondo negro, si se oprime la tecla "a" aparecera un nuevo cirulo
  y si se oprime la tecla "d" desaparecera el primer circulo creado. (Se uitiza queque, cola)

  ![image](https://github.com/user-attachments/assets/d38a8a24-909b-4c43-a0d3-4109f4850fb4)


