# Reto

## codigo
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

Este codigo generea un monton de boltas de colores que se mueven aleatoriamente en la pantalla, todo utilizando los temas vistos en esta unidad como: 

1.Una clase base Particle con metodos virtuales update() y draw().
2.Una clase derivada CircleParticle que sobrescribe los metodos
3.Vectores con punteros polimorficos (Particle*).
4.Objetos que tienen su posicion (ofVec2f) y color (ofColor)
5. Tiene encapsulamiento en la posicion y en el color que etsan protegidos 
6. tiene herencia aplicada en CircleParticle que hereda de Particle
7. ademas se utiliza polimorfismo y vtables cuando se llama a update() y draw() 
8. finlmente cada objeto incluye un puntero a su vtable, mas los datos heredados




