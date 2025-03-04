  # Actividad 3
    #include "ofApp.h"
    
    //--------------------------------------------------------------
    void ofApp::setup() {
        ofBackground(0);
        particleColor = ofColor::blue;
    }
    
    //--------------------------------------------------------------
    void ofApp::update() {
    
    }
    
    //--------------------------------------------------------------
    void ofApp::draw() {
        for (auto& pos : particles) {
            ofSetColor(particleColor);
            ofDrawCircle(pos.x, pos.y, 30);
        }
    }
    
    //--------------------------------------------------------------
    void ofApp::mouseMoved(int x, int y) {
        particles.push_back(ofVec2f(x, y));
        if (particles.size() > 5) {
            particles.erase(particles.begin());
        }
    }
    
    //--------------------------------------------------------------
    void ofApp::mousePressed(int x, int y, int button) {
        particleColor = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
    }

  En este codigo cambie las caracteristicas del circulo como el tamaño y el color del mismo, peor esto unicamente a su incio, pues la funcion de randomizado sigue activa al hacer click en el mause, intente cambiar la figura
  en la pantalla, pero me di cuenta de que sus caracteristicas en cuanto a su tamaño son difernetes, pues al ya no ser circulos el radio seria un problema y tendria que determinarse su tamaño de una forma distinta, por lo que
  finalmente deicdi dejarlo en su estado incial sin cmabiar demasiado. 

  ![image](https://github.com/user-attachments/assets/11a454bb-a2de-4c3f-8282-c52749a8bd36)
