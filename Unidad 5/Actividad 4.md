# Reto

## Primer codigo 
OffApp.cpp

        // Particle.h
        #pragma once
        #include "ofMain.h"
        
        class Particle {
        protected:
            ofVec2f position;
            ofColor color;
        
        public:
            Particle(const ofVec2f& pos, const ofColor& col)
                : position(pos), color(col) {}
        
            virtual void update() = 0;
            virtual void draw() const = 0;
        };
        
        // CircleParticle.h
        #pragma once
        #include "Particle.h"
        
        class CircleParticle : public Particle {
        public:
            CircleParticle(const ofVec2f& pos, const ofColor& col)
                : Particle(pos, col) {}
        
            void update() override {
                position.x += ofRandom(-1, 1);
                position.y += ofRandom(-1, 1);
            }
        
            void draw() const override {
                ofSetColor(color);
                ofDrawCircle(position, 5);
            }
        };
        
        // ofApp.h
        #pragma once
        #include "ofMain.h"
        #include "CircleParticle.h"
        
        class ofApp : public ofBaseApp {
        private:
            std::vector<std::unique_ptr<Particle>> particles;
        
        public:
            void setup() {
                for (int i = 0; i < 100; ++i) {
                    ofVec2f pos(ofRandomWidth(), ofRandomHeight());
                    ofColor col(ofRandom(255), ofRandom(255), ofRandom(255));
                    particles.push_back(std::make_unique<CircleParticle>(pos, col));
                }
            }
        
            void update() {
                for (auto& p : particles) {
                    p->update();
                }
            }
        
            void draw() {
                for (const auto& p : particles) {
                    p->draw();
                }
            }
        };
    
Offapp.h

      #include "ofMain.h"
    #include "CircleParticle.h"  // Clase derivada
    
    class ofApp : public ofBaseApp {
    private:
        std::vector<std::unique_ptr<Particle>> particles;
    
    public:
        void setup();
        void update();
        void draw();
    };

## Segundo Codigo 
    OffApp.Cpp
    
    // ofApp.h
    #pragma once
    #include "ofMain.h"
    #include "CircleParticle.h"
    
    class ofApp : public ofBaseApp {
    private:
        std::vector<std::unique_ptr<Particle>> particles;
    
    public:
        void setup() {
            particles.reserve(100); // Reserva de memoria
            for (int i = 0; i < 100; ++i) {
                ofVec2f pos(ofRandomWidth(), ofRandomHeight());
                ofColor col(ofRandom(255), ofRandom(255), ofRandom(255));
                particles.push_back(std::make_unique<CircleParticle>(pos, col));
            }
        }
    
        void update() {
            for (auto& p : particles) {
                p->update();
            }
        }
    
        void draw() {
            for (const auto& p : particles) {
                p->draw();
            }
        }
    };

  Offapp.h
  
      #include "ofMain.h"
    #include "CircleParticle.h"  // Clase derivada
    
    class ofApp : public ofBaseApp {
    private:
        std::vector<std::unique_ptr<Particle>> particles;
    
    public:
        void setup();
        void update();
        void draw();
    };


## Tercer codigo 
OffApp.Cpp

    // Particle.h
    #pragma once
    #include "ofMain.h"
    
    class Particle {
    protected:
        ofVec2f position;
        ofColor color;
    
    public:
        Particle(const ofVec2f& pos, const ofColor& col)
            : position(pos), color(col) {}
    
        virtual void update() {
            position += ofVec2f(ofRandom(-1, 1), ofRandom(-1, 1));
        }
    
        virtual void draw() const {
            ofSetColor(color);
            ofDrawCircle(position, 5);
        }
    };
    
    // ofApp.h
    #pragma once
    #include "ofMain.h"
    #include "Particle.h"
    
    class ofApp : public ofBaseApp {
    private:
        std::vector<Particle> particles;
    
    public:
        void setup() {
            particles.reserve(100);
            for (int i = 0; i < 100; ++i) {
                ofVec2f pos(ofRandomWidth(), ofRandomHeight());
                ofColor col(ofRandom(255), ofRandom(255), ofRandom(255));
                particles.emplace_back(pos, col);
            }
        }
    
        void update() {
            for (auto& p : particles) {
                p.update();
            }
        }
    
        void draw() {
            for (const auto& p : particles) {
                p.draw();
            }
        }
    };
    
Offapp.h

    #include "ofMain.h"
    #include "Particle.h"  // Solo tienes una clase Particle
    
    class ofApp : public ofBaseApp {
    private:
        std::vector<Particle> particles;  // Ahora son objetos, no punteros
    
    public:
        void setup();
        void update();
        void draw();
    };
