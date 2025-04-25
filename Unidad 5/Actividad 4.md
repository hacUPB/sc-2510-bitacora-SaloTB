# Reto

## Codigo - prueba 1
OffApp.cpp
#include "ofApp.h"

    void ofApp::setup() {
        for (int i = 0; i < 100; ++i) {
            ofVec2f pos(ofRandomWidth(), ofRandomHeight());
            ofColor col(ofRandom(255), ofRandom(255), ofRandom(255));
            particles.emplace_back(pos, col);
        }
    }
    
    void ofApp::update() {
        for (auto& p : particles) {
            p.update();
        }
    }
    
    void ofApp::draw() {
        for (const auto& p : particles) {
            p.draw();
        }
    }

Offapp.h

    #pragma once
    #include "ofMain.h"
    
    class CircleParticle {
    private:
        ofVec2f position;
        ofColor color;
    
    public:
        CircleParticle(const ofVec2f& pos, const ofColor& col)
            : position(pos), color(col) {}
    
        void update() {
            position.x += ofRandom(-1, 1);
            position.y += ofRandom(-1, 1);
        }
    
        void draw() const {
            ofSetColor(color);
            ofDrawCircle(position, 5);
        }
    };
    
    class ofApp : public ofBaseApp {
    private:
        std::vector<CircleParticle> particles;
    
    public:
        void setup();
        void update();
        void draw();
    };


![image](https://github.com/user-attachments/assets/62dac95b-d6d5-4b8c-89d4-7f2996e1b104)
Este codigo es sencllo y tiene el proposito de establecer una base ya funcional para porsteriormente poner en practica lo ya aprendido en esta unidad, lo unicoq ue me parceio mas facil de agregar la incio de todo antes de crear metodos y calses mas complejas fue el encapsulamiento de las variables que ya esta aplicado. Aun no hay herencia ni polimorfismo aplicado pues me parecio mas facil aplicarlos tras una base ya establecida. 

La idea dle codigo es simple, se crean varios circulos o particulas (En este caso 10) de colores aleatorios que se mueven como temblando  

## codigo - prueba 2
OffApp.cpp

    #include "ofApp.h"
    
    void ofApp::setup() {
        for (int i = 0; i < 100; ++i) {
            ofVec2f pos(ofRandomWidth(), ofRandomHeight());
            ofColor col(ofRandom(255), ofRandom(255), ofRandom(255));
            particles.emplace_back(pos, col);
        }
    }
    
    void ofApp::update() {
        for (auto& p : particles) {
            p.update();
        }
    }
    
    void ofApp::draw() {
        for (auto& p : particles) {
            p.draw();
        }
    }

    
Offapp.h

    #pragma once
    #include "ofMain.h"
    
    class Particle {
    public:
        ofVec2f position;
        ofColor color;
    
        Particle(ofVec2f pos, ofColor col)
            : position(pos), color(col) {}
    
        void update() {
            position += ofVec2f(ofRandom(-1, 1), ofRandom(-1, 1));
        }
    
        void draw() {
            ofSetColor(color);
            ofDrawCircle(position, 5);
        }
    };
    
    class ofApp : public ofBaseApp {
    public:
        std::vector<Particle> particles;
    
        void setup();
        void update();
        void draw();
    };


![image](https://github.com/user-attachments/assets/002abaaf-33e7-4ab3-b5c9-63c6753d39ad)

Este codigo hace lo mismo que el anterior, es solo una prueba mejorada con mas caracteristicas aplicadas a la teoria aprendida de oop como: 

1.Una clase base Particle con metodos virtuales update() y draw().
2.Una clase derivada CircleParticle que sobrescribe los metodos
3.Vectores con punteros polimorficos (Particle*).
4.Objetos que tienen su posicion (ofVec2f) y color (ofColor)
5. Tiene encapsulamiento en la posicion y en el color que etsan protegidos 
6. tiene herencia aplicada en CircleParticle que hereda de Particle
7. ademas se utiliza polimorfismo y vtables cuando se llama a update() y draw() 
8. finlmente cada objeto incluye un puntero a su vtable, mas los datos heredados




