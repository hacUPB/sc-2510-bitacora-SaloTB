# Reto

## codigo - prueba 1
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




Este codigo generea un monton de boltas de colores que se mueven aleatoriamente en la pantalla, todo utilizando los temas vistos en esta unidad como: 

1.Una clase base Particle con metodos virtuales update() y draw().
2.Una clase derivada CircleParticle que sobrescribe los metodos
4.Objetos que tienen su posicion (ofVec2f) y color (ofColor)
5. Tiene encapsulamiento en la posicion y en el color que etsan protegidos 
6. tiene herencia aplicada en CircleParticle que hereda de Particle

Antes de este realice varios intentos teneindo en especial problemas con el metodo/funcion que se encargaria de mover la particula aleatoriamente. 

## Codigo -Prueba 2

Aplicacion de polimorfiso:

Particle.h

    #pragma once
    #include "ofMain.h"
    
    // Clase base con polimorfismo, abstracta
    class Particle {
    protected:
        ofVec2f position;
        ofColor color;
    
    public:
        Particle(ofVec2f pos, ofColor col)
            : position(pos), color(col) {}
    
        virtual void update() = 0;  
        virtual void draw() const = 0;  
        virtual ~Particle() = default; 
    };


cicle particle.h

    #pragma once
    #include "Particle.h"
    
    // Clase derivada 
    class CircleParticle : public Particle {
    public:
        CircleParticle(ofVec2f pos, ofColor col)
            : Particle(pos, col) {}
    
        void update() override {
            position += ofVec2f(ofRandom(-1, 1), ofRandom(-1, 1));
        }
    
        void draw() const override {
            ofSetColor(color);
            ofDrawCircle(position, 5);
        }
    };

OffApp.h

    #pragma once
    #include "ofMain.h"
    #include "CircleParticle.h"
    
    class ofApp : public ofBaseApp {
    public:
        std::vector<std::unique_ptr<Particle>> particles; // sobreescribe el metodo
    
        void setup();
        void update();
        void draw();
    };

OffApp.cpp

    #include "ofApp.h"
    
    void ofApp::setup() {
        for (int i = 0; i < 100; ++i) {
            ofVec2f pos(ofRandomWidth(), ofRandomHeight());
            ofColor col(ofRandom(255), ofRandom(255), ofRandom(255));
            particles.push_back(std::make_unique<CircleParticle>(pos, col)); // Polimorfismo, vector de punteros inteligentes 
        }
    }
    
    void ofApp::update() {
        for (auto& p : particles) {
            p->update();  // Se ejecuta CircleParticle::update
        }
    }
    
    void ofApp::draw() {
        for (auto& p : particles) {
            p->draw();  // Se ejecuta CircleParticle::draw
        }
    }

Intenete poner otras clases con mas figuras, pero la biblioteca de openfreamworks me ponia demasiados problemas al intentar determinr su tamaño, asi que decidi dejarlo solo conc circulos, pero tecnicamente puedes seguir agregando particulas de otras formas como sus propias clases y lalmandolas como p-> Draw y p-> update para que se ejecuten

![image](https://github.com/user-attachments/assets/002abaaf-33e7-4ab3-b5c9-63c6753d39ad)
